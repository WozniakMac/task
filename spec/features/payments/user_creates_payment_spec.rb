require 'spec_helper'

feature 'User creates payment' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
    click_on 'New Payment'
  end

  scenario 'payment is not paid' do
    select '2016', :from => 'payment_payment_date_1i'
    select 'July', :from => 'payment_payment_date_2i'
    select '2', :from => 'payment_payment_date_3i'
    click_button 'Create Payment'
    expect(page).to have_content 'Payment has been created!'
    expect(page).to have_content 'Paid: false'
  end

  scenario 'payment is paid' do
    select '2016', :from => 'payment_payment_date_1i'
    select 'July', :from => 'payment_payment_date_2i'
    select '2', :from => 'payment_payment_date_3i'
    find(:css, "#payment_paid").set(true)
    click_button 'Create Payment'
    expect(page).to have_content 'Payment has been created!'
    expect(page).to have_content 'Paid: true'
  end
end
