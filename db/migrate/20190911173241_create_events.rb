# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :interview_id
      t.string :label
      t.text :description
      t.datetime :event_date
      t.timestamps
    end
    remove_column :interviews, :site
    add_column :participants, :site, :string
    remove_column :participants, :residence_type
    remove_column :interviews, :current_participant_type
    rename_column :interviews, :age_in_months, :age
  end
end
