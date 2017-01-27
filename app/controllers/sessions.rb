class BookmarkManager < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/' do
    login
  end

  delete '/sessions/' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect '/links'
  end

end
