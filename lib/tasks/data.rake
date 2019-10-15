# frozen_string_literal: true

require 'csv'

namespace :data do
  desc 'Import data from CSV file'
  task :import, [:filename] => :environment do |_t, args|
    participants = Set[]
    interviews = []
    events = []
    CSV.foreach(args[:filename], headers: true) do |row|
      participants << { identifier: row[0], participant_type: row[6].split('-')[1], site: row[3].split('-')[1] }
      interviews << { identifier: row[2].tr('-', ''), participant_identifier: row[0], round: row[1], interview_date: Date.parse(row[4]), age: row[5], grade: row[8] } unless row[4].blank?
      interview_identifier = row[2].tr('-', '')
      events << { interview_identifier: interview_identifier, title: 'education', description: "enrolled - #{row[8]}", time: Date.parse(row[4]) } unless row[8].blank?
      events << { interview_identifier: interview_identifier, title: 'education', description: "highest - #{row[9]}", time: Date.parse(row[4]) } unless row[9].blank?
      row10 = row[10].split('-')
      events << { interview_identifier: interview_identifier, title: 'trauma', description: row10[1], time: Date.parse(row[4]) } if row10.size > 1 && row10[0] == '1'
      row11 = row[11].split('-')
      events << { interview_identifier: interview_identifier, title: 'mental health', description: row11[1], time: Date.parse(row[4]) } if row11.size > 1
      row12 = row[12].split('-')
      events << { interview_identifier: interview_identifier, title: 'moves', description: row12[1], time: Date.parse(row[4]) } if row12.size > 1
      row13 = row[13].split('-')
      events << { interview_identifier: interview_identifier, title: 'relationship status', description: row13[1], time: Date.parse(row[4]) } if row13.size > 1
    end
    Participant.import participants.to_a, validate: true, on_duplicate_key_update: { conflict_target: [:identifier], columns: %i[participant_type site] }
    Interview.import interviews, validate: true, on_duplicate_key_update: { conflict_target: [:identifier], columns: %i[participant_identifier round interview_date age grade] }
    Event.import events, validate: true
  end
end
