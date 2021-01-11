class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :find_admin, only: [:update, :edit, :destroy]
  before_action :check_password, only: [:update]

  def index
    @admins = Admin.all().page(params[:page])
  end

  def new
    @admin = Admin.new()
  end

  def create

    @admin = Admin.new(admin_params)

    if @admin.save()
      redirect_to admins_backoffice_admins_path, notice: "Administrador cadastrado!"
    else
      render :new
    end

  end 

  def edit
  end

  def update

    if @admin.update(admin_params())
      redirect_to admins_backoffice_admins_path, notice: "Administrador #{@admin.id} atualizado!"
    else
      render :edit
    end

  end

  def destroy

    if @admin.destroy
      redirect_to admins_backoffice_admins_path, notice: 'Administrador excluído com sucesso!'
    else
      render :index
    end

  end
  

  private

  def find_admin
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
