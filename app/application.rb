
class Application

  @@items =[]

def call(env)

  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match(/items/)
    item=req.path.split("/items/").last
    item2=@@items.find{ |listed| listed.name==item}
    if item2
      resp.write item2.price
      resp.status = 200
    else
      resp.write "Item not found"
      resp.status = 400
    end
  else
    resp.write "Route not found"
    resp.status = 404
  end


  resp.finish
end
end
