class ArticlesController < ApplicationController
	before_action :authorize, except: [:index, :all, :sign_in, :validate]
	
	def new
		@article = Article.new
	end

	def create
		@article = Article.new(title: params[:article][:title], 
													 body: params[:article][:body],
													 user_id: set_current_user.id)

		if @article.save
			redirect_to "/sign_in/#{params[:user_id]}"
		else
			render :new
		end
	end

	def show
		@article = Article.where(id: params[:id]).first
	end

	def edit
		@article = set_current_user.articles.where(id: params[:id]).first
	end

	def update
		@article = set_current_user.articles.where(id: params[:id]).first

		if @article.update(user_id: params[:user_id],
											 title: params[:article][:title], 
											 body: params[:article][:body])
			redirect_to user_article_path
		else
			render :edit
		end
	end

	def destroy
		@article = set_current_user.articles.where(id: params[:id]).first
		@article.destroy

		redirect_to "/sign_in/#{params[:user_id]}"
	end

	def all
		@articles = Article.all
	end
end
