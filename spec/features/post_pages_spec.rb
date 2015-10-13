require 'rails_helper'

describe 'the add a post process' do
  it "adds a new post" do
    visit posts_path
    click_on "Add Post"
    fill_in "Title", :with => "Twitter Sucks"
    fill_in "Url", :with => "www.twitter.com"
    click_on "Create Post"
    expect(page).to have_content 'Twitter Sucks'
  end
end
