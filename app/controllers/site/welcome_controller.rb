class Site::WelcomeController < SiteController
  def index
    @questions = Question.select_the_last_items(params[:page])
  end
end
