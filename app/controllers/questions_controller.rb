class QuestionsController < ApplicationController

  # .../questions
  # show all the questions
  def index
    @questions = Question.all
  end

  # .../questions/1
  # show question 1
  def show
    #the route expects and "id" parameter
    @question = Question.find(params[:id])
  end

  # .../questions/new
  # show the form to create a new question
  def new
    @question = Question.new
  end

  # POST .../questions
  # create the question in the database
  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))

    if @question.save
       flash[:notice] = "Your question was saved!"
       redirect_to @question
    else
      flash[:notice] = "You suck! Try again :)"
       render 'new'
    end
  end

  # .../questions/1
  # show the form to update a question
  def edit
    @question = Question.find(params[:id])
  end

  # POST .../questions/1
  # update the question in the database
  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      flash[:notice] = "Your question was updated!"
      redirect_to @question
    else
      flash[:notice] = "Too Bad, you no good! Pwease twy again!"
      render :edit
    end
  end

  # .../questions/1
  # delete the question from the database
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end
end
