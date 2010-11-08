class Code
  include MongoMapper::Document         

  key :shortcode, String
  key :splash_id, ObjectId
  
  belongs_to :splash  
  validates_presence_of :shortcode, :splash_id

  def full_url
    "http://citrus.heroku.com/s/"+self.shortcode
  end

  def filename
    "#{self.shortcode}.png"
  end

  def qr
    unless @qr.present?
      qr = RQRCode::QRCode.new(self.full_url, :size => 3, :level => :m)
      @qr = ::QrImage.new(qr).sample(4)
      @qr.format = "png"
    end
    @qr
  end
end
