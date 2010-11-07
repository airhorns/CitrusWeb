module Actions
  module Foursquare
    class CheckInAction < FoursquareAction
      validates_presence_of :place_id
      key :place_id, String 
      def self.default_action_text
        "Check In on Foursquare"
      end
    end
  end
end


