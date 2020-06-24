require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    Article.create(params[:article])
    redirect "/articles/#{Article.last.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect "/articles"
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id]) # finds the article based on its ID
    @article.update(params[:article]) # updates that article using params values
    redirect "/articles/#{@article.id}" # goes to the SHOW page to show the user the edits they made
  end

end
