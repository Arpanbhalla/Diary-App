class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order('created_at DESC')
  end

  def new
    @article = Article.create
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Entry was successfully deleated"
    redirect_to articles_path
  end

  def create
    @article = Article.new(article_params)
    if
      @article.save
      flash[:notice] = "New Entry successfully entered"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice]= "Diary entry was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
