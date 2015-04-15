class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /computers
  # GET /computers.json
  helper_method :sort_column, :sort_direction
  def index
    if current_user.admin? && !hide_others?
      @computers = Computer.search(params[:search]).category(params[:category]).order(sort_column + " " + sort_direction)
    else
      @computers = Computer.where(school_id: current_user.school_id).search(params[:search]).category(params[:category]).order(sort_column + " " + sort_direction)
    end
  end

  # GET /computers/1
  # GET /computers/1.json
  def show
  end

  # GET /computers/new
  def new
    if current_user.admin?
      @computer = Computer.new
    else
      @school = School.find_by(id: current_user.school_id)
      @computer = @school.computers.new
    end
  end

  # GET /computers/1/edit
  def edit
  end

  def Computer.search(search)
    if search
      params = []
      values = {}
      unsearchableStr = ["id", "created_at", "updated_at", "school_id"]

      column_names.each do |c|
        unless unsearchableStr.include? c
          params << "lower(#{c}) LIKE :#{c}"
          values[c.to_sym] = search.downcase
        end
      end

      paramsStr = params.join (' OR ')
      where(paramsStr,values)
    else
      all
    end
  end

  # POST /computers
  # POST /computers.json
  def create
    if current_user.admin? 
      @computer = Computer.new(computer_params)
    else
      @school = School.find_by(id: current_user.school_id)
      @computer = @school.computers.new(computer_params)
    end

    respond_to do |format|
      if @computer.save
        format.html { redirect_to new_computer_path, notice: 'Computer was successfully created.' }
        format.json { render action: 'show', status: :created, location: computers_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers/1
  # PATCH/PUT /computers/1.json
  def update
    respond_to do |format|
      if @computer.update(computer_params)
        format.html { redirect_to computers_path, notice: 'Computer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers/1
  # DELETE /computers/1.json
  def destroy
    @computer.destroy
    respond_to do |format|
      format.html { redirect_to computers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer
      @computer = Computer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computer_params
      params.require(:computer).permit(:acpsnumber, :bpinumber, :make, :computer_model, :os, :room, :servicetag, :status, :school_id, :category, :username)
    end

    def correct_user
      @computer = Computer.find(params[:id])
      unless current_user.school_id == @computer.school_id or current_user.admin?
        redirect_to computers_url, notice: "That computer isn't at your school"
      end
    end

    def Computer.category(category_params)
      if category_params
        where(category: category_params)
      else 
        Computer.all
      end
    end

    def hide_others?
      current_user.setting_hide_others
    end

    def sort_column
      Computer.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end