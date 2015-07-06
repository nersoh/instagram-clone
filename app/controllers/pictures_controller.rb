class PicturesController < ApplicationController
  before_action :set_picture, 
    only: [:show, :edit, :update, :destroy, :like, :unlike]
  after_action :verify_authorized

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
    authorize @pictures
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
    authorize @picture
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = current_user.pictures.build(picture_params)
    authorize @picture
    respond_to do |format|
      if @picture.save
        flash[:success] = 'Picture was successfully created.'
        format.html { redirect_to @picture }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        flash[:success] = 'Picture was successfully updated.'
        format.html { redirect_to @picture }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      flash[:success] = 'Picture was successfully destroyed.'
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end

  def like
    @picture.liked_by current_user
    respond_to do |format|
      format.js
    end
  end

  def unlike
    @picture.unliked_by current_user
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
      authorize @picture
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:caption, :image)
    end
end
