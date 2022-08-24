# frozen_string_literal: true

class TradeService
  def initialize(param)
    @param = param
  end

  def current_points
    water_soupc = @param[:waterc].to_i * WATER_POINTS + @param[:soupc].to_i * SOUP_POINTS
    pouch_akc = @param[:pouchc].to_i * POUCH_POINTS + @param[:ak47c].to_i * AK47_POINTS
    return (water_soupc + pouch_akc)
  end

  def exchnage_points
    water_soupe = @param[:watere].to_i * WATER_POINTS + @param[:soupe].to_i * SOUP_POINTS
    pouch_ake = + @param[:pouche].to_i * POUCH_POINTS + @param[:ak47e].to_i * AK47_POINTS
    return (water_soupe + pouch_ake)
  end

  def equal_points
    @sum = current_points
    @sume = exchnage_points
    ((@sum == @sume) && (@sum != 0))
  end
end
