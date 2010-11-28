module Actions
  module Twitter
    class FollowAction < TwitterAction
      validates_presence_of :followee_id
      def self.default_action_text
        "Follow me on twitter"
      end

      key :followee_id, Fixnum      
    end
  end
end
