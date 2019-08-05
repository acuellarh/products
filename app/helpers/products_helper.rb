module ProductsHelper
  def form_title
    @product.new_record? ? "Crear Producto" : "Modificar Producto"    
  end    
end
