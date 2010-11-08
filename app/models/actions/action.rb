module Actions
  class Action
    include MongoMapper::EmbeddedDocument
    def self.default_action_text
      "Take an action"
    end
    key :_type, String
    key :action_text, String, :default => Proc.new { self.default_action_text || self.name.titleize } 
    validates_presence_of :_type
    validates_length_of :action_text, :in => 5..30
  end
end
