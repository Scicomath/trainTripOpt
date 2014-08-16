function [ bestPath,cost,time ] = oneBestPathFun( data,trainList,adjMat,station,s_name,d_name,type )
%oneBestPathFun 输出一条最优路线

[ path,pathTime,pathCost ] = directSearchFun1( data,trainList,adjMat,station,s_name,d_name );
if type==1
    [directMin,directIndex] = min(pathTime);
    %[turnMin,turnIndex] = min(pathTime{2});
%     if directMin<turnMin
%         bestPath = path{1}(directIndex,:);
%         time = pathTime{1}(directIndex);
%         cost = pathCost{1}(directIndex);
%     else
%         bestPath = path{2}(turnIndex,:);
%         time = pathTime{2}(turnIndex);
%         cost = pathCost{2}(turnIndex);
%     end
    bestPath = path(directIndex,:);
    time = pathTime(directIndex);
    cost = pathCost(directIndex);
else
    [directMin,directIndex] = min(pathCost);
    %[turnMin,turnIndex] = min(pathCost{2});
%     if directMin<turnMin
%         bestPath = path{1}(directIndex,:);
%         time = pathTime{1}(directIndex);
%         cost = pathCost{1}(directIndex);
%     else
%         bestPath = path{2}(turnIndex,:);
%         time = pathTime{2}(turnIndex);
%         cost = pathCost{2}(turnIndex);
%     end
    bestPath = path(directIndex,:);
    time = pathTime(directIndex);
    cost = pathCost(directIndex);
end

end

