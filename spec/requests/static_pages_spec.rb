# encoding: utf-8
require 'spec_helper'

describe "StaticPages" do

    describe "Home page" do
        it "应该有内容'Sample App'" do
        	visit '/static_page/home'
        	expect(page).to have_content('Sample App')
        end
    end
end
