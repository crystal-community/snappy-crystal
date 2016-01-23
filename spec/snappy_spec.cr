require "./spec_helper"

describe Snappy do
  it "works" do
    deflated = Snappy.deflate("test".to_slice)

    Snappy.valid?(deflated).should eq true

    Snappy.inflate(deflated).should eq "test".to_slice
  end

end
