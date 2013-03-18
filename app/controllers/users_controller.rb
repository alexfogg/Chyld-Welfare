class UsersController < ApplicationController
  def splash #Splash page
    #if auth redirect to second
  end
  def index #second page (THIS SHOULD BE AN HTML REQUEST)
    render :main
  end
  def new #
    @user = User.new
  end
  def create
    @user = User.create(params[:user])
  end

  #APPLY
  def applyf #renders form partial to edit user (aka add profile and turn is_app true)
    @user = @auth
  end
  def create_applicant #edits user for account for application
    @auth.update_attributes(params[:user])
    @auth.is_app = true
    @auth.save
  end

  #Donate
  def donatef #renders form partial to edit user (aka change is_donor true)
    @user = @auth
  end
  def create_donor
    @auth.is_donor = true
    @auth.update_attributes(params[:user])
    @auth.save
  end


  #Views
  def dlist

  end

  def alist

  end

end