function [ClassError,direction,threshold,position,stumpsErrH,stumpsErrV] = learner(trainX, trainY,W)

a = size(trainX,1);
x1 = trainX(:,1);
stumpsErrH = 0;
stumpsErrV = 0;
[stumpsErr1,threshold1] = createStump(x1,trainY,W,'R');
[stumpsErr2,threshold2] = createStump(x1,trainY,W,'L');
% choose the direction and threshold beased on the minimum error %

if(stumpsErr1 <= stumpsErr2)

stumpsErrH = stumpsErr1;
directionH = 'R';
thresholdH = threshold1;

else

stumpsErrH = stumpsErr2;
directionH = 'L';
thresholdH = threshold2;

end     % ending the if else for Horizontal%




x2 = trainX(:,2);

[stumpsErr3,threshold3] = createStump(x2,trainY,W,'R');
[stumpsErr4,threshold4] = createStump(x2,trainY,W,'L');

if(stumpsErr3 <= stumpsErr4)

stumpsErrV = stumpsErr3;
directionV = 'R';
thresholdV = threshold3;


else

stumpsErrV = stumpsErr4;
directionV = 'L';
thresholdV = threshold4;

end    % ending the if else for Vertical%


if (stumpsErrH <= stumpsErrV)

ClassError = stumpsErrH;
direction = directionH;
threshold = thresholdH;
position = 1;


else

ClassError = stumpsErrV;
direction = directionV;
threshold = thresholdV;
position = 2;

end



















