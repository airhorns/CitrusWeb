module Actions
  module Mailchimp
    class SubscribeAction < MailchimpAction
      validates_presence_of :api_key, :list_id
      key :api_key, String 
      key :list_id, String
      def self.default_action_text
        "Check In on Mailchimp"
      end
    end
  end
end


