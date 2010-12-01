module Actions
  class Action
    include MongoMapper::EmbeddedDocument
    class << self
      def default_action_text
        "Take an action"
      end
      
      def new(attrs={})
        if attrs[:_type]
          begin
            klass = attrs[:_type].constantize
            attrs.delete(:_type)
          rescue NameError
            return super(attrs)
          else
            if klass != self.class
              puts klass
              return klass.new(attrs)
            end
          end
        end
          return super(attrs)
      end
    end


    key :_type, String, :required => true
    key :action_text, String, :required => true
    attr_accessible :_type, :action_text
    validates_presence_of :_type
    validates_length_of :action_text, :in => 5..30
  end
end
