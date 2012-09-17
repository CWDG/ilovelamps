require_relative 'lamp'

class Database

  def initialize

    @lamps = [
      Lamp.new(0, :desk, 10.00),
      Lamp.new(1, :table, 20.00),
      Lamp.new(2, :floor, 40.00),
      Lamp.new(3, :magic, 100.00),
      Lamp.new(4, :mario, 35.00)
    ]

  end

  def all
    @lamps
  end

  def find_by_id(id)
    raise Sinatra::NotFound.new("Lamp##{id} does not exist!") if id < 0 || id >= @lamps.size

    @lamps[id]
  end

end
