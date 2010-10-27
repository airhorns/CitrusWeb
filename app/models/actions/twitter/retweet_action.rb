module Actions
  module Twitter
    class RetweetAction < TwitterAction
      validates_presence_of :status_id
      
      key :status_id, Fixnum
      
    end
  end
end