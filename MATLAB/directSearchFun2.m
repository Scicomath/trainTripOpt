function [ path,pathTime,pathCost,stopTime ] = directSearchFun2( data,trainList,adjMat,station,s_name,d_name )
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

% if isempty(trainList{s_No,d_No})
%     path{1} = [];
% else
%     path{1} = trainList{s_No,d_No}';
% end
% path{1} = [ones(length(path{1}),1)*s_No path{1} ones(length(path{1}),1)*d_No];
%% һ��ת��
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
%% ����ʱ��

% pathTime{1} = zeros(length(path{1}),1);
% for i=1:length(path{1})
%     pathTime{1}(i) = timeFun( data,path{1}(i,:) );
% end
pathTime = zeros(size(path,1),1);
stopTime = cell(size(path,1),1);
for i=1:size(path,1)
    [pathTime(i),stopTime{i}] = timeFun( data,path(i,:) );
end

%% �������
% pathCost{1} = zeros(length(path{1}),1);
% for i=1:length(path{1})
%     [pathCost{1}(i),~] = pathCostFun( data,path{1}(i,:) );
% end
pathCost = zeros(size(path,1),1);
for i=1:size(path,1)
    [pathCost(i),~] = pathCostFun( data,path(i,:) );
end

end

