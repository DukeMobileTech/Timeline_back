# frozen_string_literal: true

json.array! @participants do |participant|
  json.id participant.id
  json.new_id participant.new_id
  json.participant_type participant.participant_type
  json.site participant.site

  json.interviews participant.interviews do |interview|
    json.id interview.id
    json.participant_id interview.participant_id
    json.round interview.round
    json.interview_date interview.interview_date
    json.age interview.age
    json.grade interview.grade
    json.in_site_since interview.in_site_since
    json.current_residence_type interview.current_residence_type
  end

  json.events participant.events do |event|
    json.id event.id
    json.interview_id event.interview_id
    json.participant_id event.interview.participant_id
    json.title event.label
    json.description event.description
    json.time event.event_date
  end
end
