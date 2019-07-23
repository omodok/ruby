class BlogsController < ApplicationController
  ####初期設定
  @@kensu = 5       #1ページに表示する件数
  @@mae = 0         #先頭ページの開始添え字
  @@tugi = @@kensu  #先頭ページの次のページ
  @@pwd = "123456"  #削除用パスワード

  before_action :pagenation

  ####これよりアクションメソッド
  # GET /blogs
  def index
    @blogs = Blog.limit(@@kensu).offset(params[:page]).order(id: "DESC")
    @blog = Blog.new
    @kensu=@@kensu
    @mae=@@mae
    @tugi=@@tugi
  end
  
  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
       redirect_to ({action: 'index'}), notice: 'ブログ掲示板は正常に作成されました。' 
    else
      @blogs = Blog.limit(@@kensu).offset(params[:page]).order(id: "DESC") 
      render :index
    end
  end
  
  # POST /blogs/delete
  def delete
    id = 0...@@kensu
    id.each do |i|
      if params[i.to_s] != nil and params["sakujo"] == @@pwd
        Blog.find(params[i.to_s]).destroy
      end 
    end
    
    #リダイレクト
    redirect_to "/blogs"
  end
  
  private
  ####これよりプライベートメソッド
  def blog_params
    params.require(:blog).permit(:shimei,:subject,:message,:mailadd,:img_path)
  end
  
  def pagenation 
    kaishi = 0

    page = params[:page]

    if page!=""
      kaishi= page.to_i
    end
    
    @@tugi=kaishi+@@kensu

    if @@tugi > Blog.count
      @@tugi = Blog.count
    end
    
    @@mae=kaishi-@@kensu

    if @@mae < 0
      @@mae = 0
    end
  end
end
