# frozen_string_literal: true
class Inventory < ApplicationRecord
  belongs_to :user

  before_create do
    self.water = water.to_i * WATER_POINTS
    self.soup = soup.to_i * SOUP_POINTS
    self.pouch = pouch.to_i * POUCH_POINTS
    self.Ak47 = self.Ak47.to_i * AK47_POINTS
    self.total_qty = (self.water/ WATER_POINTS + self.soup / SOUP_POINTS + self.pouch / POUCH_POINTS + self.Ak47/ AK47_POINTS)
  end

end
