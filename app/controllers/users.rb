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

  get '/users/recover' do
    erb :'users/recover'
  end

  post '/users/recover' do
    user = User.first(email: params[:user_recovery_email])
    if user
      user.generate_token
      SendRecoverLink.call(user)
    end
    erb :'users/acknowledgement'
  end

  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if @user
      session[:token] = params[:token]
      erb :'users/reset_password'
    else
      "Your token is invalid"
    end
  end

  patch '/users' do
    user = User.find_by_valid_token(session[:token])
    if user.update(password: params[:user_password], password_confirmation: params[:password_confirmation])
      session[:token] = nil
      user.update(password_token: nil)
      redirect "/sessions/new"
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/reset_password'
    end
  end

end
