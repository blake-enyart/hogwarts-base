require 'rails_helper'

describe 'As a user' do
  it 'returns students from house' do
    # When I visit "/"
    visit '/'
    # And I select "Slytherin" from the dropdown
    find('#house').find(:xpath, 'option[3]').select_option
    # And I click on "Get Students"
    click_on('Get Students')
    # Then my path should be "/search" with "house=slytherin" in the parameters
    expect(current_path).to eq('/search')
    expect(current_url).to include('house=slytherin')
    # And I should see a message "22 Students"
    expect(page).to have_content('22 Students')
    # And I should see a list of the 22 members of Slytherin
    expect(page).to have_css('.student-card', count: 22)
    # And I should see a name and id for each student.
    within(first('.student-card')) do
      expect(page).to have_css('.student-name', text: 'Student Name: ')
      expect(page).to have_css('.student-id', text: 'Student ID: ')
    end
  end
end
