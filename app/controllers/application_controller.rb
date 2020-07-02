
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  get '/show' do
    erb :show
  end
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    article = Article.create(params)
    redirect "/articles/#{article.id}"
  end

  get '/articles/new' do
    puts "new article endpoint"
    erb :'articles/new'
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.update(title: params[:title], content: params[:content])
    @article.save

    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id/delete' do
    @article = Article.find_by_id(params[:id])
    @article.destroy

    erb :delete
  end

end
