describe "they fill in a comment form" do
  it "displays the comment on the article show" do
    article = Article.create!(title: "New Title", body: "New Body")

    visit article_path(article)

    fill_in "comment[author_name]", with: "ME!"
    fill_in "comment[body]", with: "So many thoughts on this article."
    click_on "Submit"

    expect(current_path).to eq(article_path(article))
    expect(page).to have_content("Post a Comment")
    expect(page).to have_content("ME!")
    expect(page).to have_content("So many thoughts on this article.")
  end
end
