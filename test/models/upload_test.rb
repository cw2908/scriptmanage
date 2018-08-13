require "test_helper"

describe Upload do
  let(:upload) { Upload.new }

  it "must be valid" do
    value(upload).must_be :valid?
  end
end
