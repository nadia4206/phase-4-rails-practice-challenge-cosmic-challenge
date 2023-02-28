class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_message

    private

    def render_not_found_response(error)
        render json: {error: error.message}, status: :not_found
    end

    def record_invalid_message(error)
        render json: {error: error.message}, status: 422
    end

end
