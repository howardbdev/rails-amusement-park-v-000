class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user 
end
