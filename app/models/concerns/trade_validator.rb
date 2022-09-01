# frozen_string_literal: true
class TradeValidator < ActiveModel::Validator

  def validate(record)
    if ((record.pouchc.nil?  && record.waterc.nil?) && (record.ak47c.nil? && record.soupc.nil?)|| (record.pouche.nil?  && record.watere.nil?) && (record.ak47e.nil? && record.soupe.nil?))
      record.errors.add :base, "Select Somethig you want"
    end
  end

end
