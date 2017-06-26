class UserDowngradesController < ApplicationController
  def edit
    current_user.standard!
    redirect_to root_path
  end
end
