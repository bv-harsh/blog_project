class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end

	def create
		@user = User.find(params[:user_id])
		@article = @user.articles.new(title: params[:article][:title], 
																	body: params[:article][:body])

		if @article.save
			redirect_to "/signIn/#{params[:user_id]}"
		else
			render :new
		end
	end

	def show
		@article = Article.where(user_id: params[:user_id], 
														 id: params[:id]).select(:title, :body).take
	end

	def edit
		@user = User.find(params[:user_id])
		@article = @user.articles.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@article = @user.articles.find(params[:id])

		if @article.update(user_id: params[:user_id],
											 title: params[:article][:title], 
											 body: params[:article][:body])
			redirect_to user_article_path
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@article = @user.articles.find(params[:id])
		@article.destroy

		redirect_to "/signIn/#{params[:user_id]}"
	end

	def all
		@articles = Article.all
	end
end
