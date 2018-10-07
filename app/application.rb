class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      expected_item = req.path.split("/items/").last
      found_item = @@items.find {|item| item.name == expected_item}
      if found_item.nil?
        resp.status = 400
        resp.write "Item not found"
      else
        resp.write found_item.price
      end


    else
      resp.status = 404
      resp.write "Route not found"

    end

    resp.finish
  end
end
