# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :inventory, dependent: :destroy

  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: 'Should contain letters Only' }, presence: true

  validates :age, inclusion: { in: 18..90, message: 'Should be 18 to 90' }, presence: true

  validates :longitude, inclusion: { in: -180..180, message: 'Should be -180 to +180 (degrees)' }, presence: true

  validates :latitude, inclusion: { in: -90..90, message: 'Should be -90 to +90 (degrees)' }, presence: true

  has_one_attached :image
end
