class SessionsController < ApplicationController
  def new
    # Affiche le formulaire de connexion
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Vous êtes connecté."
    else
      flash.now[:alert] = "Email ou mot de passe invalide."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Vous êtes déconnecté."
  end
end
