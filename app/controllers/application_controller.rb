require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  get '/articles' do 
    @articles = Article.all
    erb :index
  end
  
  get '/articles/new' do 
    erb :new
  end
  
  post '/articles' do 
    title = params[:title]
    content = params[:content]
    new_art = Article.create(title: title,content: content)
    @article = new_art
    erb :show
  end
  
  get '/articles/:id' do 
    @article = params[:id]
    erb :show
  end
  
  get '/articles/:id/edit' do
    @artice = Article.find(id: params[:id])
    erb :edit
  end
  
  
end
