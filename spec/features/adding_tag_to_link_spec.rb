feature 'adding tags' do
  scenario 'adding a tag to a link' do
    visit '/links/new'
    fill_in 'title', with: 'NASA'
    fill_in 'url', with: 'www.nasa.gov'
    fill_in 'tag', with: 'science'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:tag)).to include('science')
  end

  scenario 'adding mulptiple tags to a link' do
    visit '/links/new'
    fill_in 'title', with: 'NASA'
    fill_in 'url', with: 'www.nasa.gov'
    fill_in 'tag', with: 'science, physics'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:tag)).to include('science')
    expect(link.tags.map(&:tag)).to include('physics')
  end
end
