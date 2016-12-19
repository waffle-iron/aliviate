class Admin::DashboardsController < Admin::BaseController
  def index
    @posts    = Post.count
    @users    = User.count
    @products = Product.count
  end
end
