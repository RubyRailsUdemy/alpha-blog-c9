class ArticlesController < ApplicationController
  
  # Main view shows all articles.
  def index
    
  end
  
  # Method for the the new view to create articles.
  def new
    @article = Article.new
  end
  
  
  # Method for the the edit view to edit articles.
  def edit
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      flash[:notice] = "Edit Successful!"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end
  
  
  # Method used to show the article after it is created.
  def show
    @article = Article.find(params[:id])
  end
  
  # Private method to whitelist article creation.
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end