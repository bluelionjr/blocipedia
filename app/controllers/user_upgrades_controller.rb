class UserUpgradesController < ApplicationController
  def edit
    current_user.premium!
    redirect_to root_path
  end
end
