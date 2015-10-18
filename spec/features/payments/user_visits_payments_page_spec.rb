require 'spec_helper'

feature 'User visits payments page'  do
  let!(:student) { create :student, first_name: 'Jan' }
  let!(:payment_1) { create :payment, student: student, amount: 100, date: '2015-10-10' }
  let!(:payment_2) { create :payment, student: student, amount: 150, date: '2015-04-07' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
  end

  scenario 'should see payments list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content 'Jan'
    expect(page).to have_content '100'
    expect(page).to have_content '150'
    expect(page).to have_content '2015-10-10'
    expect(page).to have_content '2015-04-07'
  end

  scenario 'only when sign in' do
    logout
    visit payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end