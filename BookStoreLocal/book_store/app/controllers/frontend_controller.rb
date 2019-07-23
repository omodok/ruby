class FrontendController < ApplicationController
  ####初期設定
  @@kensu = 5         #1ページに表示する件数
  @@mae = 0           #先頭ページの開始添え字
  @@tugi = @@kensu    #先頭ページの次のページ
  @@pwd = "123456"    #削除用パスワード
  @@syohin_array=[]   #買い物カゴ配列
  @@zeiritu = 1.08    #消費税率

  before_action :pagenation
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:cart,:store]
  
  ####これよりアクションメソッド
  # POST /frontend/cart
  def cart
    #買い物カゴの修正開始
    if params[:m_syomei] != nil
      @@syohin_array.delete_at(params[:m_syomei].to_i)
    elsif cart_params != nil
      @@syohin_array.push(cart_params) 
    end
    #セッションの保存
    session[:cart] = @@syohin_array
    #買い物カゴの修正終了

    redirect_to ("/frontend/store") 
  end

  # GET /frontend/store
  def store
    #買い物カゴの表示開始
    if session[:cart].present?
      #セッションの取得
      @@syohin_array = session[:cart]
    elsif
      @@syohin_array = []
    end
    @syohin_array = @@syohin_array
    #買い物カゴの表示終了

    @products = Product.limit(@@kensu).offset(params[:page]).order(id: "DESC")
    @kensu=@@kensu
    @mae=@@mae
    @tugi=@@tugi
    @zeiritu=@@zeiritu
    session[:zeiritu]=@@zeiritu
  end

  # GET /frontend
  def index
    store
    @product = Product.new
  end

  # GET /frontend/new
  def new
    @product = Product.new
  end

  # GET /frontend/1
  def show
  end

  # GET /frontend/1/edit
  def edit
  end

  # PATCH/PUT /frontend/1
  def update
    if @product.update(product_params)
       redirect_to ({action: 'index'}), notice: '商品データを更新しました。' 
    else
      @products = Product.limit(@@kensu).offset(params[:page]) 
      render :index
    end
  end
  
# DELETE /frontend/1
  def destroy
    if @product.destroy
       redirect_to ({action: 'index'}), notice: '商品データを削除しました。' 
    else
      @products = Product.limit(@@kensu).offset(params[:page]) 
      render :index
    end
  end

  # POST /frontend 
  def create
    @product = Product.new(product_params)
    
    if @product.save
       redirect_to ({action: 'index'}), notice: '商品データを作成しました。' 
    else
      @products = Product.limit(@@kensu).offset(params[:page]).order(id: "DESC")
      render :index
    end
  end
  
  # POST /frontend/delete
  def delete
    id = 0...@@kensu
    id.each do |i|
      if params[i.to_s] != nil and params["sakujo"] == @@pwd
        Product.find(params[i.to_s]).destroy
      end 
    end
    
    #リダイレクト
    redirect_to "/frontend"
  end
  
  private
  ####これよりプライベートメソッド
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:store_id,:syohin,:taisyo,:hontai,:tyosya,:teisai,:naiyo,:img_path)
  end
    
  def cart_params
    params.require(:cart).permit(:id,:syomei,:hontai,:suryo)
  end
    
  def pagenation 
    kaishi = 0

    page = params[:page]

    if page!=""
      kaishi= page.to_i
    end
    
    @@tugi=kaishi+@@kensu

    if @@tugi > Product.count
      @@tugi = Product.count
    end
    
    @@mae=kaishi-@@kensu

    if @@mae < 0
      @@mae = 0
    end
  end
end


