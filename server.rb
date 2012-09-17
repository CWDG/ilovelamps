require 'sinatra'
require_relative 'lamp'
require_relative 'database'


get '/' do
  @title = "I Love Lamps.com"
  @lamps = database.all
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
  database.find_by_id(id)
end

def database
  $lamp_database ||= Database.new
end
