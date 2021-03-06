require 'spec_helper'

describe Tag do
  before do
    @tag = Tag.new
  end

  it "should have many Taggings" do
    Tag.relationships.named?(:taggings).should be(true)
  end

  it "should validate the presence of name" do
    @tag.should_not be_valid
    @tag.name = "Meme"
    @tag.should be_valid
  end

  it "should list taggables for a tag" do
    tag = Tag.create(:name => 'tag1')

    taggable1 = TaggedModel.create(:tag_list => tag.name)
    taggable2 = TaggedModel.create(:tag_list => tag.name)

    tag.taggables.should == [ taggable1, taggable2 ]
  end
end
