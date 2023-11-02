class UsersController < ApplicationController
##################################################################
#                     create                                     #
##################################################################
    # Action pour afficher le formulaire d'inscription
  def new
    @user = User.new
  end
  # Action pour traiter la création de l'utilisateur
  def create
    @user = User.new(user_params)
    if @user.save
      puts @user.id
      # Rediriger l'utilisateur après la création
      redirect_to root_path , notice: 'Utilisateur créé avec succès.' #renvoie a a la fiche didentiter du user crée pour linstant
    else
      render :new
    end
  end

  ##################################################################
  #                        read                                    #
  ##################################################################
  def show
    @user = User.find(params[:id])
  end
  
  
  ##################################################################
  #                        edit                                    #
  ##################################################################
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  # Action pour traiter la mise à jour de l'utilisateur
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: 'Profil mis à jour avec succès.'
    else
      render :edit
    end
  end
  
  ##################################################################
  #                        destroy                                 #
  ##################################################################
  
  
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to root_path, notice: 'Utilisateur supprimé avec succès.'
  # end

  
  
  ##################################################################
  #                        private                                 #
  ##################################################################

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city_id, :password, :password_confirmation)
  end
end

def require_login
  unless logged_in?
    redirect_to new_session_path, alert: "Vous devez être connecté pour accéder à cette page."
  end
end
