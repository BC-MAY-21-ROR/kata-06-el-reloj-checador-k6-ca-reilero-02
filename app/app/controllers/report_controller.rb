class ReportController < ApplicationController
  def index
    @reports = DailyLog.search_by_month(Time.current.month).joins(:employee).merge(Employee.active_employees)
    @starting_year = 1990
    @current_year = Time.current.year
  end

  def search_by_day
  	@reports = DailyLog.search_by_month(9).search_by_day(15).joins(:employee).merge(Employee.active_employees)
  end

  def search_by_month
  	@reports = DailyLog.search_by_month(9).joins(:employee).merge(Employee.active_employees)
  end
end
