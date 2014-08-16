function [ path,pathTime,pathCost ] = directSearchFun1( data,trainList,adjMat,station,s_name,d_name )
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

if isempty(trainList{s_No,d_No})
    path = [];
else
    path = trainList{s_No,d_No}';
end
path = [ones(size(path,1),1)*s_No path ones(size(path,1),1)*d_No];
%% 一次转乘
% path{2}=[];
% s_set = find(adjMat(s_No,:)==1);
% d_set = find(adjMat(:,d_No)==1);
% stop = intersect(s_set, d_set);
% for i=1:length(stop)
%     firstarc = trainList{s_No,stop(i)};
%     for j = 1:length(firstarc)
%         secondarc = trainList{stop(i),d_No};
%         for k = 1:length(secondarc)
%             path{2} = [path{2};[firstarc(j) stop(i) secondarc(k)]];
%         end
%     end
% end
% path{2} = [ones(length(path{2}),1)*s_No path{2} ones(length(path{2}),1)*d_No];
%% 计算时间

pathTime = zeros(size(path,1),1);
for i=1:size(path,1)
    pathTime(i) = timeFun( data,path(i,:) );
end
% pathTime{2} = zeros(length(path{2}),1);
% for i=1:length(path{2})
%     pathTime{2}(i) = timeFun( data,path{2}(i,:) );
% end

%% 计算费用
pathCost = zeros(size(path,1),1);
for i=1:size(path,1)
    [pathCost(i),~] = pathCostFun( data,path(i,:) );
end
% pathCost{2} = zeros(length(path{2}),1);
% for i=1:length(path{2})
%     [pathCost{2}(i),~] = pathCostFun( data,path{2}(i,:) );
% end

end

