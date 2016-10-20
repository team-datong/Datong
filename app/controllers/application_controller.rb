class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home
    render 'static_pages/home'
  end

  def people
    render 'static_pages/people'
  end
end
