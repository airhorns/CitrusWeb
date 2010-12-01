module Actions
  module Twitter
    class StatusUpdateAction < TwitterAction
      
      def self.default_action_text
        "Tweet about this"
      end

      key :text, String
      key :in_reply_to_id, Fixnum
      validates_presence_of :text
      attr_accessible :text, :in_reply_to_id      
    end
  end
end
