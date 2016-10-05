# app/models/registration.rb
# Model for events registrations
class Registration < ActiveRecord::Base
  belongs_to :event
  belongs_to :user, :foreign_key => "user_id"

  def self.is_registrated?(user_id)
  	return true if self.where(user_id: user_id).count >= 1
  	false
  end

	def self.to_register(user_id)
		self.create(user_id: user_id)
	end
end
