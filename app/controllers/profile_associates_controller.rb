class ProfileAssociatesController < ApplicationController
  def select_profile
  vaccine_ids = session[:selected_vaccine_ids]&.map(&:to_i)

  if vaccine_ids.blank?
    redirect_to bu_selections_path, alert: "Não foi possível recuperar as vacinas selecionadas"
    return
  end

  @vaccines = Vaccine.where(id: vaccine_ids)

  if @vaccines.empty?
    redirect_to bu_selections_path, alert: "Nenhuma vacina encontrada, tente novamente"
    return
  end

  @profile = current_user.profiles.build # Forms
  end

  def profile_params
    params.require(:profile).permit(:name, :relations, :gender, :birth_date, :surname, vaccine_ids: [])
  end

  def index
    @profiles = current_user.profiles.includes(:vaccines) # Isso é parecido com Profile.all
  end

  def new
    @profile = current_user.profiles.build # Uso comum em tutoriais, é uma forma mais rails de escrever
    # @user = User.find(params[:user_cpf]) if params[:user_cpf].present?
  end
  def create
 @profile = current_user.profiles.build(profile_params) # new profile(profile_params) é equivalente a isso
 @profile.vaccine_ids = session[:selected_vaccine_ids] if session[:selected_vaccine_ids].present? # Só verificando

  if @profile.save
    session[:cart] = {}
    session[:selected_vaccine_ids] = nil
    redirect_to profile_associates_path, notice: "Perfil criado com sucesso!"
  else
    vaccine_ids = session[:selected_vaccine_ids]&.map(&:to_i)
    @vaccines = Vaccine.where(id: vaccine_ids) if vaccine_ids.present?
    render :select_profile, alert: "Não conseguimos criar seu perfil, tente novamente mais tarde"
  end
  end
end
