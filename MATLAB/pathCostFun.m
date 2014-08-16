function [ totalCost,cost ] = pathCostFun( data,sigpath )
%pathCostFun 计算路径方案的总费用
%   path为路径方案
%   totalCost为总费用
%   cost为各车次票价
n = (length(sigpath)-1)/2;
cost = zeros(n,1);
for i=1:n
    cost(i) = costFun( data,sigpath(i*2-1),sigpath(i*2+1),sigpath(i*2) );
end
totalCost = sum(cost);

end

