require 'test_helper'

class SendedMailerTest < ActionMailer::TestCase
  test "JidouSoushin" do
    mail = SendedMailer.JidouSoushin
    assert_equal "Jidousoushin", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
