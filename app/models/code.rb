class Code
  include MongoMapper::Document         

  key :shortcode, String
  key :splash_id, ObjectId
  
  belongs_to :splash  
  validates_presence_of :shortcode, :splash_id

  def full_url
    "http://localhost:3000/"+self.shortcode
  end
end
