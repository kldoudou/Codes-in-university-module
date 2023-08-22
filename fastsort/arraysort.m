function arraysorted = arraysort(array)
   if length(array) == 1
       arraysorted = array;
       return
   end
   front = arraysort(array(1:floor(length(array)/2)));
   f_len = length(front);
   back = arraysort(array(floor(length(array)/2)+1:end));
   b_len = length(back);

   i = 1;j = 1;k = 1;
   while(i<=f_len && j<=b_len)
       if(front(i)<back(j))
           arraysorted(k,1) = front(i);
           i = i+1;
       else
           arraysorted(k,1) = back(j);
           j = j+1;
       end
       k = k+1;
   end
   if(f_len>=i)
       arraysorted = [arraysorted;front(i:end)];
   end
   if(b_len>=j)
       arraysorted = [arraysorted;back(j:end)];
   end
end