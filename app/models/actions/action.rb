module Actions
  class Action
    include MongoMapper::EmbeddedDocument
    def self.default_action_text
      "Take an action"
    end

    key :_type, String
    key :action_text, String

    validates_presence_of :_type
    validates_length_of :action_text, :in => 5..30
  end
end
