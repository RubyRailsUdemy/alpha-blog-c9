class ArticlesController < ApplicationController
  # Action to get article ID
  before_action :find_article, only: [:edit, :update, :show, :destroy]
  
  # Main view shows all articles.
  def index
    @articles = Article.all
  end
  
  # Method for the the new view to create articles.
  def new
    @article = Article.new
  end
  
  
  # Method for the the edit view to edit articles.
  def edit
  end
  
  
  # Method used to create the new article in the database and check validation.
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Creation Successful!"
      redirect_to article_path(@article)
    else
      render :new
    end
  end
  
  
  # Method used to edit the article in the database and check validation.
  def update
    if @article.update(article_params)
      flash[:notice] = "Edit Successful!"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end
  
  
  # Method used to show the article after it is created.
  def show
  end
  
  # Method to destroy an article with a confirmation.
  def destroy
    @article.destroy
    flash[:notice] = "Delete Successful"
    redirect_to articles_path
  end
  
  # Private method to whitelist article creation.
  private
    def find_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end
end