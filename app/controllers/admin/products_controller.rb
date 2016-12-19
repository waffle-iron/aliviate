class Admin::ProductsController < Admin::BaseController

  # Callbacks

  before_action :find_product, only: [:edit, :update, :destroy]

  # Methods

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    if @product.save
      redirect_to admin_products_url, notice: t('created_successfully')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_url, notice: t('updated_successfully')
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_url, notice: t('deleted_successfully')
  end

  # Private methods

  private

    def find_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity)
    end
end
