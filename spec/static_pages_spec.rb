require 'spec_helper'
require 'rails_helper'

describe '.home' do

  it 'page properly renders' do
    visit ''

    expect(page).to have_content("jumbotron")
  end
end

describe '.about_us' do

  it 'page properly renders' do
    visit '/about_us'

    expect(page).to have_content('About Us')
  end
end

describe '.people' do
  it 'page appears' do
    visit '/people'
    expect(page).to have_content("Core Members")
  end
end

describe '.events' do
  it 'stub appears' do
    visit '/events'

    expect(page).to have_content("Calendar Stub")
  end
end

describe '.contact_us' do
  it 'page appears' do
    visit '/contact_us'

    expect(page).to have_content("Contact Us")
    expect(page).to have_content("Facebook Page:")
    expect(page).to have_content("WeChat Official Account")
  end
end