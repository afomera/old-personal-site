class AndrewApp < Sinatra::Base
  get '/' do
     @title = 'Welcome'
      erb :index
  end

  get '/about' do
    @title = 'About Me'
    erb :about
  end

  get '/about/projects' do
    @title = 'My Projects'
    erb :projects, :layout => :layout2
  end

  get '/blog' do
    redirect 'http://andrewfomera.blogspot.com/', 'Redirect to blog'
  end

  get '/contact' do
    @title = 'Contact Me'
    erb :contact
  end

  post '/contact' do
    require 'pony'
    @contact_name = params['contact-name']
    @contact_email = params['contact-email']
    @contact_message = params['contact-message']

    @my_email = 'andrew.fomera@gmail.com'
    @email_subject = 'Hey! You have an email from your site!'

    Pony.mail :to => @my_email,
              :from => @contact_email,
              :subject => @email_subject,
              :body => @contact_message

    redirect '/'
  end


end

