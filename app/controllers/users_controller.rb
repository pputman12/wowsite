class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    logger.info current_user.to_yaml
    @user = current_user
    @characters = @user.characters
    @guilds = @user.guilds
    respond_to do |format|
      format.html # show.html.erb
      
    end
  end
end
