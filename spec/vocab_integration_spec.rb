require('capybara/rspec')
require('./app')
require('pry')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('vocab path', :type => :feature) do
  it "adds a word" do
    visit('/')
    fill_in("word", :with => "delicious")
    fill_in("part_of_speech", :with => "adjective")
    fill_in("body", :with => "It tastes good")
    fill_in("in_a_sentence", :with => "that view is delicious")
    click_button("Add the word!")
    expect(page).to have_content('delicious')
    # click_link('delicious')
    # expect(page).to have_content('that view is delicious')
    # fill_in("part_of_speech", :with => "adjective")
    # fill_in("body", :with => "I want")
    # fill_in("in_a_sentence", :with => "delicious dinner")
    # click_button("Add the word!")
    # expect(page).to have_content('delicious')
  end
end
