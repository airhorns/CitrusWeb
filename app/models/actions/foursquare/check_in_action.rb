module Actions
  module Foursquare
    class CheckInAction < FoursquareAction

      key :venue_id, String
      attr_accessible :venue_id
      validates_presence_of :venue_id
      
      def self.default_action_text
        "Check In on Foursquare"
      end
    end
  end
end


