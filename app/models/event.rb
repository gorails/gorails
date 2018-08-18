# app/models/event.rb
class Event < ActiveRecord::Base
  include PublicActivity::Model
  include ActionView::Helpers

  tracked owner: ->(controller, model) { controller && controller.current_user }

  resourcify

  has_many :albums
  has_many :attachments,as: :origin
  has_many :partners
  has_many :gifts
  has_many :registrations, counter_cache: true
  has_many :users, through: :registrations  

  belongs_to :user

  accepts_nested_attributes_for :attachments,allow_destroy: true
  accepts_nested_attributes_for :partners, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :gifts, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :albums, allow_destroy: true, reject_if: :all_blank

  delegate :is_registrated?, :to_register, to: :registrations, prefix: true, allow_nil: true

  alias_method :is_registrated?, :registrations_is_registrated?
  alias_method :to_register, :registrations_to_register

  scope :not_happened_yet, ->(limit_date) { where("end_at > ?", limit_date) }

  validates_presence_of :name, :description, :local, :participants_limit, :start_at, :end_at

  # Returns false if event is full
  def exceeded_limit?
    self.registrations.count >= self.participants_limit
  end

  # Returns duration of event
  def event_duration
    ((self.end_at - self.start_at) / 1.hour).round
  end

  def event_happened?
    DateTime.now > self.end_at
  end

  def inscriptions_open?
    self.status
  end

  def remaining_vacancies
    self.participants_limit - self.registrations.count
  end
end
