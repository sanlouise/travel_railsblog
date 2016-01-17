class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 6)
  end
  
  def new
    @article = Article.new
  end
  
  def show
  end
  
  def edit
  end
  
  def update
     if @article.update(article_params)
       flash[:success] = "Your article was updated successfully!"
       redirect_to article_path(@article)
     else
       render 'edit'
     end
  end
  
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Your article was created successfully!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end 
  
  def destroy
    @article.destroy
    flash[:danger] = "Your story was deleted succesfully."
    redirect_to articles_path
  end
  
  private
  
    def article_params
      params.require(:article).permit(:title, :city, :country, :description)
    end
    
    def set_article
      @article = Article.find(params[:id])
    end
    
    
end 


