class UsersController < ApplicationController
  ####初期設定
  @@kensu = 5           #1ページに表示する件数
  @@mae = 0             #先頭ページの開始添え字
  @@tugi = @@kensu  #先頭ページの次のページ

  before_action :pagenation
  before_action :set_user, only: [:edit, :update]
  before_action :authenticate_user!
  
  ####これよりアクションメソッド
  # GET /backend
  def index
    @users = User.limit(@@kensu).offset(params[:page])
    @kensu=@@kensu
    @mae=@@mae
    @tugi=@@tugi
  end

  def edit
  end

  # POST /users/1
  def update
    if @user.update_attribute(:admin,params[:user][:admin])
       redirect_to ({action: 'index'}), notice: '「admin」を更新しました。' 
    else
       redirect_to ({action: 'index'}), notice: '「admin」を更新できませんでした。' 
    end
  end
  
  private  ####これよりプライベートメソッド
  def set_user
    @user = User.find(params[:id])
  end
    
  def pagenation 
    kaishi = 0

    page = params[:page]

    if page!=""
      kaishi= page.to_i
    end
    
    @@tugi=kaishi+@@kensu

    if @@tugi > User.count
      @@tugi = User.count
    end
    
    @@mae=kaishi-@@kensu

    if @@mae < 0
      @@mae = 0
    end
  end
end
