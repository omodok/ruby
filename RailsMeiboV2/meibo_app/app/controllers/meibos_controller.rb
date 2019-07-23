class MeibosController < ApplicationController
  ####初期設定
  @@kensu = 5       #1ページに表示する件数
  @@pwd = "123456"  #削除用パスワード
  
  before_action :set_meibo, only: [:show, :edit, :update, :destroy]
  before_action :set_cookie

  ####これより自作アクション
  # POST /meibos/delete
  def delete
    id = 0...@@kensu
    id.each do |i|
      if params[i.to_s] != nil and params["sakujo"] == @@pwd
        Meibo.find(params[i.to_s]).destroy
      end 
    end
    
    #リダイレクト
    redirect_to "/meibos"
  end

  ####これよりscaffoldアクション
  # GET /meibos
  # GET /meibos.json
  def index
    @meibos = Meibo.page(params[:page]).per(@@kensu)
    @meibo = Meibo.new
  end

  # GET /meibos/1
  # GET /meibos/1.json
  def show
  end

  # GET /meibos/1/edit
  def edit
  end

  # POST /meibos
  # POST /meibos.json
  def create
    @meibo = Meibo.new(meibo_params)

    respond_to do |format|
      if @meibo.save
        format.html { redirect_to @meibo, notice: '名簿は正常に作成されました。' }
        format.json { render :show, status: :created, location: @meibo }
      else
        format.html { @meibos = Meibo.page(params[:page]).per(@@kensu) ; render :index }
        format.json { render json: @meibo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meibos/1
  # PATCH/PUT /meibos/1.json
  def update
    respond_to do |format|
      if @meibo.update(meibo_params)
        format.html { redirect_to @meibo, notice: '名簿は正常に更新されました。' }
        format.json { render :show, status: :ok, location: @meibo }
      else
        format.html { render :edit }
        format.json { render json: @meibo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meibos/1
  # DELETE /meibos/1.json
  def destroy
    @meibo.destroy
    respond_to do |format|
      format.html { redirect_to meibos_url, notice: '名簿は正常に削除されました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meibo
      @meibo = Meibo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meibo_params
      params[:meibo][:jusyo].gsub!("\r\n", "")                          # 改行を削除
      params[:meibo][:jusyo].tr!("０-９ａ-ｚＡ-Ｚ―－","0-9a-zA-Z--")   # 英数字の半角化
      params[:meibo][:denwa].tr!("０-９ａ-ｚＡ-Ｚ―－","0-9a-zA-Z--")   # 英数字の半角化
      
      params.require(:meibo).permit(:shimei, :jusyo, :denwa)
    end
    
    def set_cookie
      cok = cookies[:sakujo]
      #今回のクッキーを設定
      if params[:sakujo]
        pwdstr =params[:sakujo]
      elsif cookies[:sakujo] 
        pwdstr = cok
      else
        pwdstr = ""
      end
      
      if pwdstr != ""
        cookies[:sakujo] = { :value => pwdstr, :expires => 1.years.from_now }
      end
    end
end
