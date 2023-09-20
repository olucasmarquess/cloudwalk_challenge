# == Schema Information
#
# Table name: player_matches
#
#  id         :bigint           not null, primary key
#  kills      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  match_id   :bigint           not null
#  player_id  :bigint           not null
#
# Indexes
#
#  index_player_matches_on_match_id   (match_id)
#  index_player_matches_on_player_id  (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (match_id => matches.id)
#  fk_rails_...  (player_id => players.id)
#
class PlayerMatch < ApplicationRecord
  belongs_to :player
  belongs_to :match

end
