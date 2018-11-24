require 'rails_helper'

describe 'user sees all the articles' do
  describe 'they visit /articles' do
    it 'see all the articles' do
      article1 = Article.create(title: 'manoj', body: 'this is manoj')
      article2 = Article.create(title: 'mandir', body: 'this is mandir')

      visit articles_path

      expect(page).to have_content(article1.title)
      expect(page).to have_content(article1.body)
      expect(current_path).to eq('/articles')
    end
  end
end
