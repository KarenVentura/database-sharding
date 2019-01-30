# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Databases::ConnectionService do
  let!(:company) { create(:company, name: 'Wdt') }

  describe '#call' do
    context 'when the connection is successful' do
      let!(:database) { create(:database, company: company) }

      it 'returns a hash' do
        response = described_class.new(company).call
        expect(response.keys).to eq([:wdt])
        expect(response).to eq(wdt:
                                 {
                                   adapter: 'postgresql',
                                   database: 'wdt_test',
                                   username: nil,
                                   password: nil,
                                   host: 'localhost',
                                   encoding: 'unicode'
                                 })
      end
    end

    context 'when the database is not present' do
      let(:michelada) { create(:company, name: 'michelada') }

      it 'returns a message from the exception' do
        response = described_class.new(michelada).call
        expect(response).to match(/undefined method `name' for nil:NilClass/)
      end
    end
  end
end
