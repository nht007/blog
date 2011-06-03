class TagsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  
  def show
    @tag = Tag.find_by_id(params[:id])
    if @tag.nil?
      redirect_to not_found_path
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
  
  def create

    if params[:name].nil?
      respond_to do |format|
        format.html { respond_with(@parent) }
        format.json { render :json => "Tag cannot be blank", :status => :unprocessable_entity }
      end
      return
    end

    @tag = Tag.find_by_tag(params[:name])

    if @tag.nil?
      @tag = Tag.new(params[:name])
      if @tag.save
        @parent.tags << @tag
      else
        flash[:error] = "There was a problem creating your Tag"
      end
    else
      tagged = false
      @parent.tags.each do |tag|
        if tag.name == @tag.name
           tagged = true
         end
      end
    end
    
    if not tagged
      @parent.tags << @tag
    end    
    
    respond_with(@tag) do |format|
      format.html { respond_with(@parent) }       
    end
    
  end
end
  
