clear,home
%% 导入数据
%[~,~,data] = xlsread('附件一.xls');
[data] = readtable('Train.csv');
[n,m] = size(data);
for i=1:n
    data.A_Time{i}=data.A_Time{i}(12:end);
    data.D_Time{i}=data.D_Time{i}(12:end);
end
save data.mat

%% 转换时间
[n] = size(data,1);
for i=1:n
    index = strfind(data.A_Time{i},':');
    h = str2double(data.A_Time{i}(1:index(1)-1));
    m = str2double(data.A_Time{i}(index(1)+1:index(2)-1));
    totalM = h*60 + m;
    data.A_Time_CurrentMinute(i) = totalM;
    data.A_Time_TotalMinute(i) = totalM + (data.Day(i)-1)*24*60;
end
for i=1:n
    index = strfind(data.D_Time{i},':');
    h = str2double(data.D_Time{i}(1:index(1)-1));
    m = str2double(data.D_Time{i}(index(1)+1:index(2)-1));
    totalM = h*60 + m;
    data.D_Time_CurrentMinute(i) = totalM;
    data.D_Time_TotalMinute(i) = totalM + (data.Day(i)-1)*24*60;
end


save data2.mat

%% 将每一列车的站点信息放入一行，保存成CVS格式
[n,m] = size(data);
fileID = fopen('trainLine.txt','w');
for i=1:n
    if data.S_No(i)==1
        fprintf(fileID,'\n%s,%s',data.ID{i},data.Type{i});
    end
    fprintf(fileID,',%s',data.Station{i});
end
fclose(fileID);
%% 列车类型与列车编号
trainType = unique(data.Type);
n = size(trainType,1);
typeIndex = cell(n,1);
for i = 1:n
    typeIndex{i} = find(strcmp(data.Type,trainType(i)));
end

trainNo = unique(data.ID);
n = size(data,1);
for i=1:n
    [~,No] = intersect(trainNo,data.ID{i});
    data.NumNo(i) = No;
end
%% 站点编号
station = unique(data.Station);
n = size(data,1);
for i=1:n
    [~,No] = intersect(station,data.Station{i});
    data.StationNo(i) = No;
end
%% 建立连接矩阵
m = length(station);
startStation = find(data.S_No==1);
adjMat = zeros(m,m);
n = size(data,1);
for i = 1:n-1
    endStation = startStation(find(startStation > i,1))-1;
    % [~,s_No] = intersect(station,data.Station{i});
    for j = i+1:endStation
        % [~,d_No] = intersect(station,data.Station{j});
        adjMat(data.StationNo(i),data.StationNo(j)) = 1;
    end
end
save data3
%% 任意两站点之间的车次
m = length(station);
startStation = find(data.S_No==1);
trainList = cell(m,m);
n = size(data,1);
for i = 1:n-1
    endStation = startStation(find(startStation > i,1))-1;
    for j = i+1:endStation
        trainList{data.StationNo(i),data.StationNo(j)} = [trainList{data.StationNo(i),data.StationNo(j)},data.NumNo(i)];
    end
end
save data4.mat
%% 最小转乘 中转站
% DG = sparse(adjMat);
% [~,s_No] = intersect(station,'丹东'); % 丹东
% [~,d_No] = intersect(station,'宜昌东'); % 宜昌东
% [dist, path] = graphshortestpath(DG, s_No, d_No)
