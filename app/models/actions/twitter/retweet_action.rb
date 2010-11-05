module Actions
  module Twitter
    class RetweetAction < TwitterAction
      validates_presence_of :status_id
      
      def self.default_action_text
        "Retweet my tweet"
      end 

      key :status_id, Fixnum
      
    end
  end
end
