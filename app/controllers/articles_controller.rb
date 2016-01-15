class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Your article was created successfully!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end 
  
  private
  
    def article_params
      params.require(:article).permit(:title, :city, :country, :description)
    end
    
end 


