class BackendController < ApplicationController
  ####初期設定
  @@kensu = 5       #1ページに表示する件数
  @@mae = 0         #先頭ページの開始添え字
  @@tugi = @@kensu  #先頭ページの次のページ
  @@pwd = "123456"  #削除用パスワード

  before_action :pagenation
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  
  ####これよりアクションメソッド
  # GET /backend
  def index
    @orders = Order.limit(@@kensu).offset(params[:page]).order(id: "DESC")
    @order = Order.new
    @kensu=@@kensu
    @mae=@@mae
    @tugi=@@tugi
  end

  # GET /backend/new
  def new
    #買い物カゴの表示開始
    if session[:cart].present?
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
  end

  # PATCH/PUT /backend/1
  def update
    if @order.update(order_params)
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
    @order = Order.new(order_params)
    if @order.save
      session[:cart],session[:gokei],session[:gokei2],session[:zeikomi]=nil
    else
      redirect_to ("/backend/new"), notice: 'データを確認してください。' 
    end
  end
    
  # POST /backend/delete
  def delete
    id = 0...@@kensu
    id.each do |i|
      if params[i.to_s] != nil and params["sakujo"] == @@pwd
        Order.find(params[i.to_s]).destroy
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

