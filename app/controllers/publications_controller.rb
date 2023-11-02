class PublicationsController < ApplicationController

  ##################################################################
  #                     create                                     #
  ##################################################################
      # Action pour afficher le formulaire d'inscription
    def new
      @publication = Publication.new
    end
    # Action pour traiter la création de l'utilisateur
    def create
      @publication = Publication.new(user_params)
      if @publication.save
        puts @publication.id
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
      @publication = Publication.find(params[:id])
    end
    
    ##################################################################
    #                        edit                                    #
    ##################################################################
    
    
    def edit
      @publication = Publication.find(params[:id])
    end
    
    # Action pour traiter la mise à jour de l'utilisateur
    def update
      @publication = Publication.find(params[:id])
      if @publication.update(user_params)
        redirect_to root_path, notice: 'Profil mis à jour avec succès.'
      else
        render :edit
      end
    end
    
    ##################################################################
    #                        destroy                                 #
    ##################################################################
    
    
    def destroy
      @publication = Publication.find(params[:id])
      @publication.destroy
      redirect_to root_path, notice: 'publication supprimé avec succès.'
    end
  
    
    
    ##################################################################
    #                        private                                 #
    ##################################################################
  
    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city_id)#, :password, :password_confirmation)
    end

end
