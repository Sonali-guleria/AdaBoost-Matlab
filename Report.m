% [Peak, PeakIdx] = max(findpeaks(ClassErrors))
% num_iter= 1:50
% plot(num_iter,ClassErrors)
% title('Weak classfier error for 20 iterations')
% xlabel('Iterations') % x-axis label
% ylabel('Errors') % y-axis label
% text(num_iter(PeakIdx), Peak, sprintf('Maximum Error = %6.3f', Peak));
% 

num_iter = 200;
num_iter2 = 200;

prod1 = zeros(400,1);
prod2 = zeros(400,1);
pred = zeros(400,1);

for i = 1:200
prod = zeros(400,1);
pred = predict(directions(i),thresholds(i),positions(i),train.X);
prod = alpha(i) * pred;
prod1 = prod1 + prod ;
prod2 = sign(prod1);
error1(i) = sum(logical(prod2~=train.y))/400;

end

[Peak, PeakIdx] = max(findpeaks(error1))
num_iter= 1:200
plot(num_iter,error1)
title('Error rate of combined learner on training set for 20 iterations')
xlabel('Iterations') % x-axis label
ylabel('Errors') % y-axis label
text(num_iter(PeakIdx), Peak, sprintf('Maximum Error = %6.3f', Peak))


prod3 = zeros(100,1);
prod4 = zeros(100,1);
pred = zeros(100,1);

for i = 1:200
prod = zeros(100,1);
pred = predict(directions(i),thresholds(i),positions(i),test.X);
prod = alpha(i) * pred;
prod3 = prod3 + prod ;
prod4 = sign(prod3);
error2(i) = sum(logical(prod4~=test.y))/100;

end


[Peak2, PeakIdx2] = max(findpeaks(error2))
num_iter2 = 1:200
plot(num_iter2,error2)
title('Error rate of combined learner on testing set for 50 iterations')
xlabel('Iterations') % x-axis label
ylabel('Errors') % y-axis label
text(num_iter2(PeakIdx2), Peak2, sprintf('Maximum Error = %6.3f', Peak2));


plot(num_iter,error1,'b',num_iter2,error2,'r')
title('Error rate of combined learner on training and testing set for 200 iterations')
xlabel('Iterations') % x-axis label
ylabel('Errors') % y-axis label
legend('Training Set','Testing','Location','southwest')



