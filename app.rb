require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/hello' do
    name = params[:name]
    
    return "Hello #{name}"
  end

  post '/submit' do 
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: #{message}"
  end

  get '/names' do 
    message = "Julia, Mary, Karim"

    return message
  end

  post '/sort-names' do
    names = params[:names]

    arr = names.split(",")
    return arr.sort.join(",")
  end
end