class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:index]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(10).includes(:user).includes(:best_answer).recent
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.attributes = {
      user: current_user
    }
    if @post.save
      redirect_to @post, notice: '投稿しました'
    else
      render :new
    end
  end

  def show
    @best_answer = BestAnswer.find_by(post_id: params[:id])
    @answer = Answer.where(user_id: current_user.id, post_id: params[:id])
  end

  def edit
    if @post.user_id != current_user.id
      redirect_to root_path, notice: 'その操作はできません'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path notice: '投稿を削除しました'
  end
  
  private
  
  def post_params
    params.require(:post).permit(:body, :title, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end