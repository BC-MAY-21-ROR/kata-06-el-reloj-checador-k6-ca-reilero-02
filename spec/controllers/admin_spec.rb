require 'rails_helper'

RSpec.describe Admins::AdminController, type: :request do
  before(:all) do
  	@admin = Admin.create(password: 'ispassword')
  end
  
  describe 'check a password' do

    it 'redirect to login when the password is incorrect' do
      post "/admins/", params:{ password: 'ispasswor' }
      expect(response).to redirect_to(new_admin_path)
      follow_redirect!
      expect(response).to render_template("new")
      assert_response 200
      assert_equal flash[:danger], "Wrong password"
    end

    it 'redirect to login when the password is correct' do
      post "/admins/", params:{ password: 'ispassword' }
      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response).to render_template(:show)
      assert_response 200
      assert_equal flash[:success], "Login successfuly, Welcome Admin"
    end    
  end

  describe 'check repots admin' do
    it 'redirect to reports' do
      get "/admins/report"
      expect(response).to redirect_to(new_admin_path)
      follow_redirect!
      expect(response).to render_template(:new)
      post "/admins/", params:{ password: 'ispassword' }
      expect(response).to redirect_to("/admins/report")
    end
  end

end
