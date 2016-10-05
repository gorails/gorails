class AddFieldToRegistrationsPresence < ActiveRecord::Migration
  def change
    add_column :registrations, :presence, :boolean, default: false
  end
end
