class BestAnswersController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    bestanswer = BestAnswer.new(answer_id: params[:answer_id])
    bestanswer.attributes = {
      post_id: params[:post_id], 
      user_id: current_user.id, 
      answer_id: params[:answer_id]
    }
    bestanswer.save 
      redirect_to post_path(post), notice: 'ベストアンサーを選択しました'
  end
end