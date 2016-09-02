require 'rails_helper'

RSpec.feature "ContactInfo", type: :feature do
  context 'Going to website' do
    Steps 'being welcome' do
      Given 'i am on the welcome page' do
        visit '/'
        expect(page).to have_content ('Welcome')
      end
      Then 'inputting information' do
        fill_in 'given_name', with:"Alex"
        fill_in 'family_name', with:"Yong"
        fill_in 'email_address', with:"a@a.com"
        fill_in 'address', with:"123 happy ln"
        click_button("Submit")
      end
    end
  end

  context 'redirect from contactlist page to address book' do
    Steps 'on wlecome page' do
      Given 'I am on the welcome page' do
        visit '/'
      end
      Then 'inputting information' do
        fill_in 'given_name', with:"Alex"
        fill_in 'family_name', with:"Yong"
        fill_in 'email_address', with:"a@a.com"
        fill_in 'address', with:"123 happy ln"
        click_button("Submit")
      end
      And 'i should see a new page with the address book' do
        expect(page).to have_content "Alex"
      end
    end
  end


end
