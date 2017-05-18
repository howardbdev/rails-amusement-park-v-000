class User < ActiveRecord::Base
  # write associations here
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  after_initialize :set_default_admin

  private

  def set_default_admin
    self.admin ||= false
  end
end
