require 'pry'

class Application

  attr_accessor :items

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
         if found_item = @@items.find{|i| i.name == item_name}
           resp.write "#{found_item.price}"
         else
           resp.write "Item not found"
           resp.status = 400
         end
    elsif req.path.match(/testing/)
      resp.write "Route not found"
      resp.status = 404
    end

    # @@items.each do |item|
    #   if req.path == "/items/#{item.name}"
    #     resp.write "#{item.price}"
    #   else
    #     resp.write "Item not found"
    #     resp.status = 400
    #   end
    # end

    resp.finish
  end

end
