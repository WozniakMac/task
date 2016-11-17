require 'spec_helper'

feature 'User edits payment' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Abacki' }
  let!(:payment) { create :payment, student: student }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
    find(:xpath, "//a[@title='edit']").click
  end

  scenario 'and checks breadcrumbs presence' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments  » Jan Abacki November'
    end
  end

  scenario do
    select '1', :from => 'payment_payment_date_3i'
    click_button 'Update Payment'
    expect(page).to have_content 'Payment has been updated!'
    expect(page).to have_content '2016-11-01'
  end
end
