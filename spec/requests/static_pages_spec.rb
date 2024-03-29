# encoding: utf-8
require 'spec_helper'

describe "Static pages" do

    # 申请局部变量
    let(:title_name) { "Ruby on Rails Tutorial Sample App" }
    subject { page }

    describe "Home page" do
        before { visit root_path }

        it { should have_content('Sample App') }
        it { should have_title(full_title('')) }
        # it { should have_title("#{title_name}") }
        it { should_not have_title('| Home') }

        # it "应该有内容'Sample App'" do
        # 	expect(page).to have_content('Sample App')
        # end

        # it "should have the title 'Home'" do
        #     expect(page).to have_title("#{title_name} | Home")
        # end

        describe "for signed-in users" do
            let(:user) { FactoryGirl.create(:user) }
            before do
                FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
                FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
                sign_in user
                visit root_path
            end

            it "should render the user is feed" do
                user.feed.each do |item|
                    expect(page).to have_selector("li##{item.id}", text: item.content)
                end
            end

            describe "follower/following counts" do
                let(:other_user) { FactoryGirl.create(:user) }
                before do
                    other_user.follow!(user)
                    visit root_path
                end

                it { should have_link("0 following", href: following_user_path(user)) }
                it { should have_link("1 follower", href: followers_user_path(user)) }
            end
        end
    end

    describe "Help page" do
        before { visit help_path }

        it { should have_content('Help') }
        it { should have_title(full_title('Help')) }

        # it "包含'Help'" do
        #   expect(page).to have_content('Help')
        # end

		# it "should have the title 'Help'" do
		# 	expect(page).to have_title("#{title_name} | Help")
		# end
    end

    describe "Contact page" do
        before { visit contact_path }

        it { should have_selector('h1', text: 'Contact') }
        it { should have_title(full_title('Contact')) }

        # it "包含'Contact'" do
        #     expect(page).to have_content('Contact')
        # end

        # it "should have title contact" do
        #     expect(page).to have_title("#{title_name} | Contact")
        # end
    end

    describe "About page" do
        before { visit about_path }

        it { should have_content('About') }
        it { should have_title(full_title('About Us')) }

  #   	it "包含'About'" do
  #   		expect(page).to have_content('About')
  #   	end

		# it "should have the title 'About Us'" do
		# 	expect(page).to have_title("#{title_name} | About Us")
		# end
    end

    it "should have the right links on the layout" do
        visit root_path
        click_link "About"
        expect(page).to have_title(full_title('About Us'))
        click_link "Help"
        expect(page).to have_title(full_title('Help'))
        click_link "Contact"
        expect(page).to have_title(full_title('Contact'))
        click_link "Home"
        click_link "Sign up now!"
        expect(page).to have_title(full_title('Sign up'))
        click_link "sample app"
        expect(page).to have_title(full_title(''))
    end
end
