class Lamp

  POSSIBLE_COLORS = [:red, :yellow, :black, :white]

  attr_reader :id, :color
  attr_accessor :quantity

  def initialize(id, name, price)
    @id = id
    @name = name
    @price = price
    @color = POSSIBLE_COLORS.sample
    @quantity = 3 + rand(5)
  end

  def name
    @name.capitalize
  end

  def price
    format("%.2d", @price)
  end

  def picture
    return @filename if @filename

    base = "/img/lamps/#{@id}"
    @filename = ['png', 'jpg'].map do |ext|
      "#{base}.#{ext}" if File.exists?(File.dirname(__FILE__) + "/public/#{base}.#{ext}")
    end.compact.first

  end


end
