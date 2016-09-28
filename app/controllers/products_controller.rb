class ProductsController < ApplicationController

def index
  @products = Product.all
end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product created"
      redirect_to product_path(@product)
    else
      render "new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end


def update
  @product = Product.find(params[:id])
  if @product.update(product_params)
    flash[:notice] = "Product was updated"
    redirect_to product_path(@product)
  else
    render 'edit'
  end
end

  private
    def product_params
      params.require(:product).permit(:title, :description)
    end

end
