module ComputersHelper
	
	def current_user
    	remember_token = User.encrypt(cookies[:remember_token])
    	@current_user ||= User.find_by(remember_token: remember_token)
 	 end

 	def computer_school(computer)
      school = School.find_by(id: computer.school_id)
      school_abbr = school.abbreviation
    end
end
