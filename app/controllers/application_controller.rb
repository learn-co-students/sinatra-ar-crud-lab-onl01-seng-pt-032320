
require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :'/index'
  end

  get '/articles/new' do
  
    erb :'/new'
  end

  post '/articles' do
    #binding.pry
    @article= Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])

    if @article 
      erb :'/show'
    else 
      "No article found with that id."
    end
  end

  


end
