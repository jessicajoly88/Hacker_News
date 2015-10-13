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

  it "returns an errors message when title and url are left blank" do
    visit posts_path
    click_on "Add Post"
    fill_in "Title", :with => " "
    fill_in "Url", :with => " "
    click_on "Create Post"
    expect(page).to have_content "can't be blank"
  end
end

describe 'the delete a post process' do
  it "deletes a post" do
    visit posts_path
    click_on "Add Post"
    fill_in "Title", :with => "Twitter Sucks"
    fill_in "Url", :with => "www.twitter.com"
    click_on "Create Post"
    click_on "Delete"
    expect(page).to_not have_content 'Twitter Sucks'
  end
end

describe 'the edit a post process' do
  it "edits a post" do
    visit posts_path
    click_on "Add Post"
    fill_in "Title", :with => "Twitter Sucks Alot"
    fill_in "Url", :with => "www.twitter.com"
    click_on "Create Post"
    click_on "Edit"
    fill_in "Title", :with => "Twitter Sucks"
    expect(page).to have_content 'Sucks'
  end
end
