class BookmarkManager < Sinatra::Base

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
    def login
      user = User.authenticate(params[:user_email], params[:user_password])
      if user
        session[:user_id] = user.id
        redirect '/links'
      else
        flash[:error] = ['The email or password is incorrect']
        redirect '/sessions/new'
      end
    end
  end

  get '/users/new' do
    @user_email = session[:user_email]
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:user_email], password: params[:user_password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.save
      redirect '/links'
    else
      flash[:error] = user.errors.full_messages
      session[:user_email] = user.email
      redirect '/users/new'
    end
  end

end
