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
    @cwatera = (@inventory.water + (@trade.waterc.to_i * 14))
    @csoupa = (@inventory.soup + (@trade.soupc.to_i * 12))
    @cpoucha = (@inventory.pouch + (@trade.pouchc.to_i * 10))
    @cak47a =  (@inventory.Ak47 + (@trade.ak47c.to_i * 8))
  end

  def exchange_sub_points
    @ewaters = (@inventory.water - (@trade.watere.to_i * 14))
    @esoups = (@inventory.soup - (@trade.soupe.to_i * 12))
    @epouchs = (@inventory.pouch - (@trade.pouche.to_i * 10))
    @ek47s = (@inventory.Ak47 - (@trade.ak47e.to_i * 8))
  end

  def exchange_add_points
    @ewatera = (@inventory.water + (@trade.watere.to_i * 14))
    @esoupa = (@inventory.soup + (@trade.soupe.to_i * 12))
    @epoucha = (@inventory.pouch + (@trade.pouche.to_i * 10))
    @eak47a =  (@inventory.Ak47 + (@trade.ak47e.to_i * 8))
  end

  def current_sub_points
    @cwaters = (@inventory.water - (@trade.waterc.to_i * 14))
    @csoups = (@inventory.soup - (@trade.soupc.to_i * 12))
    @cpouchs = (@inventory.pouch - (@trade.pouchc.to_i * 10))
    @cak47s = (@inventory.Ak47 - (@trade.ak47c.to_i * 8))
  end

  def updating
    current_add_points
    @inventory.update(water: @cwatera, soup: @csoupa, pouch: @cpoucha, Ak47: @cak47a)
    exchange_sub_points
    @inventory.update(water: @ewaters, soup: @esoups, pouch: @epouchs, Ak47: @ek47s)
    exchange_add_points
    @inventory2.update(water: @ewatera, soup: @esoupa, pouch: @epoucha, Ak47: @eak47a)
    current_sub_points
    @inventory2.update(water: @cwaters, soup: @csoups, pouch: @cpouchs, Ak47: @cak47s)
  end
end
