require_dependency "email_tracker/application_controller"

module EmailTracker
  class OpensController < ApplicationController

    def open
      @email = Email.find_by_track_id(opens_params)
      
      @email.opens.create(ip_address: request.remote_ip)
      send_data(
        "GIF89a\u000F\u0000\u000F\u0000\x80\u0000\u0000\xFF\xFF\xFF\u0000\u0000\u0000!\xF9\u0004\u0000\u0000\u0000\u0000\u0000,\u0000\u0000\u0000\u0000\u000F\u0000\u000F\u0000\u0000\u0002\r\x84\x8F\xA9\xCB\xED\u000F\xA3\x9C\xB4ڋg\u0001\u0000;",
        filename: "t.gif",
        disposition: 'inline',
        type: "image/gif")
    end

    private

      def opens_params
        params.require(:track_id)
      end
  end
end
