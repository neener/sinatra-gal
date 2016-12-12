class CategoriesController < ApplicationController

	get '/categories' do
		if logged_in?
			@categories = Category.all
			erb :'categories/categories'
		else
			redirect '/login'
		end
	end

	get '/categories/new' do
		if logged_in?
			erb :'/categories/new'
		else
			redirect '/login'
		end
	end

	get '/categories/:id/edit' do
		if logged_in?
			@categories = Category.find_by_id(params[:id])
			if @category.user_id == current_user.id
				erb :'categories/edit_category'
			else 
				redirect '/categories'
			end
		else
			redirect to '/login'
		end
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
end
