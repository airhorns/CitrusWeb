class Splash
  include MongoMapper::Document
  include NestedAttributes
   
  key :name, String
  key :text, String
  key :photo, String
  
  validates_presence_of :name
  
  many :codes
  accepts_nested_attributes_for :codes
  validates_associated :codes

  many :actions, :class_name => "Actions::Action"
  accepts_nested_attributes_for :actions
  validates_associated :actions

  def self.available_actions
    [Actions::Twitter::FollowAction,
     Actions::Twitter::StatusUpdateAction,
     Actions::Twitter::RetweetAction]
  end
end
