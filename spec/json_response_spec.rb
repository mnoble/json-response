require File.dirname(__FILE__) + '/spec_helper'

describe JSONResponse, ".build" do
  before do
    JSONResponse.define(:person) { |p| p.name = "Dave" }
  end

  it "builds json strings from definitions" do
    JSONResponse.build(:person).should == "{\"name\":\"Dave\"}"
  end

  it "builds a hash of attributes from definitions" do
    JSONResponse.attributes_for(:person).should == {name: "Dave"}
  end
end
