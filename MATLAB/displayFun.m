function displayFun( path,pathCost,pathTime,station,trainNo )
%displayFun �������

for i=1:length(path)
    if mod(i,2)==1
        fprintf('%s-',station{path(i)})
    else
        fprintf('%s-',trainNo{path(i)})
    end
end

fprintf('%dԪ-',pathCost)
h = floor(pathTime/60);
m = mod(pathTime,60);
fprintf('%dСʱ%d����\n',h,m)

end

