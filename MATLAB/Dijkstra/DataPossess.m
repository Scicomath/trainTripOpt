%% 任意两站点之间的车次
m = length(station);
startStation = find(data.S_No==1);
trainList = cell(m,m);
C = cell(m,m);
TS = cell(m,m);
r = zeros(m,m);
n = size(data,1);
h = waitbar(0,'Please wait...');
for i = 1:n-1
    endStation = startStation(find(startStation > i,1))-1;
    for j = i+1:endStation
        s_No = data.StationNo(i);
        d_No = data.StationNo(j);
        sigpath = data.NumNo(i);
        trainList{s_No,d_No} = [trainList{s_No,d_No},sigpath];
        %[ totalTime,~,startTime ] = timeFun( data,[s_No,sigpath,d_No] );
        C{s_No,d_No} = [C{s_No,d_No},data.A_Time_TotalMinute(j)-data.D_Time_TotalMinute(i)];
        TS{s_No,d_No} = [TS{s_No,d_No},data.D_Time_CurrentMinute(i)];
        r(s_No,d_No) = r(s_No,d_No) + 1;
    end
    waitbar(i/n)
end
close(h)
save data6.mat

DG = sparse(adjMat);
minTurn = graphallshortestpaths(DG);