require 'rails_helper'

RSpec.describe EventRegistrationsController, type: :controller do

  login_user

  let(:event) { create(:event) }

  before { 2.times { create :registration, event: event } }

  describe '#index' do
    let(:do_request) { get :index, event_id: event.id }

    context "when user has admin role," do
      before { @current_user.add_role("admin") }

      context "and no user is marked as present yet," do
        it 'renders the page with no user present' do
          do_request
          expect(response).to be_success
          expect(assigns(:registrations).size).to eq(2)
          expect(assigns(:presents)).to eq(0)
        end
      end

      context "and no user is marked as present yet," do
        before { event.registrations.last.update_attribute(:presence, true) }

        it 'renders the page with one user marked as present' do
          do_request
          expect(response).to be_success
          expect(assigns(:registrations).size).to eq(2)
          expect(assigns(:presents)).to eq(1)
        end
      end
    end

    context "when user doesn't have admin role," do
      it 'redirects user to home page' do
        do_request
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("You are not authorized to access this page.")
      end
    end
  end

  describe "#update" do
    let(:registration)   { event.registrations.first }
    let(:request_params) { { event_id: event, id: registration, format: 'json' } }
    let(:do_request)     { put :update, request_params }

    context "when given user is not marked as present in the event yet," do
      context "and logged user tries to mark the user as present in the event," do
        before { request_params.update(presence: "1") }

        context "and logged user has admin role," do
          before { @current_user.add_role("admin") }

          it "marks the user as present in the event" do
            expect(registration.presence).to_not be
            do_request
            expect(response.body).to eq('{"status":"success","result":"present"}')
            expect(registration.reload.presence).to be
          end
        end

        context "but logged user doesn't have admin role," do
          it "doesn't mark the user as present in the event" do
            expect(registration.presence).to_not be
            do_request
            expect(response.body).to include("redirected")
            expect(registration.reload.presence).to_not be
          end
        end
      end
    end

    context "when given user is already marked as present in the event yet," do
      before { registration.update_attribute(:presence, true) }

      context "and logged user tries to mark the user as present in the event," do
        before { request_params.update(presence: "1") }

        context "and logged user has admin role," do
          before { @current_user.add_role("admin") }

          it "doesn't mark the user as present in the event" do
            expect(registration.presence).to be
            do_request
            expect(response.body).to eq('{"status":"error","message":"O dado usuário já possui o status de presença desejado."}')
            expect(registration.reload.presence).to be
          end
        end
      end
    end
  end
end
