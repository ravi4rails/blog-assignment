class ArticlesController < ApplicationController

  load_and_authorize_resource

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :update, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), flash: { success: "Article has been created successfully" }
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), flash: { success: "Article has been updated successfully" }
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, flash: { success: "Article has been destroyed successfully" }
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit!
    end

end
