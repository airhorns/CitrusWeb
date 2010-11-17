module Actions
  module Foursquare
    class SendFriendRequestAction < FoursquareAction
      validates_presence_of :user_id
      key :user_id, String 
      def self.default_action_text
        "Add as a foursquare friend"
      end
    end
  end
end


