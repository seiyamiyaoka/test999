class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end
  
  
  def new
    @blog = Blog.new
  end
  
  def confirm
    @blog = Blog.new(params_create)
    
    if @blog.valid?
       
      render action: 'confirm'
      #redirect_to contacts_path :index
    else
      render action: 'new'
    
  end
  def thanks
    @blog = Blog.create(params_create)
  end
  end
  
  
  private
  
  def params_create
    params.require(:blog).permit(:name,:title,:content)
  end
end
