class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new 
    
    if req.path.match(/items/)
      item = req.path.split('/items/').last
      
      if @@items.include?(item)
        resp.write item.price
        req.status = 200
        
      else 
        resp.write "Item not found"
        req.status = 400
      end 
      
    else
      resp.write "Route not found"
      req.status = 404 
    end 
    
  end 
  
end 