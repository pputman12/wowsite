class GuildsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /guilds
  # GET /guilds.xml
  
  def index
    @guilds = Guild.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @guilds }
    end
  end

  # GET /guilds/1
  # GET /guilds/1.xml
  def show
    @guild = Guild.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @guild }
    end
  end

  # GET /guilds/new
  # GET /guilds/new.xml
  def new
    @guild = Guild.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @guild }
    end
  end

  # GET /guilds/1/edit
  def edit
    @guild = Guild.find(params[:id])
  end

  # POST /guilds
  # POST /guilds.xml
  def create
    @guild = Guild.new(params[:guild])
    respond_to do |format|
      if WowCommunityApi::Guild.find_by_realm_and_name(@guild.realm, @guild.name) && @guild.save
        format.html { redirect_to(@guild, :notice => 'Guild was successfully registered.') }
        format.xml  { render :xml => @guild, :status => :created, :location => @guild }
      else
        format.html { redirect_to(new_guild_path, :notice => 'Guild could not be registered') }
        format.xml  { render :xml => @guild.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /guilds/1
  # PUT /guilds/1.xml
  def update
    @guild = Guild.find(params[:id])

    respond_to do |format|
      if @guild.update_attributes(params[:guild])
        format.html { redirect_to(@guild, :notice => 'Guild was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @guild.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /guilds/1
  # DELETE /guilds/1.xml
  def destroy
    @guild = Guild.find(params[:id])
    @guild.destroy

    respond_to do |format|
      format.html { redirect_to(guilds_url) }
      format.xml  { head :ok }
    end
  end
end
