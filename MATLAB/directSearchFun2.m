function [ path,pathTime,pathCost,stopTime ] = directSearchFun2( data,trainList,adjMat,station,s_name,d_name )

[~,s_No] = intersect(station,s_name);
[~,d_No] = intersect(station,d_name);

%% 一次转乘
path=[];
s_set = find(adjMat(s_No,:)==1);
d_set = find(adjMat(:,d_No)==1);
stop = intersect(s_set, d_set);
for i=1:length(stop)
    firstarc = trainList{s_No,stop(i)};
    for j = 1:length(firstarc)
        secondarc = trainList{stop(i),d_No};
        for k = 1:length(secondarc)
            path = [path;[firstarc(j) stop(i) secondarc(k)]];
        end
    end
end
path = [ones(size(path,1),1)*s_No path ones(size(path,1),1)*d_No];
%% 计算时间

pathTime = zeros(size(path,1),1);
stopTime = cell(size(path,1),1);
for i=1:size(path,1)
    [pathTime(i),stopTime{i}] = timeFun( data,path(i,:) );
end

%% 计算费用

pathCost = zeros(size(path,1),1);
for i=1:size(path,1)
    [pathCost(i),~] = pathCostFun( data,path(i,:) );
end

end

