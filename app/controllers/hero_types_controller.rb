class HeroTypesController < ApplicationController
  before_action :set_hero_type, only: [:show, :edit, :update, :destroy]

  # GET /hero_types
  # GET /hero_types.json
  def index
    @hero_types = HeroType.all
  end

  # GET /hero_types/1
  # GET /hero_types/1.json
  def show
  end

  # GET /hero_types/new
  def new
    @hero_type = HeroType.new
  end

  # GET /hero_types/1/edit
  def edit
  end

  # POST /hero_types
  # POST /hero_types.json
  def create
    @hero_type = HeroType.new(hero_type_params)

    respond_to do |format|
      if @hero_type.save
        format.html { redirect_to @hero_type, notice: 'Hero type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hero_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @hero_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hero_types/1
  # PATCH/PUT /hero_types/1.json
  def update
    respond_to do |format|
      if @hero_type.update(hero_type_params)
        format.html { redirect_to @hero_type, notice: 'Hero type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hero_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hero_types/1
  # DELETE /hero_types/1.json
  def destroy
    @hero_type.destroy
    respond_to do |format|
      format.html { redirect_to hero_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero_type
      @hero_type = HeroType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hero_type_params
      params.require(:hero_type).permit(:name, :link)
    end
end
