require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User adds a new link' do
  before(:each) do
    User.create(:email => 'test@test.com',
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario 'only after signing in' do
    expect(Link.count).to eq(0)
    visit '/'
    expect(page).not_to have_content("Add New Link")
    sign_in('test@test.com','test')
    expect(page).to have_content("Add New Link")
  end

  scenario 'when going to the links/new route' do
    expect(Link.count).to eq(0)
    visit '/links/new'
    add_link('http://www.makersacademy.com', 'Makers Academy')
    expect(Link.count).to eq(1)
    link = Link.first
    expect(link.url).to eq('http://www.makersacademy.com')
    expect(link.title).to eq('Makers Academy')
  end

  scenario 'with a few tags' do
    visit '/links/new'
    add_link('http://www.makersacademy.com', 'Makers Academy', ['education', 'ruby'])
    link = Link.first
    expect(link.tags.map(&:text)).to include('education')
    expect(link.tags.map(&:text)).to include('ruby')
  end

  def add_link(url,title, tags = [])
    within('#new-link') do
      fill_in 'url', :with => url
      fill_in 'title', :with => title
      fill_in 'tags', :with => tags.join(' ')
      click_button 'Add Link'
    end
  end

end
