class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]
  # Set this answers question
  before_action :set_question

  # User authentication required for answer modification
  before_action :authenticate_user!
  # Can only modify answers that belong to the logged in user
  before_action :confirm_owner, except: [:create]


  # GET questions/1/answers/1/edit
  def edit
  end

  # POST questions/1/answers
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id
    @answer.user_id = current_user.id

    respond_to do |format|
      if @answer.save
        # Notification for question author
        build_answered_notification
        format.html { redirect_to @question, notice: 'Answer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /answers/1
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @question, notice: 'Answer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to @question, notice: 'Answer was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    def confirm_owner
      if user_signed_in?
        unless current_user.isadmin
          if Answer.find(params[:id]).user_id != current_user.id
            redirect_to questions_url, alert: 'You are not allowed to modify other user\'s answers.'
          end
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:content)
    end

    # Builds a notification for the question author that their question was answered
    def build_answered_notification
      Notification.create(user_id: @question.user.id, question_id: @question.id, content: 'Your question got a new answer!')
    end
end
