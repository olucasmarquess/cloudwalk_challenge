# == Schema Information
#
# Table name: players
#
#  id            :bigint           not null, primary key
#  name          :string
#  original_name :string
#  total_kills   :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Player < ApplicationRecord
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :matches, through: :player_matches
  has_many :kills, class_name: 'Death', foreign_key: 'killer_id'
  has_many :deaths, class_name: 'Death', foreign_key: 'killed_id'
  has_many :player_matches, inverse_of: 'player'
end
