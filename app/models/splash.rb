class Splash
  include MongoMapper::Document
  include NestedAttributes
   
  key :name, String
  key :text, String
  key :photo, String
  
  validates_presence_of :name
  
  many :codes
  accepts_nested_attributes_for :codes, :allow_destroy => true
  validates_associated :codes
  
  many :actions, :polymorphic => true, :class_name => "Actions::Action"
  accepts_nested_attributes_for :actions, :allow_destroy => true
  validates_associated :actions
  
  validates_length_of :codes, :actions, :minimum => 1
  

  def self.available_actions
    [
     Actions::Twitter::FollowAction,
     Actions::Twitter::StatusUpdateAction,
     Actions::Twitter::RetweetAction,
     Actions::Facebook::PublishStreamAction,
     Actions::Paypal::DonateAction,
     Actions::Platform::VisitLinkAction,
     Actions::Platform::CallAction,
     Actions::Foursquare::CheckInAction,
     Actions::Foursquare::SendFriendRequestAction,     
     Actions::Mailchimp::SubscribeAction
    ]
  end
end
