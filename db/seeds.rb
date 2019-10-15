# frozen_string_literal: true

# Create Participants
25.times do |t|
  participant = Participant.create!(new_id: Faker::Number.number(digits: 6), site: Rails.configuration.sites.sample,
                                    participant_type: Rails.configuration.participant_types.sample,
                                    discarded_at: t % 5 == 0 ? DateTime.now : nil)
  # Create Interviews
  count = 1
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

    # Events
    Event.create!(interview_id: interview.id, label: 'education',
                  description: interview.grade.to_s,
                  start: interview.interview_date.beginning_of_year,
                  end: interview.interview_date.end_of_year,
                  position: count)
    count += 1

    Event.create!(interview_id: interview.id, label: 'relationship_status',
                  description: (1..8).to_a.sample.to_s,
                  start: interview.interview_date.beginning_of_month,
                  end: interview.interview_date.end_of_year, position: count)
    count += 1

    if [true, false].sample
      Event.create!(interview_id: interview.id, label: 'moves',
                    description: Rails.configuration.move_types.sample,
                    start: interview.interview_date.beginning_of_year,
                    end: interview.interview_date.end_of_year, position: count)
    end
    count += 1

    if [true, false].sample
      Event.create!(interview_id: interview.id, label: 'abuse', description: 'yes',
                    start: interview.interview_date.beginning_of_month,
                    end: interview.interview_date.end_of_month, position: count)
    end
    count += 1

    if [true, false].sample
      Event.create!(interview_id: interview.id, label: 'mentalhealth',
                    description: (0..2).to_a.sample.to_s,
                    start: interview.interview_date.beginning_of_year,
                    end: interview.interview_date.end_of_month, position: count)
    end
    count += 1
  end
end
