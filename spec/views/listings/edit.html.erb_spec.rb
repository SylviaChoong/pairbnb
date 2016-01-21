require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :title => "MyString",
      :description => "MyString",
      :price => 1
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input#listing_title[name=?]", "listing[title]"

      assert_select "input#listing_description[name=?]", "listing[description]"

      assert_select "input#listing_price[name=?]", "listing[price]"
    end
  end
end
