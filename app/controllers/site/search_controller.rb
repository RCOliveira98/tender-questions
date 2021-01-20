class Site::SearchController < SiteController

    def questions
        @questions = Question.select_by_description(params[:term], params[:page])
    end
    
end
