function [ t,p,q,turn ] = dijkstraTurnFun( adjMat,C,TS,s,d,beginTime,stopTime )
%dijkstraFun �Ľ���Dijkstra�㷨
%   adjMat �ڽӾ���
%   c �ڵ�֮�����ʻʱ�����
%   TS ����ʱ��

N = size(adjMat,1);

Node = 1:N; % �ڵ㼯��
t = zeros(N,1); % ����ڵ�u�����ʱ��
turn = zeros(N,1); % ����ڵ�u����Сת�˴���
%dayT = zeros(N,1); % ����ڵ�uʱ�ĵ���ʱ��
p = zeros(N,1); % s��u���·���ϵ�u��ǰһ���ڵ�
q = zeros(N,1); % s��u���·����p(u)��u����ʱ�������
%S = [];

%s = 1; % ���ó�����
% ��ʼ��
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

