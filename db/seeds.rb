# frozen_string_literal: true

# Create Participants
25.times do
  participant = Participant.create!(new_id: Faker::Number.number(digits: 6), site: Rails.configuration.sites.sample,
                                    participant_type: Rails.configuration.participant_types.sample)
  # Create Interviews
  12.times do |n|
    interview = Interview.create!(
      participant_id: participant.id,
      round: n,
      interview_date: Faker::Date.between(from: 13.years.ago, to: 5.years.ago),
      age: (5..17).to_a.sample,
      grade: (1..12).to_a.sample.to_s,
      in_site_since: Faker::Number.between(from: 1995, to: 2014),
      current_residence_type: Rails.configuration.residence_types.sample
    )
    # Grade at interview time
    Event.create!(interview_id: interview.id, label: 'education',
                  description: "grade #{interview.grade}",
                  event_date: interview.interview_date)

    # Move event
    if [true, false].sample
      Event.create!(interview_id: interview.id, label: 'moves', description: Rails.configuration.move_types.sample,
                    event_date: interview.interview_date)
    end
  end
end
