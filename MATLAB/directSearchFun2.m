function [ path,pathTime,pathCost,stopTime ] = directSearchFun2( data,trainList,adjMat,station,s_name,d_name )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明


%   s_No = 2358; % 起始点
%   d_No = 1445; % 目的地
[~,s_No] = intersect(station,s_name);
[~,d_No] = intersect(station,d_name);

% [~,s_No] = intersect(station,'天津');
% [~,d_No] = intersect(station,'拉萨');
% 
% [~,s_No] = intersect(station,'宜昌东');
% [~,d_No] = intersect(station,'北京西');
%% 直达

% if isempty(trainList{s_No,d_No})
%     path{1} = [];
% else
%     path{1} = trainList{s_No,d_No}';
% end
% path{1} = [ones(length(path{1}),1)*s_No path{1} ones(length(path{1}),1)*d_No];
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
path = [ones(length(path),1)*s_No path ones(length(path),1)*d_No];
%% 计算时间

% pathTime{1} = zeros(length(path{1}),1);
% for i=1:length(path{1})
%     pathTime{1}(i) = timeFun( data,path{1}(i,:) );
% end
pathTime = zeros(size(path,1),1);
stopTime = cell(size(path,1),1);
for i=1:size(path,1)
    [pathTime(i),stopTime{i}] = timeFun( data,path(i,:) );
end

%% 计算费用
% pathCost{1} = zeros(length(path{1}),1);
% for i=1:length(path{1})
%     [pathCost{1}(i),~] = pathCostFun( data,path{1}(i,:) );
% end
pathCost = zeros(size(path,1),1);
for i=1:size(path,1)
    [pathCost(i),~] = pathCostFun( data,path(i,:) );
end

end

