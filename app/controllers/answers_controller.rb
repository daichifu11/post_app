class AnswersController < ApplicationController
  before_action :set_post, only: [:new, :create, :show, :edit, :update]
  before_action :set_answer, only: [:show, :edit, :update]

  def new
    @answer = Answer.new
    if @post.user_id == current_user.id
      redirect_to root_path, notice: '自分の投稿に回答はできません'
    end
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.attributes = {
      post_id: params[:post_id], 
      user_id: current_user.id
    }
    if @answer.save
      redirect_to @answer.post, notice: '回答しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @answer.user_id != current_user.id
      redirect_to root_path, notice: 'その操作はできません'
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to "/posts/#{@answer.post.id}", notice: '回答を更新しました'
    else
      render :edit
    end
  end

  

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
