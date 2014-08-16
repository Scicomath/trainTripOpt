function [ path,pathTime,pathCost ] = directSearchFun1( data,trainList,adjMat,station,s_name,d_name )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


%   s_No = 2358; % ��ʼ��
%   d_No = 1445; % Ŀ�ĵ�
[~,s_No] = intersect(station,s_name);
[~,d_No] = intersect(station,d_name);

% [~,s_No] = intersect(station,'���');
% [~,d_No] = intersect(station,'����');
% 
% [~,s_No] = intersect(station,'�˲���');
% [~,d_No] = intersect(station,'������');
%% ֱ��

if isempty(trainList{s_No,d_No})
    path = [];
else
    path = trainList{s_No,d_No}';
end
path = [ones(size(path,1),1)*s_No path ones(size(path,1),1)*d_No];
%% һ��ת��
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
%% ����ʱ��

pathTime = zeros(size(path,1),1);
for i=1:size(path,1)
    pathTime(i) = timeFun( data,path(i,:) );
end
% pathTime{2} = zeros(length(path{2}),1);
% for i=1:length(path{2})
%     pathTime{2}(i) = timeFun( data,path{2}(i,:) );
% end

%% �������
pathCost = zeros(size(path,1),1);
for i=1:size(path,1)
    [pathCost(i),~] = pathCostFun( data,path(i,:) );
end
% pathCost{2} = zeros(length(path{2}),1);
% for i=1:length(path{2})
%     [pathCost{2}(i),~] = pathCostFun( data,path{2}(i,:) );
% end

end

