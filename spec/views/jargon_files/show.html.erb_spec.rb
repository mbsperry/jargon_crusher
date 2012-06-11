require 'spec_helper'

describe "jargon_files/show" do
  before(:each) do
    @jargon_file = assign(:jargon_file, stub_model(JargonFile,
      :name => "Name",
      :source_id => 1,
      :jargon_score => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/1.5/)
  end
end
