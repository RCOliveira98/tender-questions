class Site::SearchController < SiteController

    def questions
        @questions = Question.select_by_description(params[:term], params[:page])
    end

    def subject
        @questions = Question.select_by_subject(params[:subject_id], params[:page])
    end
    
end
