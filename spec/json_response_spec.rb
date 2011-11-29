require File.dirname(__FILE__) + '/spec_helper'

describe JSONResponse, ".build" do
  before do
    JSONResponse.define(:person) { |p| p.id = JSONResponse.next(:id); p.name = "Dave" }
  end

  it "builds json strings from definitions" do
    JSONResponse.build(:person).should == '{"id":1,"name":"Dave"}'
  end

  it "builds a hash of attributes from definitions" do
    JSONResponse.attributes_for(:person).should == {id: 2, name: "Dave"}
  end

  it "supports counters" do
    count = JSONResponse.counters[:id]
    JSONResponse.attributes_for(:person)[:id].should == count + 1
    JSONResponse.attributes_for(:person)[:id].should == count + 2
  end
end
