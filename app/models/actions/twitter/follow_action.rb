module Actions
  module Twitter
    class FollowAction < TwitterAction
      def self.default_action_text
        "Follow me on Twitter"
      end

      key :followee_id, Fixnum
      validates_presence_of :followee_id
      attr_accessible :followee_id
    end
  end
end
