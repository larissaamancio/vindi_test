class Customer < OpenStruct

  def self.service
    @service ||= CustomerService.new
  end

  def self.all 
    service.customers
  end

  def self.find(id)
    new(service.customer(id))
  end

  def self.create(params)
    new(service.create_customer(params))
  end

  def self.update(id, params)
    service.update_customer(id, params)
  end

  def self.destroy(id)
    service.destroy_customer(id)
  end

end