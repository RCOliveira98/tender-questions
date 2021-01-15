class AdminsBackoffice::QuestionsController < AdminsBackofficeController
    before_action :find_question_by_id, only: [:edit, :update, :destroy]
    before_action :select_subjects, only: [:edit, :new]

    def index
        @questions = Question.includes(:subject).page(params[:page])
    end

    def new
        @question = Question.new
    end
    
    def create
        @question = Question.new(question_params())

        if @question.save()
            redirect_to admins_backoffice_questions_path, notice: "Pergunta cadastrada com sucesso!"
        else
            select_subjects()
            render :new
        end
    end
    

    def edit
    end

    def update
        if @question.update(question_params())
            redirect_to admins_backoffice_questions_path, notice: "Pergunta de ID #{@question.id} atualizada com sucesso!"
        else
            render :edit
        end
    end

    def destroy
        if @question.destroy()
            redirect_to admins_backoffice_questions_path, notice: "Pergunta de ID #{@question.id} excluída com sucesso!"
        else
            render :index
        end
    end
    
    
    private

    def find_question_by_id
        @question = Question.find(params[:id])
    end

    def question_params
        params.require(:question).permit(:description, :subject_id, answers_attributes: [:id, :description, :correct, :_destroy])
    end

    def select_subjects
        @subjects = Subject.all().order(:description)
    end
    
end
