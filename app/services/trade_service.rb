class TradeService
  def initialize (param)

    @param = param
	end

	def equal_points

    @sum = @param[:waterc].to_i * 14 + @param[:soupc].to_i * 12 + @param[:pouchc].to_i * 10 + @param[:ak47c].to_i * 8
    @sume = @param[:watere].to_i * 14 + @param[:soupe].to_i * 12 + @param[:pouche].to_i * 10 + @param[:ak47e].to_i * 8
    return ((@sum == @sume) && (@sum != 0))

	end

end

