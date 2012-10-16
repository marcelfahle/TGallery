require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :text => "MyString",
      :author_name => "MyString",
      :author_email => "MyString"
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "input#comment_text", :name => "comment[text]"
      assert_select "input#comment_author_name", :name => "comment[author_name]"
      assert_select "input#comment_author_email", :name => "comment[author_email]"
    end
  end
end
