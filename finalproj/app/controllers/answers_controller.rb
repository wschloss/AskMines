class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # Set this answers question
  before_action :set_question

  # GET questions/1/answers/1/edit
  def edit
  end

  # POST questions/1/answers
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id

    respond_to do |format|
      if @answer.save
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:content)
    end
end
