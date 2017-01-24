ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/dmconfig.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:link_title], url: params[:link_url])
    params[:link_tags].split(",").each {
      |tag|
      new_tag = Tag.first_or_create(:name => tag.strip.capitalize)
      link.tags << new_tag
    }
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    @tag = Tag.first(:name => params[:tag])
    @links = @tag.links
    erb :links
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
