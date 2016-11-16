require 'spec_helper'

feature 'User creates student' do
  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    click_on 'Add new one'
  end

  context 'with valid input' do
    scenario 'without birthdate filled' do
      fill_in 'First name', with: 'Adrian'
      fill_in 'Last name', with: 'Nowacki'
      click_button 'Create Student'
      expect(page).to have_content 'Student has been created!'
    end

    scenario 'with birthdate filled' do
      fill_in 'First name', with: 'Adrian'
      fill_in 'Last name', with: 'Nowacki'
      select '1992', :from => 'student_birthdate_1i'
      select 'July', :from => 'student_birthdate_2i'
      select '2', :from => 'student_birthdate_3i'
      click_button 'Create Student'
      expect(page).to have_content 'Student has been created!'
      expect(page).to have_content '1992-07_02'
    end
  end

  scenario 'with missing first name' do
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with missing Last name' do
    fill_in 'First name', with: 'Adrian'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end
end
