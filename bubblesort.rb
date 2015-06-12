def bubble_sort(list)
  
  (list.size-1).times do 
  a,b=0,1
   (list.size-1).times do 
     if list[a]>list[b]
		list[a],list[b]=list[b],list[a]
	  end
	  a+=1
	  b+=1
	end
	print list
   end
  
end
		
bubble_sort([5,4,3,2,1,9,8,7,6])
	
	