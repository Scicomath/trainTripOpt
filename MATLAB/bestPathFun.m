function [ bestIndex ] = bestPathFun( pathCost,pathTime,type )
%bestPathFun 将方案按照一定的优先级进行排序
%   path 所有方案
%   type 优先级类型：1为时间优先，2为费用优先
%   bestPath 方案的排序

if type==1
    [~,bestIndex]=sort(pathTime);
end
if type==2
    [~,bestIndex]=sort(pathCost);
end

end

