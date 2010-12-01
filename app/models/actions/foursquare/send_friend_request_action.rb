module Actions
  module Foursquare
    class SendFriendRequestAction < FoursquareAction
      key :user_id, String
      validates_presence_of :user_id      
      attr_accessible :user_id
      def self.default_action_text
        "add as a foursquare friend"
      end
    end
  end
end


