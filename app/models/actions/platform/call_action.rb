require 'cgi'

module Actions
  module Platform
    class CallAction < PlatformAction
      validates_presence_of :phone_number
      key :phone_number, String 
      def self.default_action_text
        "Call this number"
      end
    end
  end
end


