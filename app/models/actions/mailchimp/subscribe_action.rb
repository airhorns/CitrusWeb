module Actions
  module Mailchimp
    class SubscribeAction < MailchimpAction
      key :api_key, String 
      key :list_id, String

      validates_presence_of :api_key, :list_id
      attr_accessible :api_key, :list_id
      def self.default_action_text
        "Subscribe to the newsletter"
      end
    end
  end
end


