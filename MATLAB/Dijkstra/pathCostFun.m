function [ totalCost,cost ] = pathCostFun( data,sigpath )
%pathCostFun ����·���������ܷ���
%   pathΪ·������
%   totalCostΪ�ܷ���
%   costΪ������Ʊ��
n = (length(sigpath)-1)/2;
cost = zeros(n,1);
for i=1:n
    cost(i) = costFun( data,sigpath(i*2-1),sigpath(i*2+1),sigpath(i*2) );
end
totalCost = sum(cost);

end

