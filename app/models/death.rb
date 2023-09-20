# == Schema Information
#
# Table name: deaths
#
#  id         :bigint           not null, primary key
#  cause      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  killed_id  :bigint
#  killer_id  :bigint
#  match_id   :bigint
#
# Indexes
#
#  index_deaths_on_killed_id  (killed_id)
#  index_deaths_on_killer_id  (killer_id)
#  index_deaths_on_match_id   (match_id)
#
# Foreign Keys
#
#  fk_rails_...  (killed_id => players.id)
#  fk_rails_...  (killer_id => players.id)
#  fk_rails_...  (match_id => matches.id)
#
class Death < ApplicationRecord
  belongs_to :match
  belongs_to :killer, class_name: 'Player'
  belongs_to :killed, class_name: 'Player'
  belongs_to :match, inverse_of: 'deaths'
  has_many :deaths
end
