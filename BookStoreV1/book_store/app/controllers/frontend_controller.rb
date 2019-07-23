class FrontendController < ApplicationController
  ####初期設定
  @@kensu = 5       #1ページに表示する件数
  @@mae = 0         #先頭ページの開始添え字
  @@tugi = @@kensu  #先頭ページの次のページ
  @@pwd = "123456"  #削除用パスワード

  before_action :pagenation
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  ####これよりアクションメソッド
  # GET /frontend/store
  def store
    @products = Product.limit(@@kensu).offset(params[:page]).order(id: "DESC")
    @kensu=@@kensu
    @mae=@@mae
    @tugi=@@tugi
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


