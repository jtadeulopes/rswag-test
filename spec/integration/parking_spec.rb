require 'swagger_helper'

describe 'Parking API' do
  path '/parkings' do
    post 'Creates a parking' do
      consumes 'application/json'
      produces 'application/json'

      parameter name: :parking, in: :body, schema: {
        type: :object,
        properties: {
          plate: { type: :string }
        },
        required: [ 'plate' ]
      }

      response '201', 'parking created' do
        let(:parking) { { plate: 'FAA-1234' } }

        run_test!
      end

      response '422', 'empty plate' do
        let(:parking) { { plate: '' } }

        run_test!
      end

      response '422', 'invalid plate' do
        let(:parking) { { plate: 'PLATE' } }

        run_test!
      end
    end
  end

  path '/parkings/{id}/pay' do
    put 'Pay parking' do
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, :in => :path, :type => :string

      response '200', 'paid parking' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            ticket: { type: :string },
            plate: { type: :string },
            paid: { type: :boolean }
          },
          required: [ 'id', 'plate', 'ticket', 'paid' ]

        let(:id) { Parking.create(plate: 'ABC-1234').id }

        run_test!
      end
    end
  end
end
