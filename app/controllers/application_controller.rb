class ApplicationController < ActionController::Base
  before_filter :authenticate_user!, :only => [:edit, :new, :destroy, :create_cs, :remove_cs]
  protect_from_forgery
end
