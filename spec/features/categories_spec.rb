require 'rails_helper'

RSpec.describe Category, type: :system do
  user = User.create!(name: 'john', email: "john#{Random.rand(1...1000)}@example.com", password: 'password',
                      password_confirmation: 'password', confirmation_token: 'token', confirmed_at: Time.zone.now, confirmation_sent_at: DateTime.now)
  group = Group.create!(user_id: user.id, name: 'test', icon: 'burger.png')
  subject do
    Category.new(user_id: user.id, name: 'test', amount: 20)
  end
  before do
    login_as(user, scope: :user)
    subject.save
  end

  describe 'index page' do
    it "I can see the categories's name" do
      visit category_transaction_index_path(group.id)
      page.has_content?(subject.name)
    end

    it "I can see the categories's amount." do
      visit category_transaction_index_path(group.id)
      page.has_content?(subject.amount)
    end

    it 'When I click on a Add new trasaction button, it redirects me to that new trasaction page' do
      visit category_transaction_index_path(group.id)
      click_on 'Add New Transaction'
      visit new_category_transaction_path(group.id)
      page.has_content?('Add Transaction')
    end
  end
end
