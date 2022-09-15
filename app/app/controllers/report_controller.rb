class ReportController < ApplicationController
  def index
  	# @dailylog = DailyLog.All
  	@active_employees = Employee.where("status = true")
    # @reports = @dailylog.where("EXTRACT(MONTH FROM day) = 9").joins("INNER JOIN employees ON employees.status = true").count -(Employee.where("status = true")*Time.days_in_month(Time.current.month))
    @monthly_logs = DailyLog.where("EXTRACT(MONTH FROM day) = 9").joins(:employee ).where(" employees.status = true ")
    @reports = @monthly_logs.count -(@active_employees.count*Time.days_in_month(Time.current.month))
    # @reportday = @dailylog DailyLog.where("EXTRACT(MONTH FROM day) = 9 and EXTRACT(DAY FROM day) = 14 ").left_joins("INNER JOIN employees ON employees.status = true").to_a.count -(Employee.where("status = true").to_a.count)
    # @employeeday = DailyLog.where("EXTRACT(MONTH FROM day) = 9 and EXTRACT(DAY FROM day) = 14 ").joins(:employee ).where(" employees.status = true ").count -(@active_employees.count)
    @employeeday = @monthly_logs.where(" EXTRACT(DAY FROM day) = 14 ").count - @active_employees.count
  end

end
