class EntryController < ApplicationController    
    def create
        return if Entry.find_by(email: params[:email])
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
        if current_user
            @count = Entry.all.count
            @entries = Entry.all
        end
    end

    def success

    end
end
