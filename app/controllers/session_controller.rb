class SessionController < ApplicationController

  def new
    redirect_to contacts_path(current_user) if user_signed_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to contacts_path(user)
    else
      flash.now[:danger] = "Email ou senhas inválidos"
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = 'Logout feito com sucesso!'
    redirect_to login_path
  end

end
