class ProductsController < ApplicationController
  before_action :current_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order(created_at: :asc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
        redirect_to products_path
        flash[:notice] = "Producto creado satisfactoriamente"
      else
        render :new
    end    
  end

  def edit  
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Producto actualizado satisfactoriamente"
      redirect_to products_path(@product)
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = "Producto actualizado satisfactoriamente"  
      redirect_to products_path
    end  
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end

  def current_product
    @product = Product.find(params[:id])
  
  end


end
