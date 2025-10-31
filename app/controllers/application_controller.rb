class ApplicationController < ActionController::Base
  # before_action :authenticate_user! -->  Basicamente diz que o usuário deve logar, autenticar antes de qualquer ação
  def after_sign_out_path_for(resource_or_scope)
    root_path # Redireciona para o home, evitando erros
  end


  protect_from_forgery with: :exception

  before_action :authenticate_user! # Vai exigir a autenticação do usuário, menos a pagina principal
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) # Na documentação é falado sobre esse apoio brevemente. Em resumo, depois do login, ele tem que apontar para esse caminho
    bu_selections_path
  end

  def after_sign_up_path_for(resource)
    bu_selections_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :gender, :birth_date, :surname, :cpf, :cellphone ])
   devise_parameter_sanitizer.permit(:sign_in, keys: [ :name, :gender, :birth_date, :surname, :cpf ]) # Teste
  end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def warrant_booking_tk
   session[:booking_tk] ||= SecureRandom.hex(10) # Isso aqui basicamente gera um token aleatório, é seguro
  end
end

# se deslogar do user, redirecionar o usuário para o home
