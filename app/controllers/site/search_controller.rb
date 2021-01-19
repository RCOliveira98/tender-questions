class Site::SearchController < SiteController

    def questions
        @questions = Question.includes(:answers)
        .where("lower(description) LIKE ?", "%#{get_params_term().downcase}%")
        .page(params[:page])
    end

    private

    def get_params_term
        params[:term]
    end
    
    
end
