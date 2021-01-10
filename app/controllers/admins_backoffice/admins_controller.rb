class AdminsBackoffice::AdminsController < AdminsBackofficeController
  def index
    @admins = Admin.all
  end

  def edit
    @admin = find_param_by_id()
  end

  def update
    @admin = find_param_by_id()

    if @admin.update(strong_paramenters())
      redirect_to admins_backoffice_admins_path, notice: "Admnistrador #{@admin.id} atualizado!"
    else
      render :edit
    end

  end

  private
  def find_param_by_id
    Admin.find(params[:id])
  end

  def strong_paramenters
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
  

end
