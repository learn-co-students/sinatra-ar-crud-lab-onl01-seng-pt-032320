
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  #this shows all the articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #this creates a new article object
  get '/articles/new' do
   @article = Article.new
   erb :new

  end

  #this creates an article object with the params of the form
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}" #id, title, content
  end

  #this is to show a specific article
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #this is to update
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #this is the information that will be patched in to 
  #old information and thus editing it
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  #this deletes an article 
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to '/articles'
  end




end
