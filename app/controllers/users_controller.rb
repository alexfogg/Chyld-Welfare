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
    user =  User.create(params[:user])
    user.is_app = true

  end
  def apply #edits user for account for application
  end

  #Donate
  def donatef #renders form partial to edit user (aka change is_donnor true)
    @user = User.new
  end
  def donate #
  end

end