class PhotosController  < ApplicationController

  def index
    @list_of_all_my_photos = Photo.all
    render("photos/index.html.erb")
  end

  def show
    the_id = params[:da_id]
    @my_photo = Photo.find(the_id)
    render("photos/show.html.erb")
  end

  def new_form
    render("photos/new_form.html.erb")
  end

  def create_row
    url = params[:da_source]
    cap = params[:da_caption]
    new_photo = Photo.new
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save
    # render("photos/create_row.html.erb")
    redirect_to("/photos")
  end


  def edit_form
    @edit_id = params[:id]
    @my_photo = Photo.find(@edit_id)
    render("photos/edit_form.html.erb")
  end

  def update_row
    the_id = params[:id]
    url = params[:src]
    cap = params[:caption]
    find_photo = Photo.find(the_id)
    find_photo.source = url
    find_photo.caption = cap
    find_photo.save
    # render("photos/create_row.html.erb")
    redirect_to :controller => 'photos', :action => 'show', :da_id => the_id


  end

  def destroy_row
    the_id = params[:id]
    @my_photo = Photo.delete(the_id)
    # render("photos/destroy_row.html.erb")
    redirect_to("/photos")
  end




end
