module Actions
  module Facebook
    class PublishStreamAction < FacebookAction
      validates_presence_of :title
      def self.default_action_text
        "Update your facebook status"
      end

      key :title, String
      key :data, Hash
      key :target, String  
    end
  end
end
