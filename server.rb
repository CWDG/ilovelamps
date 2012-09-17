require 'sinatra'
require_relative 'lamp'

$lamps = [
  Lamp.new(0, :desk, 10.00),
  Lamp.new(1, :table, 20.00),
  Lamp.new(2, :floor, 40.00),
  Lamp.new(3, :magic, 100.00),
  Lamp.new(4, :mario, 35.00)
]

get '/' do
  @title = "I Love Lamps.com"
  erb :index
end

get '/lamps/:id' do
  @lamp = find_lamp(params)
  @title = "#{@lamp.name} Lamp - I Love Lamps.com"
  erb :lamp
end

get '/buy/:id' do
  @lamp = find_lamp(params)
  @title = "#{@lamp.name} Lamp - I Love Lamps.com"
  erb :buy
end

post '/buy/:id' do
  @lamp = find_lamp(params)

  if @lamp.quantity > 0
    @lamp.quantity -= 1
    @title = "Thankyou from I Love Lamps.com"
    erb :thankyou
  else
    @error = "Out of Stock"
    @title = "#{@lamp.name} Lamp - I Love Lamps.com"
    erb :buy
  end
end

def find_lamp(params)
  id = params[:id].to_i
  if id > $lamps.size
    404
  else
    $lamps[id]
  end
end
