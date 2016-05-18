class EventRegistrationsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_event
  before_filter :get_registration, except: %i(index)
  load_and_authorize_resource :event

  helper RegistrationsHelper

  def index
    @registrations = @event.registrations.includes("user").order("presence", "users.email")
    @presents      = @registrations.select(&:presence?).size
  end

  def update
    if params[:presence]
      presence = params[:presence].to_i == 1
      result   = presence ? :present : :absent

      respond_to do |format|
        format.json do
          render json: { status: :error, message: "O dado usuário já possui o status de presença desejado." } and return if @registration.presence == presence
          render json: { status: :success, result: result } and return if @registration.update_attribute(:presence, presence)
          render json: { status: :error, message: @registration.errors.full_messages }
        end
      end
    end
  end

  private

  def get_event
    @event = Event.find(params[:event_id])
  end

  def get_registration
    @registration = @event.registrations.find(params[:id])
  end
end
