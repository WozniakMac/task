require 'spec_helper'

describe PaymentDecorator do
  let(:student) { create :student, first_name: 'John', last_name: 'Smith' }
  let!(:payment) { create :payment, student: student }
  let!(:payment_2) { create :payment, student: student, paid: true }

  describe '#month' do
    subject { payment.decorate.month }
    it { is_expected.to eq 'November' }
  end

  describe '#icon' do
    describe 'when payment is not paid' do
      subject { payment.decorate.icon }
      it { is_expected.to eq 'times' }
    end

    describe 'when payment is paid' do
      subject { payment_2.decorate.icon }
      it { is_expected.to eq 'check' }
    end
  end
end
