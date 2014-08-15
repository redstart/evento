class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end

    add_index :registrations, :attendee_id
    add_index :registrations, :attended_event_id
  end
end
