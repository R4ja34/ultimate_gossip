class CommentsController < ApplicationController
  before_action :require_login

  ##################################################################
  #                     create                                     #
  ##################################################################
  # Action pour afficher le formulaire de création d'un commentaire
  def new
    @comment = Comment.new
  end

  # Action pour traiter la création du commentaire
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to publication_path(@comment.publication), notice: 'Commentaire créé avec succès.'
    else
      render :new
    end
  end

  ##################################################################
  #                        read                                    #
  ##################################################################

  # Action pour afficher un commentaire spécifique
  def show
    @comment = Comment.find(params[:id])
  end

  ##################################################################
  #                        edit                                    #
  ##################################################################

  # Action pour afficher le formulaire d'édition d'un commentaire
  def edit
    @comment = Comment.find(params[:id])
  end


  # Action pour traiter la mise à jour du commentaire
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to publication_path(@comment.publication), notice: 'Commentaire mis à jour avec succès.'
    else
      render :edit
    end
  end

  ##################################################################
  #                        destroy                                 #
  #################################################################

  # Action pour supprimer un commentaire
  def destroy
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
      redirect_to publication_path(@comment.publication), notice: 'Commentaire supprimé avec succès.'
    else
      redirect_to publication_path(@comment.publication), alert: 'Vous n\'êtes pas autorisé à supprimer ce commentaire.'
    end
  end

  ##################################################################
  #                        private                                 #
  #################################################################

  private

  def comment_params
    params.require(:comment).permit(:content, :publication_id)
  end

  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: "Vous devez être connecté pour accéder à cette page."
    end
  end
end
