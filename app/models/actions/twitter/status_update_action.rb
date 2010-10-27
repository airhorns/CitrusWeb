module Actions
  module Twitter
    class StatusUpdateAction < TwitterAction
      validates_presence_of :text
      
      key :text, String
      key :in_reply_to_id, Fixnum
      
    end
  end
end