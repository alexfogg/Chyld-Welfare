require 'spec_helper'

describe 'Users' do
  describe 'GET /main' do
    it 'displays a donation form' do
      visit users_path
      click_link('Donate')
      page.should have_button('Submit')
    end
  end




end