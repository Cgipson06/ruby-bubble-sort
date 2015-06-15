def bubble_sort(list)
  
  (list.size-1).times do #This is the maximum solution length
  a,b=0,1
   (list.size-1).times do 
     if list[a]>list[b]
		list[a],list[b]=list[b],list[a]
	  end
	  a+=1
	  b+=1
	end
   end
  print list
end
		
bubble_sort([5,4,3,2,1])



#Bubble_sort_by will take a list AND a block, using the block to process the sorting
def bubble_sort_by(list)
  (list.size-1).times do 
  a,b=0,1
  (list.size-1).times do 
     if yield(list[a],list[b]) < 0
		list[a],list[b]=list[b],list[a]
	  end
	  a+=1
	  b+=1
	end
   end
  print list
end
   


bubble_sort_by(["hi","hello","hey"]) do |left,right|
  right.length - left.length
end