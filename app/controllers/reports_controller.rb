class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  
  def autocomplete_city_cname
    ca = City.where("name LIKE '%#{params[:term]}%'").order(:name)
    render :json => ca.map { |city| {id: city.id, label: city.cname, value: city.cname} }
  end

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    cn = params[:report][:city]
    if cn.length > 0
      c = City.where(name: cn.downcase).take
      if c == nil
        c = City.create(name: cn)
      end
      @report.city = c
    end
    @report.ip = request.remote_ip
    @report.user = current_user
    byebug
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Zgłoszenie zostało pomyślnie dodane!' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Zgłoszenie zostało pomyślnie uaktualnione!' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Zgłoszenie zostało pomyślnie usunięte!'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:title, :report_category_id, :street, :house, :short_place_desc, :descr, :image)
    end
end
