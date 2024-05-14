class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  #GET /product/new
  def new
    @product = Product.new
  end

  def create
    @product = current_user.seller.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_path(@product), notice: "Le produit a bien été crée" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock)
  end

end
