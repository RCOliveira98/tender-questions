class AdminsBackoffice::SubjectsController < AdminsBackofficeController
    before_action :find_subject, only: [:destroy, :edit, :update]

    def index
        @subjects = Subject.all().page(params[:page])
    end

    def new
        @subject = Subject.new
    end

    def create
        @subject = Subject.new(subject_params())

        if @subject.save()
            redirect_to admins_backoffice_subjects_path, notice: "Assunto/área #{@subject.description} cadastrado com sucesso!"
        else
            render :new
        end
    end

    def edit
    end

    def update
        
        if @subject.update(subject_params())
            redirect_to admins_backoffice_subjects_path, notice: "Assunto/área #{@subject.description} (id #{@subject.id}) atualizado com sucesso!"
        else
            render :edit
        end

    end
    
    

    def destroy
        if @subject.destroy
            redirect_to admins_backoffice_subjects_path, notice: "Assunto/área #{@subject.description} (#{@subject.id}) excluído com sucesso!"
        else
            render :index
        end
    end
    

    private

    def subject_params
        params.require(:subject).permit(:description)
    end

    def find_subject
        @subject = Subject.find(params[:id])
    end
    
    
    
    
end
