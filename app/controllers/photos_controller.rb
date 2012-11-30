class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new    
    
    #@photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end


  def new_public
    @gallery = Gallery.find(params[:id])
    @photo = Photo.new    
    
    #@photo = Photo.new

    respond_to do |format|
      format.html { render :layout => "public" }
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to gallery_path(@gallery), notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        flash[:error] = @photo.errors.empty? ? "Error" : @photo.errors.full_messages.to_sentence
        #flash.now[:error] = "Error"
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end


  def create_public
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.new(params[:photo])

    respond_to do |format|
      if @photo.save

        format.html { redirect_to public_gallery_path(@gallery), notice: @gallery.confirmation_text }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        flash[:error] = @photo.errors.empty? ? "Error" : @photo.errors.full_messages.to_sentence
        #flash.now[:error] = "Error"
        format.html { render action: "new_public", :layout => "public" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end




  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @gallery = Gallery.find(params[:gallery_id])
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to gallery_path(@photo.gallery), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    gallery = @photo.gallery
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to gallery_path(gallery) }
      format.json { head :no_content }
    end
  end

  def vote
    @photo = Photo.find(params[:id])
    vote = @photo.photo_votes.new(value: params[:value], photo_id: params[:id])
    respond_to do |format|
      if vote.save
        cookies["vt#{@photo.id}"] = { :value => 'voted', :expires => 12.hours.from_now }
        format.js
        format.html { redirect_to :back, notice: "Vielen Dank fuer Ihre Stimme!" }
      else
        format.js
        format.html {redirect_to :back, alert: "Es ist ein Fehler aufgetreten. Ihre Stimme wurde nicht gezaehlt" }
      end
    end
  end

  def sort
    params[:photo].each_with_index do |id, index|
      Photo.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
