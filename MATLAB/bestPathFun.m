function [ bestIndex ] = bestPathFun( pathCost,pathTime,type )
%bestPathFun ����������һ�������ȼ���������
%   path ���з���
%   type ���ȼ����ͣ�1Ϊʱ�����ȣ�2Ϊ��������
%   bestPath ����������

if type==1
    [~,bestIndex]=sort(pathTime);
end
if type==2
    [~,bestIndex]=sort(pathCost);
end

end

