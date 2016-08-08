require 'test_helper'

class CustomerServiceTest < ActiveSupport::TestCase
  attr_reader :service
  def setup
    @service = CustomerService.new
  end

  test '#customers' do
    VCR.use_cassette("customer_service_customers") do 
      customers = service.customers
      first_customer = customers.first
      assert_equal 2, first_customer['id']
      assert_equal "17.2", first_customer['name']
      assert_equal "25.4", first_customer['email']
      assert_equal 1, first_customer['registry_code']
    end
  end
end
