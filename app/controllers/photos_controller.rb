class PhotosController < ApplicationController
  def index 
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index.html.erb" })
  end
  def show 
    #Parameters: {"path_username"=>"anisa"}
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id})
    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show.html.erb" })
  end
  def baii 
    delete_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => delete_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy
    #matching_photos = Photo.all
    #@list_of_photos = matching_photos.order({ :created_at => :desc })
    redirect_to("/photos")
    #render({ :template => "photo_templates/baii.html.erb" })
  end
  def create
    #Parameters: {"query_image"=>"https://chicagobooth.edu/-/media/project/chicago-booth/why-booth/a-global-footprint/a-dynamic-influence-in-europose-the-middle-east-and-africa/chicago-booth-london-building-entrance.jpg?cx=0.58&cy=0.72&cw=940&ch=749&hash=BA83D00D9BE1FDAA565CB2B6B949C1D0 ", "query_caption"=>"booth", "query_owner_id"=>"117"}
    #render({ :template => "photo_templates/create.html.erb" })
  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  input_owner_id = params.fetch("query_owner_id")
  a_new_photo = Photo.new
  a_new_photo.image = input_image 
  a_new_photo.caption = input_caption 
  a_new_photo.owner_id = input_owner_id
  a_new_photo.save

  redirect_to("/photos/" + a_new_photo.id.to_s)





  end
  def update
    #Parameters: {"query_image"=>"https://chicagobooth.edu/-/media/project/chicago-booth/why-booth/north-america/chicago-booth-uchicago-campus.jpg?cx=0.59&cy=0.56&cw=940&ch=749&hash=399733267B8702EE5E9A5C00DC831BDD", "query_caption"=>"booth updated", "modify_id"=>"957"
    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    the_photo.image = input_image
    the_photo.caption = input_caption
    the_photo.save
    
    redirect_to("/photos/" + the_photo.id.to_s)


    
    #render({ :template => "photo_templates/update.html.erb" })

  end
  def add_comment
    #Parameters: {"input_photo_id"=>"773", "input_author_id"=>"121", "input_body"=>"you're awesome"}
    commented_photo = params.fetch("input_photo_id")
    commenter_id = params.fetch("input_author_id")
    input_comment = params.fetch("input_body")
    a_new_comment = Comment.new
    a_new_comment.photo_id = commented_photo
    a_new_comment.author_id = commenter_id
    a_new_comment.body = input_comment
    a_new_comment.save

    redirect_to("/photos/" + a_new_comment.photo_id.to_s)

    #render({ :template => "photo_templates/add_comment.html.erb" })


  end

end
