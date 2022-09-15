class ReportController < ApplicationController
  def index
  	@active_employees = Employee.where("status = true")    
    @monthly_logs = DailyLog.where("EXTRACT(MONTH FROM day) = 9").joins(:employee ).where(" employees.status = true ")
    @reports = @monthly_logs.count -(@active_employees.count*Time.days_in_month(Time.current.month))
    @employeeday = @monthly_logs.where(" EXTRACT(DAY FROM day) = 14 ").count - @active_employees.count
  end
end
