# lib/tasks/quake_report.rake

namespace :quake_report do
  desc 'Generate Quake match report and save it to a CSV file'
  task generate: :environment do
    require 'csv'

    CSV.open('quake_match_reports.csv', 'wb') do |csv|
      csv << ['Match ID', 'Total Kills', 'Players', 'Kills']
      Match.all.each do |match|
        match_id = match.id
        total_kills = match.total_kills
        players = match.players.map(&:name).join(', ')
        kills = match.kills.map { |player, kill| "#{player}: #{kill}" }.join(', ')
        kills_by_means = match.kills_by_means.map { |cause, count| "#{cause}: #{count}" }.join(', ')

        csv << [match_id, total_kills, players, kills, kills_by_means]
      end
    end

    CSV.open('quake_deaths_by_cause_reports.csv', 'wb') do |csv|
      csv << ['Match ID', 'Cause of Death', 'Count']

      Match.all.each do |match|
        match_id = match.id
        match.kills_by_means.each do |cause, count|
          csv << [match_id, cause, count]
        end
      end
    end
  end
end
