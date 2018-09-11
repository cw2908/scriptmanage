require "test_helper"

describe Setting do
  let(:setting) { Setting.new }

  it "must be valid" do
    value(setting).must_be :valid?
  end
end
