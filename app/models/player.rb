# == Schema Information
#
# Table name: players
#
#  id                 :bigint           not null, primary key
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  name               :string
#  original_name      :string
#  total_kills        :integer          default(0)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_players_on_email  (email) UNIQUE
#
class Player < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :player_matches
  has_many :matches, through: :player_matches
end
