class UsersController < ApplicationController
  layout 'admin'
  require 'habtm_checkboxes'


  before_filter :get_user, :only => [:index, :new, :edit]
  before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create, :destroy]
  load_and_authorize_resource :only => [:show, :new, :destroy, :edit, :update]

  # GET /users
  # GET /users.xml
  # GET /users.json                                       HTML and AJAX
  #-----------------------------------------------------------------------
  def index
    @users = User.accessible_by(current_ability, :index).limit(20)
    @users = @users.find_all_by_company_id( current_user.company_id)
    respond_to do |format|
      format.json { render :json => @users }
      format.xml  { render :xml => @users }
      format.html
    end
  end

  # GET /users/new
  # GET /users/new.xml
  # GET /users/new.json                                    HTML AND AJAX
  #-------------------------------------------------------------------
  def new
    respond_to do |format|
      format.json { render :json => @user }
      format.xml  { render :xml => @user }
      format.html
    end
  end

  # GET /users/1
  # GET /users/1.xml
  # GET /users/1.json                                     HTML AND AJAX
  #-------------------------------------------------------------------
  def show
    respond_to do |format|
      format.json { render :json => @user }
      format.xml  { render :xml => @user }
      format.html
    end

  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json, :xml, :html)
  end

  # GET /users/1/edit
  # GET /users/1/edit.xml
  # GET /users/1/edit.json                                HTML AND AJAX
  #-------------------------------------------------------------------
  def edit
    respond_to do |format|
      format.json { render :json => @user }
      format.xml  { render :xml => @user }
      format.html
    end

  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json, :xml, :html)
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  # DELETE /users/1.json                                  HTML AND AJAX
  #-------------------------------------------------------------------
  def destroy

    @usertodelete = User.find(params[:id])
    if @usertodelete and @usertodelete.id != current_user.id
      flash[:notice] = "User deleted successfully." if @usertodelete.destroy
    else
      flash[:alert] = "User cannot be deleted."
    end


    respond_to do |format|
      format.json { respond_to_destroy(:ajax) }
      format.xml  { head :ok }
      format.html { redirect_to :action => :index }
    end

  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json, :xml, :html)
  end

  # POST /users
  # POST /users.xml
  # POST /users.json                                      HTML AND AJAX
  #-----------------------------------------------------------------
  def create

    #TODO - dondeng - First check if the number of users threshhold has been met or not

    pass = (0..8).map{ ('a'..'z').to_a[rand(26)] }.join
    @user = User.new(params[:user].merge(:company => current_user.company,
                                         :company_name => current_user.company_name,
                                         :password => pass,
                                         :password_confirmation => pass ))


    if @user.save
      flash[:notice] = "User successfully added"

      UserMailer.new_user_creation(@user, pass).deliver
      respond_to do |format|
        format.json { render :json => @user.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { redirect_to :action => :index }
      end
    else
      flash[:alert] = "User cannot be created."
      respond_to do |format|
        format.json { render :text => "Could not create user"}
        format.html { render :action => :new }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  # PUT /users/1.json                                            HTML AND AJAX
  #----------------------------------------------------------------------------
  def update
    flash[:alert] = nil

    if params[:user][:password].blank?
      [:password,:password_confirmation,:current_password].collect{|p| params[:user].delete(p) }
    else
      flash[:alert] = "Passwords do not match. " unless  params[:user][:password] == params[:user][:password_confirmation]
    end

    respond_to do |format|
      if flash[:alert].blank? and @user.update_attributes(params[:user])
        flash[:notice] = "User account has been updated"
        format.json { render :json => @user.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { render :action => :edit }
      else
        flash[:alert] << "Could not update user account. "
        format.json { render :text => "Could not update user account" }
        format.xml  { render :xml => @user.errors }
        format.html { render :action => :edit }
      end
    end

  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:js, :xml, :html)
  end


  # Get roles accessible by the current user
  #----------------------------------------------------
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability, :read)
  end

  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end

end