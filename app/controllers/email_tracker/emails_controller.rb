require_dependency "email_tracker/application_controller"

module EmailTracker
  class EmailsController < ApplicationController

    def create
      @email = Email.find_or_create_by(email_params)

      if @email.save
        render json: { url: "http://#{request.host}/et/o.svg?t=#{@email.track_id}" }
      end
    end

    def show
      @email = Email.find_by_message_id(params['id'])
      date_format = ->(date_str) { DateTime.parse(date_str).strftime("%b %e,%l:%M %p") }
      opens = @email.opens.as_json.map! do |o|
        {
          time: date_format.(o['created_at']),
          city: o['city'],
          state: o['state']
        }
      end
      render json: opens
    end

    private

      def history_params
        params.require(:message_id)
      end

      def email_params
        params.require(:email).permit(:from, :to, :message_id)
      end
  end
end
