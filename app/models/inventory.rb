# frozen_string_literal: true

class Inventory < ApplicationRecord
  belongs_to :user
  after_create :points_value

  def points_value
    self.water = water.to_i * 14
    self.soup = soup.to_i * 12
    self.pouch = pouch.to_i * 10
    self.Ak47 = Ak47.to_i * 8
  end
end
