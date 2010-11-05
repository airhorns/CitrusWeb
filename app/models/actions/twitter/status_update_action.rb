module Actions
  module Twitter
    class StatusUpdateAction < TwitterAction
      validates_presence_of :text
      
      def self.default_action_text
        "Tweet about this"
      end

      key :text, String
      key :in_reply_to_id, Fixnum
      
    end
  end
end
