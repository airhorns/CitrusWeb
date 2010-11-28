class Code
  include MongoMapper::Document         

  key :shortcode, String
  key :splash_id, ObjectId
  
  belongs_to :splash
  validates_presence_of :shortcode, :splash_id

  def full_url
    (Rails.env == "development" ? "http://localhost:3000/s/" : "http://citrus.heroku.com/s/") + self.shortcode
  end

  def filename
    "#{self.shortcode}.png"
  end

  def qr
    unless @qr.present?
      qr = RQRCode::QRCode.new(self.full_url, :size => 4, :level => :q)
      @qr = ::CitrusQrImage.new(qr).sample(4)
      @qr.format = "png"
    end
    @qr
  end
end
