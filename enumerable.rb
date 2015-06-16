#Rewriting the ruby enumerable methods
#For theodinproject.com ruby advanced building blocks

module Enumerable
  # Create my_each, a method that is identical to #each but (obviously) does not use #each.
  # You'll need to remember the yield statement. Make sure it returns the same thing as #each as well.
  
  def my_each
    return self unless block_given?
    for i in self
      yield i
    end
  end
  
  
  def my_each_with_index
    return self unless block_given?
    for i in 0..(self.length-1)
      yield i if block_given?
      end
    end
    
  
  #Create #my_select in the same way, though you may use #my_each in your definition (but not #each)
  def my_select
    return self unless block_given?
    ans_array=Array.new
    self.my_each do |a||
      if yield a
        ans_array.push(a)
        end
      end
    return ans_array
    end
    
    
  def my_all
    self.my_each do |a|
      return false unless yield a
      end
    true
    end
    
    
  def my_any
    self.my_each do |a|
      return true if yield a 
      end
    false
    end
    
    
    
  def my_none
    self.my_each do |a|
      return false if yield a
      end
    true
    end
      
      
  def my_count(arg=nil)
    count=0
    if arg==nil && block_given? == false
      return self.length      
    end
    self.my_each do |a|
      if block_given?
        count+=1 if yield a
      elsif a==arg
        count+=1
        end
      end
    return count
    end
        
      
  def my_map
    unless block_given? 
      return self
      end
    ans=Array.new
    self.my_each do |a|
      if yield a
        ans.push(a)
        end
      end
    return ans
    end
    
      
  def my_inject(accumulator=nil)
    if accumulator.nil?
      accumulator =  self.first
      end
    self.my_each do |a|
      accumulator = yield(a,accumulator)
      end
    return accumulator
    end 
    
    
  #Modify your #my_map method to take a proc instead.
  def my_map1(procedure=nil)
    unless procedure
      return self
      end
    ans=Array.new
    self.my_each do |a|
      if procedure.call(a)
        ans.push(a)
        end
      end
    return ans
    end
    
    
    
    
  #Modify your #my_map method to take either a proc or a block, executing the block only if both are supplied (in which case it would execute both the block AND the proc
  def my_map2(procedure = nil)
    ans=Array.new
    if procedure && block_given?  #block and procedure together
      self.my_each do |a|
        ans.push(yield(procedure.call(a)))
        end
    elsif procedure  # just a procedure no block supplied
      self.my_each do |a|
        ans.push(procedure.call(a))
        end
    else        
      return self
      end
    return ans
    end
    
end


#Test your #my_inject by creating a method called #multiply_els which multiplies all 
#the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
def multiply_els(list)
  accumulator = list.my_inject{|a,accumulator| accumulator * a}
end





