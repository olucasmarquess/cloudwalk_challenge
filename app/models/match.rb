# == Schema Information
#
# Table name: matches
#
#  id             :bigint           not null, primary key
#  kills          :jsonb
#  kills_by_means :jsonb
#  players        :jsonb
#  total_kills    :integer          default(0)
#  world_kills    :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Match < ApplicationRecord
  has_many :player_matches, inverse_of: 'match'
  has_many :weapons_used, inverse_of: 'match'
  has_many :deaths, inverse_of: 'match'
  has_many :players, through: :player_matches
  has_many :weapons, through: :weapons_used

  serialize :players, Array
  serialize :kills, Hash
  serialize :kills_by_means, Hash

  def generate_report
    {
      total_kills: self.total_kills,
      players: self.players,
      kills: self.kills,
      kills_by_means: self.kills_by_means
    }
  end

  def generate_death_by_cause_report
    self.kills_by_means
  end
  
end
