class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation, :is_doner, :is_app, :bio, :photo
  before_save :default_values


  private
  def default_values
    self.is_doner ||= false
    self.is_app ||=false
  end

end
