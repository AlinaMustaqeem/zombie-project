# frozen_string_literal: true

class Inventory < ApplicationRecord
  belongs_to :user
  before_create :update_points

  validates :water, numericality: true, presence: true
  validates :pouch, numericality: true, presence: true
  validates :Ak47, numericality: true, presence: true
  validates :soup, numericality: true, presence: true

  def update_points
    self.water = water.to_i * WATER_POINTS
    self.soup = soup.to_i * SOUP_POINTS
    self.pouch = pouch.to_i * POUCH_POINTS
    self.Ak47 = self.Ak47.to_i * AK47_POINTS
    self.total_qty = (water / WATER_POINTS + soup / SOUP_POINTS + pouch / POUCH_POINTS + self.Ak47 / AK47_POINTS)
  end

end
