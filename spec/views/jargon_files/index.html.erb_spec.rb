require 'spec_helper'

describe "jargon_files/index" do
  before(:each) do
    assign(:jargon_files, [
      stub_model(JargonFile,
        :name => "Name",
        :source_id => 1,
        :jargon_score => 1.5
      ),
      stub_model(JargonFile,
        :name => "Name",
        :source_id => 1,
        :jargon_score => 1.5
      )
    ])
  end

  it "renders a list of jargon_files" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
