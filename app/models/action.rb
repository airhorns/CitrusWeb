module Actions
  class Action
    include MongoMapper::EmbeddedDocument         
    key :_type, String
    validates_presence_of :_type
  end
end