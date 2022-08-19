# frozen_string_literal: true
module UsersHelper
  def vote_count(user)
    Vote.where(vote_reciever_id: user.id).count
  end

  def not_effected?(user)
    ((current_user != user) && user.status == Not_Infected)
  end

  def not_voted?(user)
    !(current_user.vote_reciever.ids.include? user.id)
  end

  def not_infected_count
    User.where(status:'Not_Infected').count
  end

  def infected_count
    User.where(status:'Infected').count
  end

  def total_users
    User.all.count
  end

  def water_sum
    (Inventory.pluck(:water).inject (0) { |sum, i| sum + i})/14
  end

  def soup_sum
    (Inventory.pluck(:soup).inject (0) { |sum, i| sum + i})/12
  end

  def pouch_sum
    (Inventory.pluck(:pouch).inject (0) { |sum, i| sum + i})/10
  end

  def ak47_sum
    (Inventory.pluck(:Ak47).inject (0) { |sum, i| sum + i})/8
  end

  def average_water
    water_sum/total_users
  end

  def average_soup
    soup_sum/total_users
  end

  def average_pouch
    pouch_sum/total_users
  end
  def average_Ak47
    ak47_sum/total_users
  end

end
