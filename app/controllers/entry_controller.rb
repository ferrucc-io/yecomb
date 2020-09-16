class EntryController < ApplicationController    
    def create
        return if Entry.find_by(email: params[:email])
        return unless is_valid_email?(params[:email])
        questions = Question.all.to_a
        entry = Entry.create!(email: params[:email])
        questions.map { |question| Answer.create!(body: params[question.id.to_s], entry: entry, question: question) }
        redirect_to "/success"
    end

    def show
        redirect_to login_path unless current_user
        entry = Entry.find(params[:id])
        @email = entry.email
        @answers = entry.answers.map{ |e| e.body }
    end

    def new
        @questions = Question.all
    end

    def index
        return unless current_user
        @count = Entry.all.count
        @entries = Entry.all
    end

    def success
    end

    private def is_valid_email?(email)
        (email =~ URI::MailTo::EMAIL_REGEXP)
    end
end
