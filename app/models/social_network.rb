class SocialNetwork < ActiveRecord::Base
  belongs_to :social_network_type
  belongs_to :user
end
