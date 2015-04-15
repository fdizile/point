module StaticPagesHelper

	private
		def computer_count
			@school = School.find_by(id: current_user.school_id)
			@school.computers.count
		end
end
