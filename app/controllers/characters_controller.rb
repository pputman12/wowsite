class CharactersController < ApplicationController
  # GET /characters
  # GET /characters.xml
  before_filter :authenticate_user!
  
  def index
   
    @guild = Guild.find(params[:guild_id])
    @characters = @guild.characters

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @characters }
    end
  end

  # GET /characters/1
  # GET /characters/1.xml
  def show
    @character = Character.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.xml
  def new
    @character = Character.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @character = Character.find(params[:id])
  end

  # POST /characters
  # POST /characters.xml
  def create
    @character = Character.new(params[:character])
    if @character_struct = WowCommunityApi::Character.find_by_realm_and_name(@character.realm, @character.name, "guild") 
      if @guild = Guild.find(:first, :conditions => ['name = lower(?)', @character_struct.guild.name.downcase])
	@character.guild_id = @guild.id
        @character.update_attributes WowCommunityApi::Character.find_by_realm_and_name(@character_struct.realm, @character_struct.name).marshal_dump	
        @character.user = current_user
        respond_to do |format|
          if @character.save
            format.html { redirect_to(@character, :notice => 'Character was successfully created.') }
          else
            format.html { render :action => "new" }
          end
        end
      end
    
  else
   respond_to do |format|
     format.html { render :action => "new" }
   end 
  end
 end


  # DELETE /characters/1
  # DELETE /characters/1.xml
  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to(characters_url) }
      format.xml  { head :ok }
    end
  end
end
