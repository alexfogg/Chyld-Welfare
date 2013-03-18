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
            expect(User.all.first.name).to eq 'Bob' #testing to make sure it's in database (this should happen before the above but it might cause a race ocndition)
      end
      it 'should login a correct user', js:true do
        visit root_path
        user = User.create(email:"bob@gmail.com",password:"a",password_confirmation:"a")
        click_link("Login")
        fill_in('email',:with=>user.email)
        fill_in('password',:with=>"a")
        click_button("Login")
      end

    end



    describe 'GET /users' do
        it 'displays a donation form', :js => true do
          visit root_path
          login
          click_link('Donate')
          page.should have_button('Submit')
        end
    end

    describe 'GET /donate' do
      it 'brings up the donation form', :js => true do
        visit root_path
          login
        click_link('Donate')
        page.should have_button('Submit')
      end

      it 'after filling out the form and clicking donate, the user should be an donor', :js => true do
        visit root_path
          login
        click_link('Donate')
        fill_in('user_donatename', :with => 'Big Donation')
        fill_in('user_donateamt', :with => 500)
        click_button('Submit')
        page.should have_link('Apply for Sponsorship')
        expect(User.first.donatename).to eq 'Big Donation'
      end

      it 'after applying, the page should display the applicant(s)', :js => true do
        visit root_path
          login
        click_link('Donate')
        fill_in('user_donatename', :with => 'Big Donation')
        fill_in('user_donateamt', :with => 500)
        click_button('Submit')
        click_link('View Donors')
        page.should have_text('Big Donation')
      end
    end

    describe 'GET /apply' do
      it 'brings up the application form', :js => true do
        visit root_path
          login
        click_link('Apply for Sponsorship')
        page.should have_button('Apply')
      end

      it 'after filling out the form and clicking apply, the user should be an applicant', :js => true do
        visit root_path
          login
        click_link('Apply for Sponsorship')
        fill_in('user_bio', :with => 'I need money')
        fill_in('user_photo', :with => 'http://cdn.memegenerator.net/instances/400x/28912602.jpg')
        click_button('Apply')
        page.should have_link('Donate')
        expect(User.first.bio).to eq 'I need money'
      end

      it 'after applying, the page should display the applicant(s)' do
      #  login
       # click_link('Apply for Sponsorship')
        #fill_in('user_bio', :with => 'I need money')
        #fill_in('user_photo', :with => 'http://cdn.memegenerator.net/instances/400x/28912602.jpg')
        #click_button('Apply')
        #click_link('View Applicants')
        #page.should have_text('I need money')
      end
    end

end


def login
        visit root_path
        user = User.create(email:"bob@gmail.com",password:"a",password_confirmation:"a")
        click_link("Login")
        fill_in('email',:with=>user.email)
        fill_in('password',:with=>"a")
        click_button("Login")
  end

















