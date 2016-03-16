function [alpha,dir,thresh,pos,ClassEr]= trainer(trainX,trainY,num_iter)

a = size(trainX,1);

W = ones(a,1);
W= W ./ a;

for i=1:num_iter
   ClassError = 0;
   direction= 'L';
   threshold=0;
   position=0;
   [ClassError,direction,threshold,position,s1,s2]= learner(trainX, trainY,W);
   alpha(i) = 1/2 * (log(1-ClassError)- log(ClassError));
   pred = predict(direction,threshold,position,trainX);
   Z = 2*sqrt(ClassError*(1-ClassError));
   W = W .* exp(-alpha(i) *(trainY .*pred));
   W = W / Z;
   dir(i)= direction;
   thresh(i)= threshold;
   pos(i) = position;
   ClassEr(i)= ClassError;
  
 
end
    


