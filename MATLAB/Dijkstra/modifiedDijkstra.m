N = 7; % 节点数
adjMat = zeros(N,N);
C = cell(N,N);
TS = cell(N,N);
adjMat(1,2)=1;  C{1,2}=[4 4 4];   TS{1,2}=[2 5 9];
adjMat(1,3)=1;  C{1,3}=[3 3 3];   TS{1,3}=[1 5 10];
adjMat(2,4)=1;  C{2,4}=[5 5 5 5 5];   TS{2,4}=[2 7 10 16 19];
adjMat(2,5)=1;  C{2,5}=[3 3];   TS{2,5}=[6 16];
adjMat(3,2)=1;  C{3,2}=[3 3 3];   TS{3,2}=[7 11 15];
adjMat(3,5)=1;  C{3,5}=[7 7];   TS{3,5}=[7 11];
adjMat(4,3)=1;  C{4,3}=[2 2 2];   TS{4,3}=[7 12 18];
adjMat(4,6)=1;  C{4,6}=[4 4 4 4];   TS{4,6}=[8 13 17 25];
adjMat(5,4)=1;  C{5,4}=[3 3];   TS{5,4}=[11 18];
adjMat(5,7)=1;  C{5,7}=[10 10 10];  TS{5,7}=[7 10 15];

Node = 1:N; % 节点集合
t = zeros(N,1); % 到达节点u的最短时间
p = zeros(N,1); % s到u最短路径上的u的前一个节点
q = zeros(N,1); % s到u最短路径上p(u)到u出发时间的索引
S = [];

s = 1; % 设置出发点
% 初始化
t(s) = 0;
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
        i = find(TS{u,v}>=t(u),1);
        if ~isempty(i)&&(t(v)>TS{u,v}(i)+C{u,v}(i))
            p(v) = u;
            q(v) = i;
            t(v) = TS{u,v}(i) + C{u,v}(i);
            S = union(S,v);
        end
    end
end