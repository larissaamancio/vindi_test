class CustomerService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://app.vindi.com.br/api/v1/")
    @connection.basic_auth('z_XrSTKCwixRKhPc756hPXSWnGqk5h7O', '')
  end

  def customers
    parse(connection.get("customers"))
  end

  def customer(id)
    parse(connection.get("customers/#{id}"))
  end

  def create_customer(params)
    parse(connection.post("customers", params))
  end

  def update_customer(id, params)
    connection.put("customers/#{id}", params)
  end

  def destroy_customer(id)
    connection.delete("customers/#{id}")
  end


private

  def parse(response)
    JSON.parse(response.body)["customers"]

  end
end