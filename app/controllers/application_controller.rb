class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/tasks'
  end

  get '/tasks' do
    @tasks = Task.all
    erb :index
  end

  post '/tasks' do
    @task = Task.create(params[:tasks])
    redirect "/tasks/#{@task.id}"
  end

  get '/tasks/new' do
    erb :new
  end

  get '/tasks/:id' do
    @task = Task.find(params[:id])
    erb :show
  end
  get '/tasks/:id/edit' do
    @task = Task.find(params[:id])
    erb :edit
  end

  patch '/tasks/:id' do
    @task = Task.find(params[:id])
    @task.update(params[:tasks])
    redirect "/tasks/#{@task.id}"
  end

  delete '/tasks/:id' do
    Task.find(params[:id]).delete
    redirect '/tasks'
  end

end
