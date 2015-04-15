class SchoolsController < ApplicationController
	before_action :signed_in_user
	before_action :admin_user, only:[:new, :create, :destroy, :edit, :update]

	helper_method :sort_column, :sort_direction
	
	def index
		@schools = School.order(sort_column + " " + sort_direction)
	end

	def create
		@school = School.new(school_params)
		if @school.save
			redirect_to root_url
			flash[:success] = "School Created"
		else
			render "new"
		end
	end

	def update
		@school = School.find(params[:id])
		if @school.update_attributes(school_params)
     		flash[:success] = "School Updated"
     		redirect_to root_url
     	else 
     		render "edit"
		end
	end

	def destroy
	end

	def new
		@school = School.new
	end

	def edit
		@school = School.find(params[:id])
	end

	private 

		def school_params
			params.require(:school).permit(:abbreviation, :code, :name, :phone, :address)
		end

		def sort_column
  			Computer.column_names.include?(params[:sort]) ? params[:sort] : "id"
  		end

  		def sort_direction
  			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  		end
end
