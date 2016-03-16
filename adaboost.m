function [final_h,prod1,ClassErrors,directions,thresholds,positions,alpha,prod2] = adaboost(trainX, trainY, testX, T)
d= size(testX,1);
[alpha,directions,thresholds,positions,ClassErrors]= trainer(trainX, trainY,T);
prod1 = zeros(d,1);
prod2 = zeros(d,1);
for i = 1:T
prod = zeros(d,1);
pred = predict(directions(i),thresholds(i),positions(i),testX);
prod = alpha(i) * pred;
prod1 = prod1 + prod ;
prod2 = sign(prod1);
end

final_h = sign(prod1);

end




