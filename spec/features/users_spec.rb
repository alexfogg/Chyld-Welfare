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
            expect(User.all.first.name).to eq 'Bob' #testing to make sure it's in database (this should happen before the above but it might cause a race condition)
      end

    end



    describe 'GET /users' do
        it 'displays a donation form', :js => true do
          visit users_path
          click_link('Donate')
          page.should have_button('Submit')
        end
    end


    describe 'GET /apply' do
      it 'brings up the application form', :js => true do
        visit users_path
        click_link('Apply for Sponsorship')
        page.should have_button('Apply')
      end

      it 'after filling out the form and clicking apply, the user should be an applicant', :js => true do
        visit users_path
        click_link('Apply for Sponsorship')
        fill_in('user_bio', :with => 'I need money')
        fill_in('user_photo', :with => 'http://cdn.memegenerator.net/instances/400x/28912602.jpg')
        click_button('Apply')
        expect(User.first.user.bio).to eq 'I need money'
      end

      it 'after applying, the page should display the applicant(s)' do
        visit users_path
        click_link('Apply for Sponsorship')
        fill_in('user_bio', :with => 'I need money')
        fill_in('user_photo', :with => 'http://cdn.memegenerator.net/instances/400x/28912602.jpg')
        click_button('Apply')
        page.should have_text('I need money')
      end
    end
end

















