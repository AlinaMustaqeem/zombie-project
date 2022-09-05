# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :vote_sent_comparison, foreign_key: :vote_sent_id, class_name: 'Vote', dependent: :destroy
  has_many :vote_reciever, through: :vote_sent_comparison

  has_many :vote_reciever_comparison, foreign_key: :vote_reciever_id, class_name: 'Vote', dependent: :nullify
  has_many :vote_sent, through: :vote_reciever_comparison

  has_many :sending_user_comparison, foreign_key: :sending_user_id, class_name: 'Trade', dependent: :nullify
  has_many :recieving_user, through: :sending_user_comparison

  has_many :recieving_user_comparison, foreign_key: :recieving_user_id, class_name: 'Trade', dependent: :nullify
  has_many :sending_user, through: :recieving_user_comparison

  has_one :inventory, dependent: :destroy

  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: 'Should contain letters Only' }, presence: true

  validates :age, inclusion: { in: 18..90 }, presence: true

  validates :longitude, inclusion: { in: -180..180 }, presence: true

  validates :latitude, inclusion: { in: -90..90 }, presence: true

  has_one_attached :image

  enum status: {
    Not_Infected: 0,
    Infected: 1
  }

  enum user_type: {
    user: 0,
    admin: 1
  }
end
