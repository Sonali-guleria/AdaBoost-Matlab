% Parameters 
% (Feel free to change the parameters for fun, 
% but use trainsize = 400; testsize = 100; for report)
rng(100);
trainsize =400;
testsize = 100;
num_iter = 20;
[train.X, train.y] = gen_sample(trainsize);
[test.X, test.y] = gen_sample(testsize);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[pred,prod,ClassErrors,directions,thresholds,positions,alpha,prod2] = adaboost(train.X, train.y, test.X, num_iter);

correct= logical(test.y == pred);

accuracy = sum(correct)/testsize;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%