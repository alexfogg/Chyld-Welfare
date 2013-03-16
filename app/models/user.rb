class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :is_donor, :is_app, :bio, :photo
  has_secure_password
  # before_save :default_values


  # private
  # def default_values
  #   self.is_doner ||= false
  #   self.is_app ||=false
  # end

end
