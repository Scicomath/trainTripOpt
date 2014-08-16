function [ t,p,q,turn ] = dijkstraTurnFun( adjMat,C,TS,s,d,beginTime,stopTime )
%dijkstraFun 改进的Dijkstra算法
%   adjMat 邻接矩阵
%   c 节点之间的行驶时间矩阵
%   TS 出发时间

N = size(adjMat,1);

Node = 1:N; % 节点集合
t = zeros(N,1); % 到达节点u的最短时间
turn = zeros(N,1); % 到达节点u的最小转乘次数
%dayT = zeros(N,1); % 到达节点u时的当天时间
p = zeros(N,1); % s到u最短路径上的u的前一个节点
q = zeros(N,1); % s到u最短路径上p(u)到u出发时间的索引
%S = [];

%s = 1; % 设置出发点
% 初始化
t(s) = beginTime;
turn(s) = 0;
%dayT(s) = 0;
p(s) = nan;
q(s) = nan;
S = s;

for v=setdiff(Node,s)
    t(v) = inf;
    turn(v) = inf;
    p(v) = nan;
    q(v) = nan;
end

while ~isempty(S)
    tAndTurn = [t(S),turn(S)];
    [~,index] = sortrows(tAndTurn,[2,1]);
    index = index(1);
    %[~,index] = min(t(S));
    %[~,index] = min(turn(S));
    u = S(index);
    S = setdiff(S,u);
    for v = find(adjMat(u,:))
        for i = 1:length(TS{u,v})
            temp = TS{u,v}(i);
            while temp<t(u)+stopTime;
                temp = temp + 24*60;
            end
            if (turn(v)>turn(u)+1)||((turn(v)==turn(u)+1)&&(t(v)>temp+C{u,v}(i)))%(t(v)>temp+C{u,v}(i))
                p(v) = u;
                q(v) = i;
                t(v) = temp + C{u,v}(i);
                turn(v) = turn(u) + 1;
                S = union(S,v);
            end
        end
%         [temp,index2] = sort(TS{u,v});
%         index = find(temp>=t(u)+stopTime,1);
%         while isempty(index)
%             temp = temp + 24*60;
%             index = find(temp>=t(u)+stopTime,1);
%         end
%         i = index2(index);
%         %i = find(TS{u,v}>=t(u),1);
%         if (t(v)>temp(index)+C{u,v}(i))
%             p(v) = u;
%             q(v) = i;
%             t(v) = temp(index) + C{u,v}(i);
%             S = union(S,v);
%         end
    end
    if u == d
        return
    end
end
end

