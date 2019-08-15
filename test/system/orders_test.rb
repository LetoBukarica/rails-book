# frozen_string_literal: true

require 'application_system_test_case'

class OrdersTest < ApplicationSystemTestCase
  test 'check checkout payment methods show' do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'

    assert_no_selector '#order_routing_number'
    select 'Check', from: 'pay_type'
    assert_selector '#order_account_number'
    assert_selector '#order_routing_number'
    select 'Credit card', from: 'pay_type'
    assert_no_selector '#order_account_number'
    assert_selector '#order_credit_card_number'
    assert_selector '#order_expiration_date'
  end

  test 'check add to cart empty cart' do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    assert_selector '#cart'
    accept_alert do
      click_on 'Empty cart'
    end
    assert_no_selector '#cart'
  end

  test 'check add to cart highlights' do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'
    assert_selector '#cart .line-item-highlight'

  end

end
