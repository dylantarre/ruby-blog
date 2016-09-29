class ProductsController < ApplicationController
  before_action  :set_product, only: [:edit, :update, :show, :kill]

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
end

def edit
end

def kill
  @product.destroy
  flash[:notice] = "Product is Dunzo"
  redirect_to products_path
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
    def set_product
      @product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit(:title, :description)
    end

end
