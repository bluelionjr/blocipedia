class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # private

  # def user_not_authorized(exception)
  #   #flash[:alert] = "You are not authorized to perform this action."
  #   policy_name = exception.policy.class.to_s.underscore
  #   flash[:alert] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
  #   redirect_to(request.referrer || root_path)
  # end
end
