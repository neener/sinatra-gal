class UsersController < ApplicationController

	get '/users/:slug' do
		@user = User.find_by_slug(params[:slug])
		erb :'users/show'
	end

	get '/login' do
		if !logged_in?
			erb :'users/login'
		else
			redirect to '/categories'
		end
	end

	get '/signup' do
		if !logged_in?
			erb :'users/signup'
		else
			redirect to '/categories'
		end
	end
	
	post '/signup' do
		@user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
		if @user.save
		# session[:user_id] = @user.id
			redirect '/categories'
		else
			erb :'users/signup'
		end
	end 

	post '/login' do
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect '/categories'
		else
			erb :'users/signup'
		end
	end

	get '/logout' do 
		session.destroy
		redirect '/login'
	end
end
