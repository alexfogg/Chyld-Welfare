require 'spec_helper'

describe 'Users' do
  describe 'User create form' do

      it 'should be shown when pressing Create Account',:js => true  do
          visit root_path
          click_link('Create Account')
          page.should have_button('Create Account')
          page.should have_button('Cancel')
      end
      it 'after filling the form and clicking create account, user should be createsd',:js => true do
          visit root_path
          click_link('Create Account')
          fill_in('user_name',:with=>'Bob')
          fill_in('user_email',:with=>'Bob@gmail.com')
          fill_in('user_password',:with=>'a')
          fill_in('user_password_confirmation',:with=>'a')
          click_button('Create Account')
            #Tests
            page.should have_text('You have successfully created an account!') #testing to make sure you have confirmation showing
            page.should have_button('Login') #Testing to make sure you have login form showing
            page.should_not have_button('Create Account') #testing to make sure you don't have the create form still up
            expect(User.first.user.name).to eq 'Bob' #testing to make sure it's in database (this should happen before the above but it might cause a race condition)
      end

    end



    describe 'GET /main' do
    it 'displays a donation form', :js => true do
      visit users_path
      click_link('Donate')
      page.should have_button('Submit')
    end

  end




end