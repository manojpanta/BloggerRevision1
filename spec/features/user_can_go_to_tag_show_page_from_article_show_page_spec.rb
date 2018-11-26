require 'rails_helper'

describe 'user sees all the articles' do
  describe 'they visit /articles' do
    it 'clicking create new article can create new article' do
      article1 = Article.create(title: 'manoj', body: 'this is manoj')
      tag = article1.tags.create(name: 'manoj')
      tag1 = article1.tags.create(name: 'manojpanta')

      visit article_path(article1)


      expect(page).to have_link('manoj')
      expect(page).to have_link('manojpanta')

      click_on tag.name
      expect(current_path).to eq(tag_path(tag))
      expect(page).to have_content(tag.name)
    end
  end
end
