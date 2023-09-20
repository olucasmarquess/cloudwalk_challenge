# app/services/quake_log_parser.rb
class QuakeLogParser
  def initialize(file_path)
    @file_path = file_path
  end

  def parse
    current_game = nil
    File.foreach(@file_path) do |line|
      if line.include?('InitGame')
        current_game = Match.create(total_kills: 0, world_kills: 0)
      elsif current_game && line.include?('Kill')
        process_kill_line(line.strip, current_game)
      end
    end
  end

  private

  def process_kill_line(line, current_game)
    killer, killed, cause = line.scan(/<([^>]*)> killed ([^ ]*) by (\w+)/).flatten

    current_game.total_kills += 1
    current_game.save

    killer_player = killer == '<world>' ? nil : Player.find_or_create_by(name: killer)
    killed_player = Player.find_or_create_by(name: killed)

    PlayerMatch.create(player: killer_player, match: current_game) if killer_player
    PlayerMatch.create(player: killed_player, match: current_game)

    death = Death.create(killer: killer_player, killed: killed_player, match: current_game, cause: cause)

    weapon = Weapon.find_or_create_by(name: cause)
    WeaponsUsed.create(weapon: weapon, match: current_game)

    if killer == '<world>'
      current_game.world_kills += 1
      current_game.save
    else
      killer_player.total_kills += 1
      killer_player.save
    end
    killed_player.save
  end
end
