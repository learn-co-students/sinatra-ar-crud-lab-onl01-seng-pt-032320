
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
    @article = Article.new

    erb :'articles/new'
  end
  
  get '/articles/:id' do 
    
    @article = Article.find(params[:id])

    erb  :'articles/show'

  end

  post '/articles' do 
    @article = Article.create(params)

    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])

    erb :'articles/edit'

  end

  patch '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    
    redirect "/articles/#{@article.id}"

  end
   

  delete '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.destroy
    erb :'articles/show'
  end
end
