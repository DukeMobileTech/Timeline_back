# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :interview_identifier
      t.string :title
      t.text :description
      t.datetime :time
      t.string :uuid
      t.datetime :discarded_at
      t.timestamps
    end
    add_column :participants, :site, :string
    add_column :participants, :discarded_at, :datetime
    rename_column :participants, :new_id, :identifier
    remove_column :participants, :residence_type

    remove_column :interviews, :site
    remove_column :interviews, :current_participant_type
    remove_column :interviews, :in_site_since
    remove_column :interviews, :current_residence_type
    rename_column :interviews, :age_in_months, :age
    rename_column :interviews, :participant_id, :participant_identifier
    add_column :interviews, :discarded_at, :datetime
    add_column :interviews, :identifier, :integer

    add_index :participants, :discarded_at
    add_index :participants, :identifier, unique: true
    add_index :interviews, :discarded_at
    add_index :interviews, :identifier, unique: true
    add_index :interviews, :participant_identifier
    add_index :events, :discarded_at
    add_index :events, :interview_identifier
  end
end
