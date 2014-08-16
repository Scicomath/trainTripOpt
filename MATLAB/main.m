% 主程序

% 输出欢迎界面
fprintf('欢迎使用铁路查询系统！\n请输入起始站与终点站\n')
% 用户输入数据
s_name = input('起始站：','s');
while ~sum(strcmp(station,s_name))
    fprintf('Sorry，没有找到此站点，请重新输入！\n')
    s_name = input('起始站：','s');
end
d_name = input('终点站：','s');
while ~sum(strcmp(station,d_name))
    fprintf('Sorry，没有找到此站点，请重新输入！\n')
    d_name = input('终点站：','s');
end

type = input('输入优先级，时间优先输入1，费用优先输入2：');



path = cell(2,1);
pathTime = cell(2,1);
pathCost = cell(2,1);
% 直达方案
[ path{1},pathTime{1},pathCost{1} ] = directSearchFun1(...
    data,trainList,adjMat,station,s_name,d_name );
goOn = 0;
if isempty(path{1})
    fprintf('%s到%s ',s_name,d_name)
    fprintf('没有直达车次 为您推荐如下转乘方案：\n')
    goOn = 1;
else
    [ bestIndex{1} ] = bestPathFun( pathCost{1},pathTime{1},type );
    for i=1:length(path{1})
        n = bestIndex{1}(i);
        displayFun( path{1}(n,:),pathCost{1}(n),pathTime{1}(n),station,trainNo )
    end
end
% 转乘一次
goOn = input('是否继续搜索一次转乘方案，若是输入1，否则输入0：');
while goOn~=1&&goOn~=0
    goOn = input('是否继续搜索一次转乘方案，若是输入1，否则输入0：');
end
if goOn == 1
    [ path{2},pathTime{2},pathCost{2},stopTime ] = directSearchFun2(...
        data,trainList,adjMat,station,s_name,d_name );
    if isempty(path{2})
        fprintf('%s到%s ',s_name,d_name)
        fprintf('没有一次转乘方案，无法搜索，Sorry\n')
    else
        [ bestIndex{2} ] = bestPathFun( pathCost{2},pathTime{2},type );
        for i=1:length(path{2})
            n = bestIndex{2}(i);
            displayFun( path{2}(n,:),pathCost{2}(n),pathTime{2}(n),station,trainNo )
            disp(stopTime{i})
        end
    end
end


