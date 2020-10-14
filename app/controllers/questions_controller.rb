class QuestionsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @question = @category.questions.create(params.require(:question).permit(:question_no, :question, :opt1, :opt2, :opt3, :opt4, :answer))
    redirect_to category_path(@category)
  end

  private
    def question_params
      params.require(:question).permit(:question_no, :question, :opt1, :opt2, :opt3, :opt4, :answer)
    end
end
