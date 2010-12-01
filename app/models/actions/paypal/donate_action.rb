module Actions
  module Paypal
    class DonateAction < PaypalAction
      def self.default_action_text
        " "        
      end

      key :amount, Float
      key :recipient, String
      key :merchant_name, String

      validates_numericality_of :amount
      validates_presence_of :amount, :recipient, :merchant_name
      attr_accessible :amount, :recipient, :merchant_name
    end
  end
end

