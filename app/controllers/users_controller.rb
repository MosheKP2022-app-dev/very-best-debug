class UsersController < ApplicationController

  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "user_templates/all_users.html.erb"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/user_details.html.erb"})
  end
  
  def create
    user = User.new
    user.username = params.fetch("query_username")
    user.save
    
    redirect_to("/users/#{user.username}")
  end
  
  def update
    the_username = params.fetch("username")

    matching_users = User.where({ :username => the_username })
    @user = matching_users.at(0)
    
    @user.username = params.fetch("query_username")
    @user.save
    redirect_to("/users/" + @user.username)
  end

end
