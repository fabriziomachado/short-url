class LinksController < ApplicationController
  
  respond_to :html, :xml
  
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    flash[:success] = "Here's your new shortened url" if @link.save 
    respond_with(@link, :location => link_path(@link))
  end
  
  def show
    @link = Link.find(params[:id].to_i(Link::BASE)) 
    
  end
  
    def expand
    @link = Link.find(params[:shortlink].to_i(Link::BASE))
    @link.increment(:visits)
    @link.save
    redirect_to @link.url
  end
  
end
