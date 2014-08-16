function displayFun( path,pathCost,pathTime,station,trainNo )
%displayFun 输出方案

for i=1:length(path)
    if mod(i,2)==1
        fprintf('%s-',station{path(i)})
    else
        fprintf('%s-',trainNo{path(i)})
    end
end

fprintf('%d元-',pathCost)
h = floor(pathTime/60);
m = mod(pathTime,60);
fprintf('%d小时%d分钟\n',h,m)

end

