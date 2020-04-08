require 'test_helper'

class DailyMailerTest < ActionMailer::TestCase
  test "everyday_mail" do
    mail = DailyMailer.everyday_mail
    assert_equal "Everyday mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
