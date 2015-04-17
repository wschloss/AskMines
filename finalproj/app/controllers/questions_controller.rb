class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  # set answers array to display on show for this question
  before_action :set_answers, only: [:show]
  # set tags array to display when showing this question
  before_action :set_tags, only: [:show]

  # User authentication to change questions
  before_action :authenticate_user!, except: [:index, :show]
  # Ensure only the owner of the question can modify it
  before_action :confirm_owner, only: [:edit, :update, :destroy]

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
    # Blank answer object so a user can submit an answer
    @answer = Answer.new
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    # Current user owns this new question
    @question.user_id = current_user.id

    respond_to do |format|
      if @question.save
        # Build tag models for this question
        build_tags
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /questions/1
  def update
    respond_to do |format|
      if @question.update(question_params)
        # Rebuilds tags for this question
        build_tags
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_answers
      @answers = Question.find(params[:id]).answers
    end

    def set_tags
      @tags = Question.find(params[:id]).tags
    end

    def confirm_owner
      if user_signed_in?
        unless current_user.isadmin
          if Question.find(params[:id]).user_id != current_user.id
            redirect_to questions_url, alert: 'You are not allowed to modify other user\'s questions.'
          end
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :content)
    end

    # Builds tag model for each selected tag with this question as the owner
    def build_tags 
      # First flush all tags so a duplicate record doesn't occur
      Tag.delete(@question.tags)

      tobuild = params[:tags]
      tobuild.each do |category|
        Tag.create(question_id: @question.id, category: category)
      end unless tobuild.nil?
    end
end
