class ApplicationController < ActionController::Base
	protect_from_forgery

	# def after_sign_in_path_for(resource)
	# 	about_path
	# end

  before_filter :set_locale
 
  private
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
