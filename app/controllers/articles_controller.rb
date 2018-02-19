class ArticlesController < ApplicationController
  # Action to get article ID
  before_action :find_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  # Main view shows all articles.
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
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
    @article.user = current_user
    if @article.save
      flash[:success] = "Article Created Successfully!"
      redirect_to article_path(@article)
    else
      render :new
    end
  end
  
  
  # Method used to edit the article in the database and check validation.
  def update
    if @article.update(article_params)
      flash[:success] = "Article Edited Successfully!"
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
    flash[:danger] = "Article Deleted Successfully!"
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
    
  def require_same_user
    if current_user != @article.user
      flash[:danger] = "You can only modify your own articles"
      redirect_to root_path
    end
  end
end