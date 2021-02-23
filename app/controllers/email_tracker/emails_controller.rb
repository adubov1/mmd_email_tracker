require_dependency "email_tracker/application_controller"
require_dependency "../lib/email_tracker/create_tracking_link"

module EmailTracker
  class EmailsController < ApplicationController

    def create
      @email = Email.new(email_params)

      if @email.save
        render text: CreateTrackingLink.(@email)
      end
    end

    def show
      @email = Email.find(email_params[:gmail_id])
      render json: @email.opens.to_json
    end

    private

      def email_params
        params.require(:email).permit(:from, :to, :gmail_id)
      end
  end
end
