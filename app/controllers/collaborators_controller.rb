class CollaboratorsController < ApplicationController
  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator_user = User.find_by_email(params[:collaborator])
    @wiki = Wiki.find(params[:wiki_id])

    if @wiki.collaborators.exists?(user_id: @collaborator_user.id)
      flash[:notice] = "#{@collaborator_user.email} is already a collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: @collaborator_user.id)
      if @collaborator.save
        flash[:notice] = "#{@collaborator_user.email} was added as a collaborator."
        redirect_to edit_wiki_path(@wiki)
      else
        flash[:alert] = "There was an error adding this collaborator. Please try again."
        redirect_to edit_wiki_path(@wiki)
      end
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    @collaborator_user = User.find(@collaborator.user_id)

    if @collaborator.destroy
      flash[:notice] = "#{@collaborator_user.email} was removed as a collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:alert] = "There was an error removing this collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end







# class CollaboratorsController < ApplicationController
#   before_action :set_collaborator, only: [:show, :edit, :update, :destroy]
#
#   def index
#     @collaborators = Collaborator.all
#   end
#
#   def show
#   end
#
#   def new
#     @collaborator = Collaborator.new
#   end
#
#   def edit
#   end
#
#   def create
#     @collaborator = Collaborator.new(collaborator_params)
#
#     if @collaborator.save
#       redirect_to @collaborator, notice: 'Collaborator was successfully added.'
#     else
#       render :new
#     end
#   end
#
#   def update
#     if @collaborator.update(collaborator_params)
#       redirect_to @collaborator, notice: 'Collaborator was successfully updated.'
#     else
#       render :edit
#     end
#   end
#
#   def destroy
#     @collaborator.destroy
#     redirect_to collaborators_url, notice: 'Collaborator was successfully removed.'
#   end
#
#   private
#
#   def set_collaborator
#     @collaborator = Collaborator.find(params[:id])
#   end
#
#   def collaborator_params
#     params.require(:collaborator).permit(:user_id, :wiki_id)
#   end
# end
