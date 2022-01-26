class ApplicationController < ActionController::Base
  def current_user
    Users.first
  end
end
