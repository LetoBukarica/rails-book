require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal 'Pragmatic Store Order Configuration', mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["leto.bukarica@gmail.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Pragmatic store Order Shipped to Dave Thomas", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["leto.bukarica@gmail.com"], mail.from
    assert_match /<td[^>]*>1<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
