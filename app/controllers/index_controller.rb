get '/' do
  if logged_in?
    redirect '/cool_secret_page'
  else
    redirect '/login'
  end
end

get '/login' do
  erb :"session/login"
end

post '/login' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :'session/login'
  end
end

get '/cool_secret_page' do
  require_user
end