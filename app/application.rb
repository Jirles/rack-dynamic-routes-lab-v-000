class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new 
    
    if req.path.match(/items/)
      item = req.path.split('/items/').last 
      if @@items.include?(item)
        resp.write item.price
        resp.status = 200
      else 
        resp.write "Item not found"
        resp.status = 400
      end 
    else
      resp.write "Route not found"
      resp.status = 404 
    end 
  end 
  
end 

run Application.new.call