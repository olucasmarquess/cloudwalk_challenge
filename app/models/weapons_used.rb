# == Schema Information
#
# Table name: weapons_useds
#
#  id         :bigint           not null, primary key
#  times_used :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  match_id   :bigint           not null
#  weapon_id  :bigint           not null
#
# Indexes
#
#  index_weapons_useds_on_match_id   (match_id)
#  index_weapons_useds_on_weapon_id  (weapon_id)
#
# Foreign Keys
#
#  fk_rails_...  (match_id => matches.id)
#  fk_rails_...  (weapon_id => weapons.id)
#
class WeaponsUsed < ApplicationRecord
  belongs_to :weapon
  belongs_to :match, inverse_of: 'weapons_used'
end
