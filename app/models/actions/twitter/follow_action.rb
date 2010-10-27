module Actions
  module Twitter
    class FollowAction < TwitterAction
      validates_presence_of :followee_id
      key :followee_id, Fixnum
      
    end
  end
end