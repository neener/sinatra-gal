class CategoriesController < ApplicationController

	get '/categories' do
		if logged_in?
			@categories = Category.all
			erb :'categories/categories'
		else
			redirect '/login'
		end
	end

	# get '/categories/new' do
	# 	if logged_in?
	# 		erb :'/categories/new'
	# 	else
	# 		redirect '/login'
	# 	end
	# end

	get '/categories/:id' do
		if logged_in?
			@category = Category.find_by_id(params[:id])
			erb :'categories/show_category'
		else
			redirect to '/login'
		end
	end

	get '/categories/:id/edit' do
		if logged_in?
			@category = Category.find_by_id(params[:id])
			if @category.user_id == current_user.id
				erb :'categories/edit_category'
			else 
				erb :'categories/edit_category'
			end
		else
			redirect '/login'
		end
	end

	post '/categories' do
		@category = Category.new(title: params[:title])
		if @category.save
			redirect '/categories'
		else
			erb :'/categories/categories'
		end
	end


	patch '/categories/:id' do
		if params[:title] == ""
			redirect to "/categories/#{params[:id]}/edit"
		else
			@category = Category.find_by_id(params[:id])
			@category.title = params[:title]
			@category.save
			redirect "/categories/#{params[:id]}"
		end
	end

	delete '/categories/:id/delete' do
		if logged_in?
			@category = Category.find_by_id(params[:id])
			@category.destroy
			redirect '/categories'
		else
			redirect '/login'
		end
	end
end
