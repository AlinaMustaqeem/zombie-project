# frozen_string_literal: true
class Inventory < ApplicationRecord
  belongs_to :user
  after_create :points_value
  def points_value
    self.water = water.to_i * WATER_POINTS
    self.soup = soup.to_i * SOUP_POINTS
    self.pouch = pouch.to_i * POUCH_POINTS
    self.Ak47 = self.Ak47.to_i * AK47_POINTS
  end
end
