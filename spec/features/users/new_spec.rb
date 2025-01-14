# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user register (new) page' do
  it 'can create a new user' do
    visit '/register'

    fill_in 'name', with: 'Steve'
    fill_in 'email', with: 'steve@steve.com'

    click_button

    expect(current_path).to eq("/users/#{User.all.last.id}")
    expect(page).to have_content('Steve')
  end

  it 'shows an error flash message when nothing is entered' do
    visit '/register'

    click_button

    expect(page).to have_content('User could not be created')
  end
end
