function [ totalTime,stopTime,startTime ] = timeFun( data,sigpath )
%timeFun 计算路径方案的时间
%   data 列车数据
%   sigpath 路径，格式为起点-车次-中转站-车次-终点
%   totalTime 方案的总时间
%   stopTime 方案的中间停留时间
%   startTime 方案的出发时间
n = (length(sigpath)-1)/2;
section = zeros(n,2);
sectionTime = zeros(n,1);
stopTime = zeros(n-1,1);
for i=1:n
    temp = sigpath(i*2-1:i*2+1);
    m = find(data.NumNo==temp(2)&data.StationNo==temp(1));
    n = find(data.NumNo==temp(2)&data.StationNo==temp(3));
    section(i,:) = [m n];
    sectionTime(i) = data.A_Time_TotalMinute(n)-data.D_Time_TotalMinute(m);
end
if n>1
    n = (length(sigpath)-1)/2;
    for i=1:n-1
        s_stop = data.A_Time_CurrentMinute(section(i,2));
        d_stop = data.D_Time_CurrentMinute(section(i+1,1));
        if d_stop<s_stop
            stopTime(i) = d_stop + 24*60 - s_stop;
        else
            stopTime(i) = d_stop - s_stop;
        end
    end
else
    stopTime = 0;
end

totalTime = sum(sectionTime) + sum(stopTime);
startTime = data.D_Time(section(1,1));

end

