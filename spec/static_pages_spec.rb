require 'spec_helper'
require 'rails_helper'

describe '.home' do

  it 'page properly renders' do
    visit ''

    expect(page).to have_content("About Da-Tong")
  end
end

describe '.people' do
  it 'page appears' do
    visit '/people'

    expect(page).to have_content("Core Members")
  end
end