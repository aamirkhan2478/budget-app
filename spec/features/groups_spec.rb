require "rails_helper"

RSpec.describe Group, type: :system do
  user = User.create!(name: "john", email: "john#{Random.rand(1...1000)}@example.com", password: "password",password_confirmation: "password", confirmation_token: "token", confirmed_at: Time.zone.now, confirmation_sent_at:DateTime.now)

  subject do
    Group.new(user_id: user.id, name: "test", icon: "burger.png")
  end
  before do
    login_as(user, scope: :user)
    subject.save
  end

  describe "index page" do
    it "I can see the group's name" do
      visit root_path
      page.has_content?(subject.name)
    end

    it "I can see the group's icon." do
      visit root_path
      page.has_content?(subject.icon)
    end

    it "When I click on a post, it redirects me to that post's show page." do
      visit root_path
      click_on subject.name
      visit category_transaction_index_path(subject.id)
      category = Category.create!(user_id: user.id, name: "test_1", amount: 10)
      page.has_content?(category.name)
    end
  end
end
