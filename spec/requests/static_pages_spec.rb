# encoding: utf-8
require 'spec_helper'

describe "StaticPages" do

    # 申请局部变量
    let(:title_name) { "Ruby on Rails Tutorial Sample App" }

    describe "Home page" do
        it "应该有内容'Sample App'" do
        	visit '/static_pages/home'
        	expect(page).to have_content('Sample App')
        end

        it "should have the title 'Home'" do
            visit '/static_pages/home'
            expect(page).to have_title("#{title_name} | Home")
        end
    end

    describe "Help page" do
    	it "包含'Help'" do
    		visit '/static_pages/help'
    		expect(page).to have_content('Help')
    	end

		it "should have the title 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_title("#{title_name} | Help")
		end
    end

    describe "Contact page" do
        it "包含'Contact'" do
            visit '/static_pages/contact'
            expect(page).to have_content('Contact')
        end

        it "should have title contact" do
            visit '/static_pages/contact'
            expect(page).to have_title("#{title_name} | Contact")
        end
    end

    describe "About page" do
    	it "包含'About'" do
    		visit '/static_pages/about'
    		expect(page).to have_content('About')
    	end

		it "should have the title 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_title("#{title_name} | About Us")
		end
    end
end
