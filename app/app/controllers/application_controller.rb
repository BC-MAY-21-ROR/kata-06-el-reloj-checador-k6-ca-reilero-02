class ApplicationController < ActionController::Base
  include Pagy::Backend
  add_flash_types :success, :warning, :danger, :info
end
