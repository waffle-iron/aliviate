class Admin::PostsController < Admin::BaseController

  # Callbacks

  before_action :find_post, only: [:edit, :update]

  # Methods

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    binding.pry

    if @post.save
      redirect_to admin_post_url, notice: t('created_successfully')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)

      binding.pry

      redirect_to admin_post_url, notice: t('updated_successfully')
    else

      binding.pry

      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_post_url, notice: t('deleted_successfully')
  end

  private

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :summary, :content, :published)
    end

end
