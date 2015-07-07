class AthletesController < ApplicationController
# skip_before_filter  :verify_authenticity_token
before_action :authenticate_with_token!, only: [:register]

  def signup
    @athlete = Athlete.new(username: params[:username],
                           email: params[:email],
                           password: params[:password])
    if @athlete.save
      render 'signup.json.jbuilder', status: :created
    else
      render json: { errors: @athlete.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def register
    @athlete = current_athlete
    @athlete.update(first_name: params[:first_name], last_name: params[:last_name], phone_number: params[:phone_number], home_address: params[:home_address], city: params[:city], state: params[:state], zip: params[:zip], interests: params[:interests], image_url: params[:image_url])

   # if @athlete.update
   #    render 'register.json.jbuilder'
   # else
   #   render json: { errors: @athlete.errors.full_messages }, status: :unprocessable_entity
   end
    # if @athlete.save
    #     render 'register.json.jbuilder', status: :created
    # else
    #   render json: { errors: @athlete.errors.full_messages },
    #     status: :unprocessable_entity
  # end

  def signin
    @athlete = Athlete.find_by(email: params[:email])
    passhash = Digest::SHA1.hexdigest(params[:password])
    if @athlete && passhash == @athlete.password
      render 'signin.json.jbuilder',
        status: :created
    else
      render json: { errors: @athlete.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # private
  # def password_validation(password)
  #   if password.valid?

  #   else

  # private
  # def password_encryption(password)
  #   if !password.nil? && password != ""
  #     result = Digest::SHA1.hexdigest(password)
  #   else
  #     result = nil
  #   end
  #   result
  # end
end
