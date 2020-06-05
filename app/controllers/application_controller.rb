
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
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}" #id, title, content
  end

  #shows the article
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #update
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end


  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to '/articles'
  end




end
