class CitrusQrImage < ::QrImage
  def self.get_lime
    unless @lime.present?
      @lime = Magick::Image.from_blob(File.read(File.join(Rails.root, 'app', 'support', 'half_slice.png'))).first
      @lime = @lime.quantize(256, Magick::RGBColorspace).get_pixels(0,0, @lime.columns, @lime.rows) #.collect {|p| p.red + (p.green << 8) + (p.blue << 16)} #      # @lime.each_with_index do |color, i|
      #   if color != BLACK && color != WHITE
      #     @lime[i] = GRAY
      #   end
      # end
    end
    @lime
  end

  def initialize(qr)
    super
    lime_pixels = self.class.get_lime
    pixels = self.get_pixels(0, 0, self.columns, self.rows)
    lime_pixels.each_with_index do |p, i|
      # hex color compare
      if p.to_color(Magick::AllCompliance, false, 16, true) != "#000000000000"
        pixels[i] = p
      end
    end
    self.store_pixels(0, 0, self.columns, self.rows, pixels)
  end

end
