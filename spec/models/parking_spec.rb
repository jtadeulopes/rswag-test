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
end
