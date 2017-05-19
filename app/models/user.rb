class User < ActiveRecord::Base
  # write associations here
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  after_initialize :set_default_admin

  def mood
    if self.happiness > self.nausea
      "happy"
    elsif self.happiness < self.nausea
      "sad"
    else
      "meh... "
    end
  end

  private

  def set_default_admin
    self.admin ||= false
  end
end
