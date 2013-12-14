class CardPagesController < ApplicationController
  before_action :set_card_page, only: [:show, :edit, :update, :destroy]

  # GET /card_pages
  # GET /card_pages.json
  def index
    @card_pages = CardPage.all
  end

  # GET /card_pages/1
  # GET /card_pages/1.json
  def show
  end

  # GET /card_pages/new
  def new
    @card_page = CardPage.new
  end

  # GET /card_pages/1/edit
  def edit
  end

  # POST /card_pages
  # POST /card_pages.json
  def create
    @card_page = CardPage.new(card_page_params)

    respond_to do |format|
      if @card_page.save
        format.html { redirect_to @card_page, notice: 'Card page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @card_page }
      else
        format.html { render action: 'new' }
        format.json { render json: @card_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_pages/1
  # PATCH/PUT /card_pages/1.json
  def update
    respond_to do |format|
      if @card_page.update(card_page_params)
        format.html { redirect_to @card_page, notice: 'Card page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @card_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_pages/1
  # DELETE /card_pages/1.json
  def destroy
    @card_page.destroy
    respond_to do |format|
      format.html { redirect_to card_pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_page
      @card_page = CardPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_page_params
      params.require(:card_page).permit(:name, :link)
    end
end
