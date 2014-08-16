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