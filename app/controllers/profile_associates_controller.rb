class ProfileAssociatesController < ApplicationController
  before_action :warrant_booking_tk, only: [ :select_profile, :associate ]

  def select_profile
   vaccine_ids = Array(session[:selected_vaccine_ids]).map(&:to_i)

   if vaccine_ids.blank?
    redirect_to bu_selections_path, alert: "Não foi possível recuperar as vacinas selecionadas"
    return
   end

   @vaccines = Vaccine.with_profiles.where(id: vaccine_ids)

   @profiles = current_user.profiles.includes(:appointments)
   @profile = current_user.profiles.build
  end

  def associate
  profile_association = current_user.profiles.find_by(id: params[:profile_id])
  vaccine = Vaccine.find_by(id: params[:vaccine_id] || session[:selected_vaccine_ids]) # Sugestão do gpt já que não estava resgatando a vacina
  tk = session[:booking_tk]
  if !profile_association # Utilizar unless, não if... Corrigir mais tarde
    redirect_to profile_associates_path, alert: "Perfil não encontrado."

  elsif !vaccine
    redirect_to select_profile_profile_associates_path, alert: "Sinto muito, a vacina selecionada não foi encontrada"
  else
    appointment = Appointment.new(profile: profile_association, vaccine: vaccine, booking_tk: tk)
     if appointment.save
    redirect_to select_profile_profile_associates_path, notice: "#{profile_association.name} associado à #{vaccine.name}."
     else
    redirect_to select_profile_profile_associates_path, alert: "Não foi possível associar o perfil à vacina. Tente novamente."
     end
  end
  end

  def index
    @profiles = current_user.profiles.includes(:vaccines, :appointments) # Isso é parecido com Profile.all
    # @vaccines = Vaccine.find_by(id: params[vaccine_id])
    @vaccine = Vaccine.find_by(id: params[:vaccine_id]) if params[:vaccine_id].present?
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
    redirect_to profile_associates_path, notice: "Perfil criado com sucesso!"
  else
    vaccine_ids = Array(session[:selected_vaccine_ids])&.map(&:to_i)
    @vaccines = Vaccine.where(id: vaccine_ids) if vaccine_ids.present?
    render :select_profile, alert: "Não conseguimos criar seu perfil, tente novamente mais tarde"
  end
  end
end
