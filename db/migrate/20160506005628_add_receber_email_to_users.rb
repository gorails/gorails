class AddReceberEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :receber_email, :boolean, default: true
    add_column :users, :receber_email_parceiros, :boolean, default: true
    add_column :users, :city, :string
  end
end
