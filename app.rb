require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post "/piglatinize" do
    @phrase = params[:user_phrase]
    "#{@phrase}"
    "#{PigLatinizer.new.to_pig_latin(@phrase)}"
  end
end
