require 'rails_helper'

describe PaymentDecorator do
  let(:student) { create :student, first_name: 'John', last_name: 'Smith' }
  let(:payment) { create :payment, student: student, amount: 100, date: '2015-10-10' }

  describe "#formatted_date" do
    subject { payment.decorate.formatted_amount }

    it { is_expected.to eq '100.00' }
  end
end