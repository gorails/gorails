require "rails_helper"

RSpec.describe Event, type: :model do
  subject(:event) { build(:event) }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :local }
  it { is_expected.to respond_to :participants_limit }
  it { is_expected.to respond_to :start_at }
  it { is_expected.to respond_to :end_at }
  it { is_expected.to respond_to :provides_certificate}

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:local) }
  it { is_expected.to validate_presence_of(:participants_limit) }
  it { is_expected.to validate_presence_of(:start_at) }
  it { is_expected.to validate_presence_of(:end_at) }

  describe "#exceeded_limit?" do
    let(:user) { create :user_with_cpf }

    before do
      event.participants_limit = 9
      event.save
    end

    context "when limit not exceeded" do
      it "return false" do
        create_list :registration, 8, user: user, event: event

        expect(event.exceeded_limit?).to be_falsey
      end
    end

    context "when limit exceeded" do
      it "return true" do
        create_list :registration, 10, user: user, event: event

        expect(event.exceeded_limit?).to be_truthy
      end
    end
  end

  describe "#event_duration" do
    before do
      event.start_at = Time.now
      event.end_at = (Time.now + 2.hour)
    end

    it "returns the duration in hours" do
      expect(event.event_duration).to eq(2)
    end
  end

  describe "#event_happened?" do
    context "when :end_at is before now" do
      before { event.end_at = (Time.now - 2.hour) }

      it { expect(event.event_happened?).to be_truthy }
    end

    context "when :end_at is after now" do
      before { event.end_at = (Time.now + 2.hour) }

      it { expect(event.event_happened?).to be_falsey }
    end
  end

  describe "#inscriptions_open?" do
    context "when :status is true" do
      before { event.status = true }

      it { expect(event.inscriptions_open?).to be_truthy }
    end

    context "when :status is false" do
      before { event.status = false }

      it { expect(event.inscriptions_open?).to be_falsey }
    end
  end

  describe "#remaining_vacancies" do
    let(:user) { create :user_with_cpf }

    before do
      event.participants_limit = 4
      event.save

      create_list :registration, 2, event: event, user: user
    end

    it { expect(event.remaining_vacancies).to eq(2) }
  end
end
