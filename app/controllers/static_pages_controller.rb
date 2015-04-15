class StaticPagesController < ApplicationController

	helper_method :sort_column, :sort_direction

	def home
		@users = User.order("name" + " " + sort_direction)
		@schools = School.order("abbreviation" + " " + sort_direction)
	end

	private 
		
		def sort_column
			
		end

    	def sort_direction
    	  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    	end
	
end
