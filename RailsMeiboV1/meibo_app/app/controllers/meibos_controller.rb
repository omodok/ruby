class MeibosController < ApplicationController
  before_action :set_meibo, only: [:show, :edit, :update, :destroy]

  # GET /meibos
  # GET /meibos.json
  def index
    @meibos = Meibo.all
  end

  # GET /meibos/1
  # GET /meibos/1.json
  def show
  end

  # GET /meibos/new
  def new
    @meibo = Meibo.new
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
        format.html { render :new }
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
      params.require(:meibo).permit(:shimei, :jusyo, :denwa)
    end
end
