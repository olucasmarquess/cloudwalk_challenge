
class QuakeLogParser
  def initialize(key)
    @key = key
    @games = []
  end

  def parse
    byeebug
    object = S3_BUCKET.object(@key)
    lines = object.get.body.read.split("\n")

    current_game = nil

    lines.each do |line|
      if line.include?('InitGame')
        current_game = Match.new
        @games << current_game
      elsif current_game && line.include?('Kill')
        process_kill_line(line, current_game)
      end
    end
  end

  private

  def process_kill_line(line, current_game)
    killer, killed, cause = line.scan(/<([^>]*)> killed ([^ ]*) by (\w+)/).flatten
  
    current_game.total_kills += 1
  
    current_game.players |= [killer, killed].reject { |name| name == '<world>' }
  
    current_game.kills[killer] ||= 0
    current_game.kills[killed] ||= 0
    if killer == '<world>'
      current_game.kills[killed] -= 1
    else
      current_game.kills[killer] += 1
    end
  
    current_game.kills_by_means[cause] ||= 0
    current_game.kills_by_means[cause] += 1
  end
  
end
