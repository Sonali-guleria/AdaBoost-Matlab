function [errorFinal,threshold] = createStump(x,trainY,W,direction)


a = size(x,1);
error = zeros(a,1);


%Evaluating best threshold for the classifier (i.e) getting best classifier for both right and left hand side%


for i=1:a
ypred = zeros(a,1);


if(direction =='L')

            check = logical(x < x(i));
            index = find(check);
            ypred(index) = 1;
            ypred( ypred==0 )=-1; 
            
 
 else
       
            check = logical(x >= x(i));
            index = find(check);
            ypred(index) = 1;
            ypred( ypred==0 )=-1; 
            
 end
    err= logical(trainY ~= ypred);
    erro = err.* W;
    error(i) = sum(erro);
end

[errorF,index] = min(error);
errorFinal = errorF;
threshold = x(index);

end

