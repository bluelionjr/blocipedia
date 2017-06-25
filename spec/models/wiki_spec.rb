require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body. And what a body it is.") }

  describe "attributes" do
    it "has title, body, and user attributes" do
      expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body. And what a body it is.")
    end
  end
end
