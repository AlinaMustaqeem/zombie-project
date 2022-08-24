# frozen_string_literal: true

class TradeService
  def initialize(param)
    @param = param
  end

  def current_points
    water_soupc = @param[:waterc].to_i * 14 + @param[:soupc].to_i * 12
    pouch_akc = @param[:pouchc].to_i * 10 + @param[:ak47c].to_i * 8
    water_soupc + pouch_akc
  end

  def exchnage_points
    water_soupe = @param[:watere].to_i * 14 + @param[:soupe].to_i * 12
    pouch_ake = + @param[:pouche].to_i * 10 + @param[:ak47e].to_i * 8
    water_soupe + pouch_ake
  end

  def equal_points
    @sum = current_points
    @sume = exchnage_points
    ((@sum == @sume) && (@sum != 0))
  end
end
