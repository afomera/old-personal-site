class AndrewApp < Sinatra::Base
  get '/' do
     @title = 'Welcome!'
      erb :index, :layout => :layour2
  end

  get '/about' do
    erb :about
  end

  get '/contact' do
    erb :contact
  end

end

