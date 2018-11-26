require "rails_helper"

describe "user deletes an article" do
  describe "they link from the show page" do
    it "displays all articles without the deleted entry" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit article_path(article_1)
      click_link "Edit"

      expect(current_path).to eq(edit_article_path(article_1))

      fill_in 'article[title]', with: 'Manoj'
      fill_in 'article[body]', with: 'Manoj is coding'
      click_on 'Update'

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content('Manoj')
      expect(page).to have_content('Manoj is coding')
    end
  end
end
