class BookmarkManager < Sinatra::Base

  get '/tags/:tag' do
    @tag = Tag.first(:name => params[:tag])
    @links = @tag.links
    erb :links
  end

end
