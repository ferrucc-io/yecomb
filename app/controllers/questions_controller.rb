class QuestionsController < ApplicationController
    before_action :authenticate_user!
    def create
        Question.create!(body: params[:body])
        redirect_to '/questions'
    end

    def index
        @questions = Question.all
    end
end
