require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('should open the home page') do
    visit('/')
    expect(page).to have_content("Welcome to Word Snob")
  end
end
