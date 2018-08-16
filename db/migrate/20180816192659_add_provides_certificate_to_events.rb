class AddProvidesCertificateToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :provides_certificate, :boolean    
  end
end