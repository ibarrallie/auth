class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier -- this is going to be the email
    @user = User.find_by({"email" => params["email"]})
    # 2. if the user exists -> check if they know their password
    if @user #this will let us say "if they exist"
    # 3. if they know their password -> login is successful
      if BCrypt::Password.new(@user["password"]) == params["password"]
      flash["notice"] = "Welcome."
      cookies["user_id"] = @user["id"]
      redirect_to "/companies"
      else redirect_to "/login"
      end
    # 4. if the user doesn't exist or they don't know their password -> login fails
    else 
      redirect_to "/login"
    end
  end
  #but once you do the encrypting, any old passwords will not work until they become encrypted (which... how?)

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
