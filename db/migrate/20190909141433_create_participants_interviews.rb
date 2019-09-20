# frozen_string_literal: true

class CreateParticipantsInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.integer :new_id
      t.string :participant_type
      t.string :residence_type

      t.timestamps
    end
    create_table :interviews do |t|
      t.integer :participant_id
      t.integer :round
      t.string :current_participant_type
      t.datetime :interview_date
      t.integer :age_in_months
      t.string :grade
      t.string :site
      t.integer :in_site_since
      t.string :current_residence_type

      t.timestamps
    end
  end
end
