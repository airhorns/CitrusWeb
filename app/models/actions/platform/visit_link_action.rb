require 'cgi'

module Actions
  module Platform
    class VisitLinkAction < PlatformAction

      def self.default_action_text
        "Visit a website"
      end

      key :url, String 
      validates_presence_of :url
      attr_accessible :url
      
      before_save do
        self.url = CGI.unescapeHTML(self.url)
      end
    end
  end
end

