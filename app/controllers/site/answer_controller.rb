class Site::AnswerController < SiteController
    def question
        @answer = Answer.find_by(id: params[:answer_id])
        puts ">>> #{@answer}"
    end
end
