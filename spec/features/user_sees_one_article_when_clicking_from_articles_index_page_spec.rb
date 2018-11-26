require 'rails_helper'

describe 'user sees all the articles' do
  describe 'they visit /articles' do
    it 'click on article link to see its body' do
      article1 = Article.create(title: 'manoj', body: 'this is manoj')
      article2 = Article.create(title: 'mandir', body: 'this is mandir')

      visit articles_path

      click_on article1.title

      expect(page).to have_content(article1.title)
      expect(page).to have_content(article1.body)
    end
  end
end
