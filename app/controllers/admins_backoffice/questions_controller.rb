class AdminsBackoffice::QuestionsController < AdminsBackofficeController
    before_action :find_question_by_id, only: [:edit, :update, :destroy]
    before_action :select_subjects, only: [:edit]

    def index
        @questions = Question.all().page(params[:page])
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
        params.require(:question).permit(:description, :subject_id)
    end

    def select_subjects
        @subjects = Subject.all().order(:description)
    end
    
end
