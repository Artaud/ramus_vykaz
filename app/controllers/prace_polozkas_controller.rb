class PracePolozkasController < ApplicationController
  before_action :set_prace_polozka, only: [:show, :edit, :update, :destroy]
  # GET /prace_polozkas
  # GET /prace_polozkas.json
  def index
    @prace_polozkas = PracePolozka.all
    if signed_in?
      @aktualni_hodiny = PracePolozka.where(osoba_id: current_user.osoba_id).sum('hodiny')
    end
  end

  # GET /prace_polozkas/1
  # GET /prace_polozkas/1.json
  def show
  end

  # GET /prace_polozkas/new
  def new
    @prace_polozka = PracePolozka.new
    projektsort
  end

  # GET /prace_polozkas/1/edit
  def edit
    projektsort
  end

  # POST /prace_polozkas
  # POST /prace_polozkas.json
  def create
    @prace_polozka = PracePolozka.new(prace_polozka_params)

    respond_to do |format|
      if @prace_polozka.save
        format.html { redirect_to @prace_polozka, notice: 'Zaznam byl vytvoren.' }
        format.json { render action: 'show', status: :created, location: @prace_polozka }
      else
        format.html { render action: 'new' }
        format.json { render json: @prace_polozka.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prace_polozkas/1
  # PATCH/PUT /prace_polozkas/1.json
  def update
    respond_to do |format|
      if @prace_polozka.update(prace_polozka_params)
        format.html { redirect_to @prace_polozka, notice: 'Zaznam byl zmenen.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prace_polozka.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prace_polozkas/1
  # DELETE /prace_polozkas/1.json
  def destroy
    @prace_polozka.destroy
    respond_to do |format|
      format.html { redirect_to prace_polozkas_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_prace_polozka
    @prace_polozka = PracePolozka.find(params[:id])
  end
  
  def projektsort
    @projekts = Projekt.all.collect {|p| [p.nazev, p.id]}.sort
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def prace_polozka_params
    params.require(:prace_polozka).permit(:osoba_id, :projekt_id, :datum, :obsah, :hodiny)
  end
end
