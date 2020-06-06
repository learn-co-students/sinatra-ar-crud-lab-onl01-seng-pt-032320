
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  


  
  get '/articles' do 
    @article = Article.all

    erb :index
  end
  
  get '/articles/new' do

    erb :'articles/new'
   end
  
   get '/articles/:id' do 
    @article = Article.find(params[:id])

    erb  :'articles/show'

  end

  post '/articles/:id' do 
    article = Article.create(params)

    redirect "articles/#{article.id}"
  end
   
end
