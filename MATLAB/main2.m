travel = {'宜昌东','上海','南京','杭州','苏州','无锡'};
n = length(travel);
TimeFirstBestPath=cell(n,n);
TimeFirstCost = ones(n,n)*inf;
TimeFirstTime = ones(n,n)*inf;
type = 1;
for i=1:n
    for j=1:n
        if i==j
            continue
        end
        [ TimeFirstBestPath{i,j},TimeFirstCost(i,j),TimeFirstTime(i,j) ] = oneBestPathFun( data,trainList,adjMat,station,travel{i},travel{j},type );
    end
end

CostFirstBestPath=cell(n,n);
CostFirstCost = ones(n,n)*inf;
CostFirstTime = ones(n,n)*inf;
type = 2;
for i=1:n
    for j=1:n
        if i==j
            continue
        end
        [ CostFirstBestPath{i,j},CostFirstCost(i,j),CostFirstTime(i,j) ] = oneBestPathFun( data,trainList,adjMat,station,travel{i},travel{j},type );
    end
end
