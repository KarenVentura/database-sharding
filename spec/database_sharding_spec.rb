require 'rails_helper'

RSpec.describe 'DatabaseSharding'do
  describe 'Michelada company' do
    let!(:company) { create(:company, name: 'Michelada') }
    let!(:database) { create(:database, name: 'michelada_test', company: company) }

    before(:each) do
      ::Databases::ConnectionService.new(company).call
    end

    describe '#michelada' do
      context 'when is a valid company' do
        it 'should return michelada company applicants' do
          expect(Applicant.using(:michelada).count).to eq(4)
          expect(Applicant.using(:michelada).all.map(&:name)).to eq(["karenx", "karenx1", "karenx2", "karenx3"])
        end
      end
    end
  end

  describe 'Wdt company' do
    let!(:company) { create(:company) }
    let!(:database) { create(:database, company: company) }

    before(:each) do
      ::Databases::ConnectionService.new(company).call
    end

    describe '#wtd' do
      context 'when is a valid company' do
        it 'should return wdt company applicants' do
          expect(Applicant.using(:wdt).count).to eq(3)
          expect(Applicant.using(:wdt).all.map(&:name)).to eq(["wdtx", "wdtx1", "wdtx2"])
        end
      end
    end
  end
end
