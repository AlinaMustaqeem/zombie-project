# frozen_string_literal: true

class AcceptInventory
  def initialize(coming, current, trade)
    @coming = coming
    @current = current
    @trade = trade
    @inventory = Inventory.find_by(user_id: @coming.to_i)
    @inventory2 = Inventory.find_by(user_id: @current.to_i)
  end

  def current_add_points
    @cwatera = (@inventory.water + (@trade.waterc.to_i * WATER_POINTS))
    @csoupa = (@inventory.soup + (@trade.soupc.to_i * SOUP_POINTS))
    @cpoucha = (@inventory.pouch + (@trade.pouchc.to_i * POUCH_POINTS))
    @cak47a =  (@inventory.Ak47 + (@trade.ak47c.to_i * AK47_POINTS))
  end

  def exchange_sub_points
    @ewaters = (@inventory.water - (@trade.watere.to_i * WATER_POINTS))
    @esoups = (@inventory.soup - (@trade.soupe.to_i * SOUP_POINTS))
    @epouchs = (@inventory.pouch - (@trade.pouche.to_i * POUCH_POINTS))
    @ek47s = (@inventory.Ak47 - (@trade.ak47e.to_i * AK47_POINTS))
  end

  def exchange_add_points
    @ewatera = (@inventory2.water + (@trade.watere.to_i * WATER_POINTS))
    @esoupa = (@inventory2.soup + (@trade.soupe.to_i * SOUP_POINTS))
    @epoucha = (@inventory2.pouch + (@trade.pouche.to_i * POUCH_POINTS))
    @eak47a =  (@inventory2.Ak47 + (@trade.ak47e.to_i * AK47_POINTS))
  end

  def current_sub_points
    @cwaters = (@inventory2.water - (@trade.waterc.to_i * WATER_POINTS))
    @csoups = (@inventory2.soup - (@trade.soupc.to_i * SOUP_POINTS))
    @cpouchs = (@inventory2.pouch - (@trade.pouchc.to_i * POUCH_POINTS))
    @cak47s = (@inventory2.Ak47 - (@trade.ak47c.to_i * AK47_POINTS))
  end

  def updating
    ActiveRecord::Base.transaction do
      current_add_points
      @inventory.update(water: @cwatera, soup: @csoupa, pouch: @cpoucha, Ak47: @cak47a)
      exchange_sub_points
      @inventory.update(water: @ewaters, soup: @esoups, pouch: @epouchs, Ak47: @ek47s)
      exchange_add_points
      @inventory2.update(water: @ewatera, soup: @esoupa, pouch: @epoucha, Ak47: @eak47a)
      current_sub_points
      @inventory2.update(water: @cwaters, soup: @csoups, pouch: @cpouchs, Ak47: @cak47s)

      @inventory2.update(total_qty: (@inventory2.water / WATER_POINTS + @inventory2.soup / SOUP_POINTS + @inventory2.pouch / POUCH_POINTS + @inventory2.Ak47 / AK47_POINTS))

      @inventory.update(total_qty: (@inventory.water / WATER_POINTS + @inventory.soup / SOUP_POINTS + @inventory.pouch / POUCH_POINTS + @inventory.Ak47 / AK47_POINTS))
    end
  rescue ActiveRecord::RecordInvalid
    Rails.logger.debug 'Oops. We tried to do an invalid operation!'
  end
end
