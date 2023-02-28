class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_message

    def index
        scientists = Scientist.all
        render json: scientists, status: :ok
    end

    def show
        scientist = find_scientist
        render json: scientist, include: ['planets'], status: :ok
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = find_scientist
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy
        scientist = find_scientist
        scientist.destroy
        head :no_content, status: :no_content
    end

    private

    def find_scientist
        Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def render_not_found_response
        render json: {"error": "Scientist not found"}, status: :not_found
    end

    def record_invalid_message
        render json: {"errors": ["validation errors"]}, status: 422
    end

end
