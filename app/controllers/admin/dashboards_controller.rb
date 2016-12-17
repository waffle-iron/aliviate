class Admin::DashboardsController < Admin::BaseController
  def index
    @posts   = Post.count
    @users   = User.count
    @product = Product.count
  end
end
