require "rails_helper"

RSpec.describe Group, type: :model do
  subject { Group.new(name: "Fast Food", icon: "burger.png") }

  before { subject.save }

  it "name should be present" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "icon should be present" do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
