class AdminsBackoffice::QuestionsController < AdminsBackofficeController

    def index
        @questions = Question.all().page(params[:page])
    end
    
end
