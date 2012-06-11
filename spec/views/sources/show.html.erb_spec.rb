require 'spec_helper'

describe "sources/show" do
  before(:each) do
    @source = assign(:source, stub_model(Source,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
