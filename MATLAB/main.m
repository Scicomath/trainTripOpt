% ������

% �����ӭ����
fprintf('��ӭʹ����·��ѯϵͳ��\n��������ʼվ���յ�վ\n')
% �û���������
s_name = input('��ʼվ��','s');
while ~sum(strcmp(station,s_name))
    fprintf('Sorry��û���ҵ���վ�㣬���������룡\n')
    s_name = input('��ʼվ��','s');
end
d_name = input('�յ�վ��','s');
while ~sum(strcmp(station,d_name))
    fprintf('Sorry��û���ҵ���վ�㣬���������룡\n')
    d_name = input('�յ�վ��','s');
end

type = input('�������ȼ���ʱ����������1��������������2��');



path = cell(2,1);
pathTime = cell(2,1);
pathCost = cell(2,1);
% ֱ�﷽��
[ path{1},pathTime{1},pathCost{1} ] = directSearchFun1(...
    data,trainList,adjMat,station,s_name,d_name );
goOn = 0;
if isempty(path{1})
    fprintf('%s��%s ',s_name,d_name)
    fprintf('û��ֱ�ﳵ�� Ϊ���Ƽ�����ת�˷�����\n')
    goOn = 1;
else
    [ bestIndex{1} ] = bestPathFun( pathCost{1},pathTime{1},type );
    for i=1:length(path{1})
        n = bestIndex{1}(i);
        displayFun( path{1}(n,:),pathCost{1}(n),pathTime{1}(n),station,trainNo )
    end
end
% ת��һ��
goOn = input('�Ƿ��������һ��ת�˷�������������1����������0��');
while goOn~=1&&goOn~=0
    goOn = input('�Ƿ��������һ��ת�˷�������������1����������0��');
end
if goOn == 1
    [ path{2},pathTime{2},pathCost{2} ] = directSearchFun2(...
        data,trainList,adjMat,station,s_name,d_name );
    if isempty(path{2})
        fprintf('%s��%s ',s_name,d_name)
        fprintf('û��һ��ת�˷������޷�������Sorry\n')
    else
        [ bestIndex{2} ] = bestPathFun( pathCost{2},pathTime{2},type );
        for i=1:length(path{2})
            n = bestIndex{2}(i);
            displayFun( path{2}(n,:),pathCost{2}(n),pathTime{2}(n),station,trainNo )
        end
    end
end


