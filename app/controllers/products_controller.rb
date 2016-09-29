class ProductsController < ApplicationController
  before_action  :set_product, only: [:edit, :update, :show, :destroy]

def index
  @products = Product.all
end

def new
  @product = Product.new
end


def create
  @product = Product.new(product_params)
  if @product.save
    flash[:success] = "Product created"
    redirect_to product_path(@product)
  else
    render "new"
  end
end

def show
end

def edit
end

def destroy
  @product.destroy
  flash[:danger] = "Product is Dunzo"
  redirect_to products_path
end

def update
  @product = Product.find(params[:id])
  if @product.update(product_params)
    flash[:success] = "Product was updated"
    redirect_to product_path(@product)
  else
    render 'edit'
  end
end

  private
    def set_product
      @product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit(:title, :description)
    end

end
