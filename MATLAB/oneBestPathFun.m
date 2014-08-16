function [ bestPath,cost,time ] = oneBestPathFun( data,trainList,adjMat,station,s_name,d_name,type )
%oneBestPathFun ���һ������·��

[ path,pathTime,pathCost ] = directSearchFun1( data,trainList,adjMat,station,s_name,d_name );
if type==1
    [directMin,directIndex] = min(pathTime);

    bestPath = path(directIndex,:);
    time = pathTime(directIndex);
    cost = pathCost(directIndex);
else
    [directMin,directIndex] = min(pathCost);

    bestPath = path(directIndex,:);
    time = pathTime(directIndex);
    cost = pathCost(directIndex);
end

end

