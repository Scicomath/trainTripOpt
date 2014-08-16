function [ path,pathTime,pathCost ] = directSearchFun( data,trainList,adjMat,station,s_name,d_name )
%save data5.mat

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
    path{1} = [];
else
    path{1} = trainList{s_No,d_No}';
end
path{1} = [ones(length(path{1}),1)*s_No path{1} ones(length(path{1}),1)*d_No];
%% һ��ת��
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
%% ����ʱ��

pathTime{1} = zeros(size(path{1},1),1);
for i=1:size(path{1},1)
    pathTime{1}(i) = timeFun( data,path{1}(i,:) );
end
pathTime{2} = zeros(size(path{2},1),1);
for i=1:size(path{2},1)
    pathTime{2}(i) = timeFun( data,path{2}(i,:) );
end

%% �������
pathCost{1} = zeros(size(path{1},1),1);
for i=1:size(path{1},1)
    [pathCost{1}(i),~] = pathCostFun( data,path{1}(i,:) );
end
pathCost{2} = zeros(length(path{2}),1);
for i=1:size(path{2},1)
    [pathCost{2}(i),~] = pathCostFun( data,path{2}(i,:) );
end

end
%% �������·��
% % ֱ������·��
% if isempty(path{1})
%     fprintf('%s��%s ',station{s_No},station{d_No})
%     fprintf('û��ֱ�ﳵ�� Ϊ���Ƽ�����ת�˷�����\n')
% else
%     % ���·��
%     disp(path{1})
% end
% 
% % һ��ת������·��
% [minTime, index] = sort(pathTime{2});
% path{2} = path{2}(index,:);
% pathTime{2} = minTime;
% disp(path{2})
%     
