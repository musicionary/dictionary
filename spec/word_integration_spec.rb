require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('should open the home page') do
    visit('/')
    expect(page).to have_content("Welcome to Word Snob")
  end

  it('should take you to the add word form') do
    visit('/')
    click_link("Add a Word")
    expect(page).to have_content("Add a Word")
  end
end

describe('the new word form path', {:type => :feature}) do
  it('creates a new word from user input and renders success page') do
    visit('/words/new')
    fill_in("word", :with => "asymptote")
    click_button("submit")
    expect(page).to have_content("Success!")
  end
end

describe('the word id path', {:type => :feature}) do
  before do
    Word.clear()
  end
  it('renders a unique page for a word based on its id') do
    visit('/')
    expect(page).to have_content("Welcome to Word Snob")
    click_link("Add a Word")
    expect(page).to have_content("Add a Word")
    fill_in("word", :with => "asymptote")
    click_button("submit")
    expect(page).to have_content("Success!")
    click_link("Home")
    expect(page).to have_content("Welcome to Word Snob")
    click_link("asymptote")
    expect(page).to have_content("asymptote")
  end
end
