class UserDowngradesController < ApplicationController
  def edit
    current_user.standard!
    # make all private wikis public
    Wiki.where("user_id = ? and private = ?", current_user, true).update_all(:private => false)
    redirect_to root_path
  end
end
