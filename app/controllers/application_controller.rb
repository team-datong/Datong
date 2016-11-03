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

  def events
    render 'static_pages/events'
  end
  
  def contact_us
    render 'static_pages/contact_us'
  end
end
