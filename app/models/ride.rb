class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user = self.user
    attraction = self.attraction

    if too_short?(user, attraction) || too_broke?(user, attraction)
       "Sorry. You do not have enough tickets to ride the #{attraction.name}." if !too_short?(user, attraction)
       "Sorry. You are not tall enough to ride the #{attraction.name}." if !too_broke?(user, attraction)
       "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    else
      update_user(user, attraction)
      "Thanks for riding the #{attraction.name}!"
    end

  end

  private

  def too_short?(user, attraction)
    user.height < attraction.min_height
  end

  def too_broke?(user, attraction)
    user.tickets < attraction.tickets
  end

  def update_user(user, attraction)
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end
end
