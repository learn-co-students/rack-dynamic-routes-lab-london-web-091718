class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      # search in the path using .split and .last for the item
      searched_item = req.path.split("/items/").last
      # assign a variable for that item if found in @@items
      if item = @@items.find { |item| item.name == searched_item }

      #do another if else statement for if found versus if not found (400)

        resp.write "#{item.price}\n"
      
    else
      resp.status = 400
      resp.write "Item not found"
    end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
end
end
