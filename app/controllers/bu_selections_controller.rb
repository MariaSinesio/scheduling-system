class BuSelectionsController < ApplicationController
skip_before_action :authenticate_user!
  def index
     @vaccines = Vaccine.all
     @cart = session[:cart] || {}
  end
  def new
  end
  def show
  end
 def add_to_cart
   session[:cart] ||= {} # SÓ inicializa caso não exista
   session[:cart][params[:vaccine_id]] ||= 0 # Operador ||= define um valor padrão para uma variável caso o valor não seja atribuido inicialmente
  session[:cart][params[:vaccine_id]] += 1
  redirect_to bu_selections_path, notice: "Vacina adicionada com sucesso!"
 end
 def delete_to_cart
   session[:cart] ||= {}
  if session[:cart].blank? # Verificação antes
   redirect_to bu_selections_path, notice: "O carrinho está vazio, não é possível decrementar."
  else
   session[:cart].delete(params[:vaccine_id].to_s) # Tem que lembrar de referenciar params
   if session[:cart].blank?
      redirect_to bu_selections_path, notice: "O carrinho está vazio." # Verificação depois
   else
   redirect_to bu_selections_path, notice: "Vacina retirada com sucesso!"
   end
  end
 end
 def finalize_cart
  if session[:cart].blank?
   redirect_to bu_selections_path, notice: "O carrinho está vazio, não é possível continuar."
  else
  redirect_to bu_selection_profile_associates_path, notice: "Finalizando o pedido. Siga os próximos passos." # Ao finalizar, leva o usuário a proxima etapa.
  end
 end
end
