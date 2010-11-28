class CitrusQrImage < ::QrImage
  GRAY = 1
  def self.get_lime
    unless @lime.present?
      @lime = Magick::Image.from_blob(File.read(File.join(Rails.root, 'app', 'support', 'half_slice.png'))).first
      @lime = @lime.quantize(256, Magick::GRAYColorspace).export_pixels(0, 0, @lime.columns, @lime.rows, "I")
      @lime.each_with_index do |color, i|
        if color != BLACK && color != WHITE
          @lime[i] = GRAY
        end
      end
    end
    @lime
  end

  def get_pixmap()
    map = super
    lime = self.class.get_lime
    indicies = []
    balance = 0.0
    map.each_with_index do |c, i|
      if lime[i] != BLACK
        indicies << i
        balance += (c == BLACK ? 1 : -1)
      end  
    end
    
    balance = -1
    if balance < 0
      fill_color = BLACK
      space_color = WHITE
    else
      fill_color = WHITE
      space_color = BLACK
    end

    # indicies = indicies.slice(0, 1)
    indicies.each do |i|
      if lime[i] == GRAY
        map[i] = fill_color
      else
        map[i] = space_color
      end
    end

    return map
  end
end
