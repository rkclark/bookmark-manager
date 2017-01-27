class BookmarkManager < Sinatra::Base

  enable :sessions
  enable :method_override
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    redirect '/users/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
