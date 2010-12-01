class Code
  include MongoMapper::Document         

  key :shortcode, String
  key :splash_id, ObjectId
  
  belongs_to :splash
  validates_presence_of :shortcode, :splash_id
  validates_format_of :shortcode, :with => /^[a-zA-Z0-9]+$/, :message => "must contain only alphanumeric characters (no punctuation or spaces, please.)"
  validates_length_of :shortcode, :in => 3..20

  def full_url
    (Rails.env == "development" ? "http://localhost:3000/s/" : "http://citrus.heroku.com/s/") + self.shortcode
  end

  def filename
    "#{self.shortcode}.png"
  end

  def qr(size)
    size = 4 unless size.present? && size > 0
    qr = RQRCode::QRCode.new(self.full_url, :size => 4, :level => :q)
    @qr = ::CitrusQrImage.new(qr).sample(size)
    @qr.format = "png"
    @qr
  end
end
