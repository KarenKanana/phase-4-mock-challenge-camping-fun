class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        @signups = Signup.all
        render json: @signups, status: :ok
    end
    def show
        @signup = Signup.find(params[:id])
        render json: @signup, status: :ok
    end
    def create
        signup= Signup.create(signup_params)
        if signup.valid?
        render json: signup, status: :created
        else
        render json: {errors: signup.errors.full_messages}, status: :unprocessable_entity
        end
    end

    # def update
    #     @signup = Signup.find(params[:id])
    #     @signup.update(signup_params)
    #     if @signup.valid?
    #         redirect_to signup_path(@signup)
    #     else
    #         flash[:errors] = @signup.errors.full_messages
    #         redirect_to edit_signup_path(@signup)
    #     end
    # end
    def destroy
        @signup = Signup.find(params[:id])
        @signup.destroy
        redirect_to signups_path
    end

    private
    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def render_not_found_response
        render json: { error: "Signup not found" }, status: :not_found
    end
    
end
