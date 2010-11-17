module Actions
  module Foursquare
    class CheckInAction < FoursquareAction
      validates_presence_of :venue_id
      key :venue_id, String 
      def self.default_action_text
        "Check In on Foursquare"
      end
    end
  end
end


