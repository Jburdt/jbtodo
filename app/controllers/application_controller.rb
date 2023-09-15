class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    return_path = stored_location_for(resource)
    return_path == root_path ? todos_path : return_path
  end
end
