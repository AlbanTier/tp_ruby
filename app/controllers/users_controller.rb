class UsersController < ApplicationController
  # GET /register
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @seller = Seller.new(@user.id)

    respond_to do |format|
      if @user.save
        if params[:user][:is_seller] == "1"
          @seller = Seller.create(user: @user)
        end
        format.html { redirect_to login_url, notice: "User was successfully created." }
        session[:user_id] = @user.id
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  def user_params
    params.require(:user).permit(:username, :password, :email, :password_confirmation)
  end
end
