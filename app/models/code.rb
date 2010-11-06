class Code
  include MongoMapper::Document         

  key :shortcode, String
  key :splash_id, ObjectId
  
  belongs_to :splash  
  validates_presence_of :shortcode, :splash_id

  def full_url
    "http://citrus.heroku.com/"+self.shortcode
  end

  def filename
    "#{self.shortcode}.png"
  end

  def qr
    unless @qr.present?
      qr = RQRCode::QRCode.new(self.full_url, :size => 6, :level => :q)
      @qr = ::QrImage.new(qr).sample(4)
      @qr.format = "png"
    end
    @qr
  end
end
