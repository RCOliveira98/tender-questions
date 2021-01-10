class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :set_admin, only: [:update, :edit]
  before_action :check_password, only: [:update]

  def index
    @admins = Admin.all
  end

  def edit
  end

  def update

    if @admin.update(admin_params())
      redirect_to admins_backoffice_admins_path, notice: "Admnistrador #{@admin.id} atualizado!"
    else
      render :edit
    end

  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def check_password

    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end

  end

end
