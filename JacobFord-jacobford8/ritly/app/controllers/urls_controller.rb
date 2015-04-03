class UrlsController < ApplicationController
  def index
  	@url = Url.new
  end

  def new
  	@url = Url.new
  end	

  def create
  	@url = Url.new(url_params)
  	logger.debug @url
  	respond_to do |format|
    	  if @url.save
        	format.html { redirect_to @url, notice: 'URL was successfully created.' }
        	format.json { render :show, status: :created, location: @url }
      	else
        	format.html { render :index }
        	format.json { render json: @url.errors, status: :unprocessable_entity }
      	end
  	end 
  end

  def redirectors
    @url = Url.find_by(hash_code: params[:hash_code]).link
   	redirect_to @url
  end  
  
  def show
  	@url = Url.find(params[:id])
  end
  
  def randomize
  	@urls = Url.randomize(params[:link])
  end

  def preview
    #@url = Url.find(params[:id])
    @url = Url.find_by hash_code: params[:hash_code]
  end  

  private

  	def set_url
  		@url = Url.find(params[:id])
  	end		

  	def url_params
  		params.require(:url).permit(:link)
  	end	


end
