require 'rails_helper'

RSpec.describe Payment do
  describe 'database columns' do
    it { should have_db_column :student_id }
    it { should have_db_column :amount }
    it { should have_db_column :date }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
  end
end