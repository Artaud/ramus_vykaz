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

    # Org chart
    data_table1 = GoogleVisualr::DataTable.new
    data_table2 = GoogleVisualr::DataTable.new
    data_table3 = GoogleVisualr::DataTable.new
    data_table4 = GoogleVisualr::DataTable.new
    # Add Column Headers
    data_table1.new_column('string', 'Nazev a kod')
    data_table1.new_column('string', 'Rodic')
    data_table1.new_column('string', 'Tooltip')
    data_table2.new_column('string', 'Nazev a kod')
    data_table2.new_column('string', 'Rodic')
    data_table2.new_column('string', 'Tooltip')
    data_table3.new_column('string', 'Nazev a kod')
    data_table3.new_column('string', 'Rodic')
    data_table3.new_column('string', 'Tooltip')
    data_table4.new_column('string', 'Nazev a kod')
    data_table4.new_column('string', 'Rodic')
    data_table4.new_column('string', 'Tooltip')
    # Add Rows and Values
    datarows = Array.new
      # Sort projects into tree structure
      Projekt.all.each do |proj|

        onerow = Array.new(3)
        onerow[0] = proj.kod.to_s + ' ' + proj.nazev  #actual node TODO add html graphics

          if proj.kod.to_s.length == 1
            parent = ''
            puts 'length 1, nazev: ' + proj.nazev + ', parent: ' + parent
          end

          if proj.kod.to_s.length == 3
            tkod = proj.kod.to_s[0,1]
            parent_proj = Projekt.find_by kod: tkod.to_i 
            puts 'length 3, nazev: ' + proj.nazev + ', parent proj: ' + parent_proj.inspect
            parent = parent_proj.kod.to_s + ' ' + parent_proj.nazev
          end

          if proj.kod.to_s.length == 4
            tkod = proj.kod.to_s[0,3]
            parent_proj = Projekt.find_by kod: tkod.to_i
            puts 'length 4, nazev: ' + proj.nazev + ', parent proj: ' + parent_proj.inspect
            parent = parent_proj.kod.to_s + ' ' + parent_proj.nazev
          end

          onerow[1] = parent      #parent node
          onerow[2] = proj.nazev  #tooltip
          datarows << onerow
    end

    datarows = datarows.sort
    
    datarows1 = datarows.select {|row| row[0][0] == '1'}
    datarows2 = datarows.select {|row| row[0][0] == '2'}
    datarows3 = datarows.select {|row| row[0][0] == '3'}
    datarows4 = datarows.select {|row| row[0][0] == '4'}
    data_table1.add_rows(datarows1)
    data_table2.add_rows(datarows2)
    data_table3.add_rows(datarows3)
    data_table4.add_rows(datarows4)
    # asdd

    option = { size: 'medium', :allowHtml => true, allowCollapse: true }
    @chart1 = GoogleVisualr::Interactive::OrgChart.new(data_table1, option)
    @chart2 = GoogleVisualr::Interactive::OrgChart.new(data_table2, option)
    @chart3 = GoogleVisualr::Interactive::OrgChart.new(data_table3, option)
    @chart4 = GoogleVisualr::Interactive::OrgChart.new(data_table4, option)
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
        format.html { redirect_to action: 'index' } # changed to render index from redirect_to @prace_polozka
        format.json { render action: 'show', status: :created, location: @prace_polozka }
        flash[:notice] = "Záznam byl vytvořen!"
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

  # def show_structure
  #   data_table = GoogleVisualr::DataTable.new

  #   # Add Column Headers
  #   data_table.new_column('string', 'nazev' )
  #   data_table.new_column('number', 'kod')
  #   # Add Rows and Values
  #   data_table.add_rows([
  #     ['Hardcoded Halvni cinnost', 13101],
  #     ['Hardcoded2005', 1170],
  #     ['Hardcoded2006', 660],
  #     ['Hardcoded2007', 1030]
  #     ])

  #   option = { width: 400, height: 240, title: 'Company Performance' }
  #   @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, option)
  # end

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
