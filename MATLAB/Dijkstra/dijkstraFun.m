function [ t,p,q ] = dijkstraFun( adjMat,C,TS,s,d,beginTime,stopTime )
%dijkstraFun 改进的Dijkstra算法
%   adjMat 邻接矩阵
%   c 节点之间的行驶时间矩阵
%   TS 出发时间

N = size(adjMat,1);

Node = 1:N; % 节点集合
t = zeros(N,1); % 到达节点u的最短时间
%dayT = zeros(N,1); % 到达节点u时的当天时间
p = zeros(N,1); % s到u最短路径上的u的前一个节点
q = zeros(N,1); % s到u最短路径上p(u)到u出发时间的索引
%S = [];

%s = 1; % 设置出发点
% 初始化
t(s) = beginTime;
%dayT(s) = 0;
p(s) = nan;
q(s) = nan;
S = s;

for v=setdiff(Node,s)
    t(v) = inf;
    p(v) = nan;
    q(v) = nan;
end

while ~isempty(S)
    [~,index] = min(t(S));
    u = S(index);
    S = setdiff(S,u);
    for v = find(adjMat(u,:))
        
        for i = 1:length(TS{u,v})
            temp = TS{u,v}(i);
            while temp<t(u)+stopTime;
                temp = temp + 24*60;
            end
            if (t(v)>temp+C{u,v}(i))
                p(v) = u;
                q(v) = i;
                t(v) = temp + C{u,v}(i);
                S = union(S,v);
            end
        end
        
    end
    if u == d
        return
    end
end
end

