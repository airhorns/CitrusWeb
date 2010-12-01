require 'cgi'

module Actions
  module Platform
    class CallAction < PlatformAction
      key :phone_number, String
      validates_presence_of :phone_number
      attr_accessible :phone_number
      def self.default_action_text
        "Call"
      end
    end
  end
end


