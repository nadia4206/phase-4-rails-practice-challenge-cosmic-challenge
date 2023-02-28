class MissionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_message


    def index
        missions = Mission.all
        render json: missions, status: :ok
    end

    def create
        mission = Mission.create!(mission_params)
        render json: mission, include: ['planets'], status: :created
    end

    private

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end

    def record_invalid_message
        render json: {"errors": ["validation errors"]}, status: 422
    end

end
