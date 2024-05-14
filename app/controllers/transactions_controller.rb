class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show_buyer
      @transaction_order = current_user.buyer.transactions
  end

  def seller_order
    @transactions = Transaction.where(seller_id: params[:seller_id])
  end
  def create
    @product = Product.find(params[:product_id])
    @transaction = current_user.buyer.transactions.build(product: @product, quantity: params[:quantity])
    if @product.stock >= @transaction.quantity
      if @transaction.save
        @product.update(stock: @product.stock - @transaction.quantity)
        redirect_to @product, notice: "Commande prise en compte."
      else
        render 'products/show', alert: "Impossible de prendre en compte la commande."
      end
    else
      render 'products/show', alert: "La quantité souhaité est supérieur au stock du produit."
    end
  end
end