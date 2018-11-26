require 'rails_helper'

describe 'user sees all the articles' do
  describe 'they visit /articles' do
    it 'clicking create new article can create new article' do
      article1 = Article.create(title: 'manoj', body: 'this is manoj')
      article2 = Article.create(title: 'mandir', body: 'this is mandir')

      visit articles_path

      click_on "Create New Article"
      expect(current_path).to eq(new_article_path)

      fill_in 'article[title]', with: 'New Title'
      fill_in 'article[body]', with: 'New body'
      click_on 'Create Article'

      expect(page).to have_content('New Title')
      expect(page).to have_content('New body')

    end
  end
end
