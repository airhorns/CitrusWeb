module Actions
  module Twitter
    class RetweetAction < TwitterAction
      
      def self.default_action_text
        "Retweet my tweet"
      end 

      key :status_id, Fixnum
      validates_presence_of :status_id
      attr_accessible :status_id      
    end
  end
end
