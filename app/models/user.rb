class User < ActiveRecord::Base
  # write associations here
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  after_initialize :set_default_admin

  def mood
    if self.happiness > self.nausea
      return "happy"
    elsif self.nausea > self.happiness
      return "sad"
    end
  end

  private

  def set_default_admin
    self.admin ||= false
  end
end
