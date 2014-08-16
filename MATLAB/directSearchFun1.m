function [ path,pathTime,pathCost ] = directSearchFun1( data,trainList,adjMat,station,s_name,d_name )

[~,s_No] = intersect(station,s_name);
[~,d_No] = intersect(station,d_name);

%% 直达

if isempty(trainList{s_No,d_No})
    path = [];
else
    path = trainList{s_No,d_No}';
end
path = [ones(size(path,1),1)*s_No path ones(size(path,1),1)*d_No];

%% 计算时间

pathTime = zeros(size(path,1),1);
for i=1:size(path,1)
    pathTime(i) = timeFun( data,path(i,:) );
end

%% 计算费用
pathCost = zeros(size(path,1),1);
for i=1:size(path,1)
    [pathCost(i),~] = pathCostFun( data,path(i,:) );
end


end

