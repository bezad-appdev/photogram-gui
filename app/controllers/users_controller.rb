class UsersController < ApplicationController
  def index 
    mathcing_users = User.all
    @list_of_users = mathcing_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb" })
  end 
  def show 
    #Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username})
    @the_user = matching_usernames.at(0)

    render({ :template => "user_templates/show.html.erb" })
  end
  def add_user
    #Parameters: {"input_username"=>"JOY"}
    input_user = params.fetch("input_username")
    a_new_user = User.new
    a_new_user.username = input_user
    
    a_new_user.save
    #redirect_to("/users/")
    

    render({ :template => "user_templates/add_user.html.erb" })

  end
end
