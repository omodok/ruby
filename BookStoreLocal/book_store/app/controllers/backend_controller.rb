require "bundler/setup"
require "payjp"

class BackendController < ApplicationController
  ####初期設定
  @@kensu = 5       #1ページに表示する件数
  @@mae = 0         #先頭ページの開始添え字
  @@tugi = @@kensu  #先頭ページの次のページ
  @@pwd = "123456"  #削除用パスワード

  before_action :pagenation
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  Payjp::api_key = "sk_test_f676c46bd5891438b4724946"   #秘密鍵
  
  ####これよりアクションメソッド
  # GET /backend
  def index
    @orders = Order.limit(@@kensu).offset(params[:page]).order(id: "DESC")
    @order = Order.new
    @kensu=@@kensu
    @mae=@@mae
    @tugi=@@tugi
  end

  #CSV書き出し
  def orders_to_csv
    @orders = Order.all
  end

  # GET /backend/new
  def new
    @action = :create
    @submit = "購入"
    #買い物カゴの表示開始
    if params['payjp-token'].present?
      ####カードトークンを用いて顧客IDを作成する
      begin
        kekka = Payjp::Customer.create(
          email:    current_user.email,
          card:     params['payjp-token'],
        )
      rescue => e
        logger.error e
      end

      #1人分Userへ挿入
      user = User.find(current_user.id)
      user.cus_id = kekka["id"]
      user.last4 = kekka["cards"]["data"][0]["last4"]
      user.meigi = kekka["cards"]["data"][0]["name"]

      #挿入userの保存
      if user.save and kekka["id"].present?
        redirect_to ("/backend/new"), notice: 'カードを登録しました。' 
      else
        redirect_to ("/frontend/store"), notice: 'カードが登録できません。' 
      end
    elsif params['card']=="sakujo"
      #Pay.jp内の「顧客ID」を削除する
      begin
        customer = Payjp::Customer.retrieve(current_user.cus_id)
        customer.delete
      rescue => e
        logger.error e
      end

      #User内も削除する
      user = User.find(current_user.id)
      user.cus_id = ""
      user.last4 = ""
      user.meigi = ""

      #Userの保存
      if user.save
        redirect_to ("/frontend/store") , notice: 'カードを削除しました。'
      end
    elsif not current_user.cus_id.present?
       redirect_to ("/checkout.html") 
    elsif session[:cart].present? and current_user.cus_id.present?
      #セッションの取得
      @syohin_array = session[:cart]
      @order = Order.new
      @zeiritu=session[:zeiritu].to_f
    else
       redirect_to ("/frontend/store"), notice: '注文データがありません。' 
    end
    #買い物カゴの表示終了
  end

  # GET /backend/1
  def show
  end

  # GET /backend/1/edit
  def edit
    @action = :update
    @submit = "更新"
  end

  # PATCH/PUT /backend/1
  def update
    if @order.update(order_params)
      session[:gokei],session[:gokei2],session[:zeikomi]=nil
      redirect_to ({action: 'index'}), notice: '注文データを更新しました。' 
    else
      @orders = Order.limit(@@kensu).offset(params[:page]) 
      render :index
    end
  end
  
  # DELETE /backend/1
  def destroy
    if @order.destroy
       redirect_to ({action: 'index'}), notice: '注文データを削除しました。' 
    else
      @orders = Order.limit(@@kensu).offset(params[:page]) 
      render :index
    end
  end

  # POST /backend 
  def create
    begin
      ####顧客IDを用いて支払いをする
      kekka = Payjp::Charge.create(
        amount:   session[:zeikomi],
        customer: current_user.cus_id,
        currency: 'jpy'
      )
    rescue => e
      logger.error e
      kekka = {"id":""}
    end

    @order = Order.new(order_params)
    if @order.save and kekka["id"].present?
      session[:cart],session[:gokei],session[:gokei2],session[:zeikomi]=nil
    else
      if kekka.present?
        begin
          ####支払いIDを用いて返金する
          kekka = Payjp::Charge.retrieve(kekka["id"])
          kekka.refund
        rescue => e
          logger.error e
         end
      else
        Order.find(@order.id).destroy
      end
      redirect_to ("/backend/new"), notice: 'お支払いエラーです。' 
    end
  end
    
  # POST /backend/delete
  def delete
    id = 0...@@kensu
    id.each do |i|
      if params[i.to_s] != nil and params["sakujo"] == @@pwd
        order=Order.find(params[i.to_s])
        if params["checktype"] == "delete"
          order.destroy
        elsif params["checktype"] == "sended"
          order.sended_at = DateTime.now
          order.save
        end
      end 
    end
    
    #リダイレクト
    redirect_to "/backend"
  end
  
  private
  ####これよりプライベートメソッド
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    if session[:cart].present?
      #セッションの取得
      sArray = session[:cart].dup
      sArray = sArray.push([session[:gokei],session[:gokei2],session[:zeikomi]])
      params[:order][:syohin] = sArray.to_json
    end
    params.require(:order).permit(:syohin, :jusyo, :shimei, :denwa, :mailadd, :seibetu, :nenrei)
  end
  
  def pagenation 
    kaishi = 0

    page = params[:page]

    if page!=""
      kaishi= page.to_i
    end
    
    @@tugi=kaishi+@@kensu

    if @@tugi > Order.count
      @@tugi = Order.count
    end
    
    @@mae=kaishi-@@kensu

    if @@mae < 0
      @@mae = 0
    end
  end
end

