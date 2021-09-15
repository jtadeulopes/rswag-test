require 'rails_helper'

RSpec.describe Parking, type: :model do
  context 'validations' do
    subject { described_class.new }

    describe '#plate' do
      it 'is valid with valid attributes' do
        subject.plate = 'JTL-1985'

        is_expected.to be_valid
      end

      it 'is not valid without a plate' do
        is_expected.to be_invalid
      end

      it 'is not valid with a invalid plate' do
        subject.plate = 'ABC'

        is_expected.to be_invalid
      end
    end
  end

  context 'instance methods' do
    let!(:parking) { Parking.create!(plate: 'ABC-1234') }

    describe '#pay!' do
      it 'updates the paid at value and mark parking as paid' do
        parking.pay!

        expect(parking.paid?).to be true
        expect(parking.paid_at).to be_instance_of(ActiveSupport::TimeWithZone)
      end

      context "when already paid" do
        it 'not change the paid at value' do
          parking.pay!

          expect { parking.pay! }.to_not change { parking.paid_at }
        end
      end
    end
  end
end
