function [pred] = predict(direction,threshold,position,x)
  
e= size(x,1);
pred = zeros(e,1);
if(position == 1)
    c = x(:,1);
   if(direction == 'L')
     log = logical(c < threshold);
     indexx = find(log);
     pred(indexx)=1;
     pred(pred==0)=-1;
            
            
   else
     log = logical(c >= threshold);
     indexx = find(log);
     pred(indexx)=1;
     pred(pred==0)=-1;     
   end
else
    c=x(:,2);
    if(direction == 'L')
     log = logical(c < threshold);
     indexx = find(log);
     pred(indexx)=1;
     pred(pred==0)=-1;
   else
     log = logical(c >= threshold);
     indexx = find(log);
     pred(indexx)=1;
     pred(pred==0)=-1;        
    end
end

end