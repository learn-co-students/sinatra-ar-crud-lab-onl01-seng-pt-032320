
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end
  
  #reads all articles/displays all articles
  get '/articles' do
    @articles = Article.all 
    erb :index
  end  
  
  #new article
  get '/articles/new' do
   @article = Article.new
   erb :new
    
  end
  
  #creates the article
  post '/articles' do 
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end
  
  #shows the article
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
end
