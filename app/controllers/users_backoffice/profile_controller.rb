class UsersBackoffice::ProfileController < UsersBackofficeController
  before_action :find_user_by_id, only: %i[edit update]
  before_action :verify_password, only: %i[update]
  
  def edit
    @user.build_user_profile if @user.user_profile.blank?
  end

  def update
    if @user.update(params_user)
      redirect_to users_backoffice_profile_path, notice: "Usuário atualizado com sucesso!"
    else
      render :edit
    end
  end

  private

  def find_user_by_id
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
      user_profile_attributes: [:id, :gender, :address, :birthdate, :avatar])
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end

end
