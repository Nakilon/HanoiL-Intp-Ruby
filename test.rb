require "minitest/autorun"
require "minitest/around/spec"
require "timeout"

require_relative "hlintp"

describe "lib" do

  around{ |test| Timeout.timeout(1){ test.call } }
  def check expectation, *args
    result = HanoiLove.run *args
    assert_equal expectation, result.string
  end

  it "pop 1 from A and print" do
    check "\x01".b, <<~HEREDOC
      ,"'"
    HEREDOC
  end

end
