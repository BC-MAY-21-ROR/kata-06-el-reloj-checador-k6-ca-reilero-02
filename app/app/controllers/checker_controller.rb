class CheckerController < ApplicationController
	def show
	end

	def register
		@employee = Employee.find_by(id_employee: params[:id_employee])
		if @employee.nil?
			redirect_to '/', danger: 'Employee not found'
		elsif !@employee.status
			redirect_to '/', warning: 'Employee not active'
		else
			@date = Date.current

			@log = DailyLog.find_by(day: @date, employee: @employee)

			if @log.nil?
				DailyLog.create(day: @date, check_in: Time.now, employee: @employee )
				redirect_to '/', success: 'successfully checker'
			elsif @log.check_out.nil?
				@log.update(check_out: Time.now)
				redirect_to '/', success: 'successfully checker'
			else
				redirect_to '/', warning: 'Employee had already checked out'
			end
		end
	end

end
