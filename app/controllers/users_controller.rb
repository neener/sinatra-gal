class UsersController < ApplicationController

	get '/login' do
		erb :'users/login'
	end

	get '/signup' do
		erb :'users/signup'
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
