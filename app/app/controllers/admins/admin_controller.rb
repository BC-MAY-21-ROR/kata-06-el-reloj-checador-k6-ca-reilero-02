class Admins::AdminController < ApplicationController
	def new
	end

	def create
		admin= Admin.find_by(password: params[:password])
		session[:admin_id]=admin.id unless admin.nil?
		if admin.nil?
			redirect_to '/', danger: "Wrong password"
		else
			redirect_to '/', success: "Login successfuly, Welcome Admin"
		end
	end

	def logout
		session[:admin_id]= nil
		redirect_to '/', warning: "Logged out"
	end

end

