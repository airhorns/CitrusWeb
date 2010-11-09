module Actions
  module Paypal
    class DonateAction < PaypalAction
      def self.default_action_text
        " "        
      end

      key :amount, Float
      key :recipient, String
      key :merchant_name, String
    end
  end
end

