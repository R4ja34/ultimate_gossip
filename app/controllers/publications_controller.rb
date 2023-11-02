class PublicationsController < ApplicationController

  before_action :require_login
  ##################################################################
  #                     create                                     #
  ##################################################################
  # Action pour afficher le formulaire de création d'une publication
  def new
    @publication = Publication.new
  end
  
  # Action pour traiter la création de la publication
  def create
    @publication = current_user.publications.build(publication_params)
    @publication.city = current_user.city
    if @publication.save
      redirect_to root_path, notice: 'Publication créée avec succès.'
    else
      render :new
    end
  end
  
  ##################################################################
  #                        read                                    #
  ##################################################################
  def show
    @publication = Publication.find(params[:id])
    @comments = @publication.comments
  end
  
  def index
    @publications = Publication.all
  end

  ##################################################################
  #                        edit                                    #
  ##################################################################

  def edit
    @publication = Publication.find(params[:id])
  end

  # Action pour traiter la mise à jour de la publication
  def update
    @publication = Publication.find(params[:id])
    if @publication.update(publication_params)
      redirect_to root_path, notice: 'Publication mise à jour avec succès.'
    else
      render :edit
    end
  end

  ##################################################################
  #                        destroy                                 #
  #################################################################

  def destroy
    @publication = Publication.find(params[:id])
    if current_user == @publication.user
      @publication.destroy
      redirect_to root_path, notice: 'Publication supprimée avec succès.'
    else
      redirect_to root_path, alert: 'Vous n\'êtes pas autorisé à supprimer cette publication.'
    end
  end
  
  ##################################################################
  #                        private                                 #
  #################################################################

  private

  def publication_params
    params.require(:publication).permit(:title, :content)
  end

  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: "Vous devez être connecté pour accéder à cette page."
    end
  end
end
