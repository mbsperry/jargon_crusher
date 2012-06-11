require 'spec_helper'

describe "jargon_files/edit" do
  before(:each) do
    @jargon_file = assign(:jargon_file, stub_model(JargonFile,
      :name => "MyString",
      :source_id => 1,
      :jargon_score => 1.5
    ))
  end

  it "renders the edit jargon_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jargon_files_path(@jargon_file), :method => "post" do
      assert_select "input#jargon_file_name", :name => "jargon_file[name]"
      assert_select "input#jargon_file_source_id", :name => "jargon_file[source_id]"
      assert_select "input#jargon_file_jargon_score", :name => "jargon_file[jargon_score]"
    end
  end
end
