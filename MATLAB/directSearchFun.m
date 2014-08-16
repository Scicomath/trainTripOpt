function [ path,pathTime,pathCost ] = directSearchFun( data,trainList,adjMat,station,s_name,d_name )

[~,s_No] = intersect(station,s_name);
[~,d_No] = intersect(station,d_name);

%% 直达

if isempty(trainList{s_No,d_No})
    path{1} = [];
else
    path{1} = trainList{s_No,d_No}';
end
path{1} = [ones(length(path{1}),1)*s_No path{1} ones(length(path{1}),1)*d_No];
%% 一次转乘
path{2}=[];
s_set = find(adjMat(s_No,:)==1);
d_set = find(adjMat(:,d_No)==1);
stop = intersect(s_set, d_set);
for i=1:length(stop)
    firstarc = trainList{s_No,stop(i)};
    for j = 1:length(firstarc)
        secondarc = trainList{stop(i),d_No};
        for k = 1:length(secondarc)
            path{2} = [path{2};[firstarc(j) stop(i) secondarc(k)]];
        end
    end
end
path{2} = [ones(length(path{2}),1)*s_No path{2} ones(length(path{2}),1)*d_No];
%% 计算时间

pathTime{1} = zeros(size(path{1},1),1);
for i=1:size(path{1},1)
    pathTime{1}(i) = timeFun( data,path{1}(i,:) );
end
pathTime{2} = zeros(size(path{2},1),1);
for i=1:size(path{2},1)
    pathTime{2}(i) = timeFun( data,path{2}(i,:) );
end

%% 计算费用
pathCost{1} = zeros(size(path{1},1),1);
for i=1:size(path{1},1)
    [pathCost{1}(i),~] = pathCostFun( data,path{1}(i,:) );
end
pathCost{2} = zeros(length(path{2}),1);
for i=1:size(path{2},1)
    [pathCost{2}(i),~] = pathCostFun( data,path{2}(i,:) );
end

end

