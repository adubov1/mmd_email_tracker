require_dependency "email_tracker/application_controller"

module EmailTracker
  class OpensController < ApplicationController

    def create
      @email = Email.find(opens_params[:i])
      @email.create_open(ip_address: opens_params[:ip_address])
    end

    private

      def opens_params
        params.require(:open).permit(:ip_address, i)
      end
  end
end
