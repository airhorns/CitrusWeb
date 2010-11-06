require 'cgi'

module Actions
  module Platform
    class VisitLinkAction < PlatformAction
      validates_presence_of :url
      key :url, String 
      def self.default_action_text
        "Visit a website"
      end

      before_save do
        self.url = CGI.unescapeHTML(self.url)
      end
    end
  end
end

