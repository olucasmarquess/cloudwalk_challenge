# == Schema Information
#
# Table name: weapons
#
#  id          :bigint           not null, primary key
#  name        :string
#  weapon_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Weapon < ApplicationRecord
  has_many :weapons_used
  has_many :matches, through: :weapons_used
end
