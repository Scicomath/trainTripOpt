tic
s = find(strcmp(station,''));
d = find(strcmp(station,'ÒË²ý¶«'));
beginH = 8;
beginM = 0;
beginTime = beginH*60 + beginM;
[ t,p,q ] = dijkstraTurnFun( adjMat,C,TS,s,d,beginTime,60 );
toc
p(s) = 0;
path = graphpred2path(p',d);
n = size(path,2)*2-1;
fullpath = zeros(1,n);
% fullpath(1) = path(1);
% fullpath(2) = trainList{path(1),path(2)}(q(path(2)));
% fullpath(3) = path(2);
% fullpath(4) = trainList{path(2),path(3)}(q(path(3)));
for i = 1:n
    if mod(i,2)==1
        fullpath(i) = path((i+1)/2);
    else
        fullpath(i) = trainList{path(i/2),path(i/2+1)}(q(path(i/2+1)));
    end
end
pathCost = pathCostFun( data,fullpath );
[ totalTime,stopTime,startTime ] = timeFun( data,fullpath );
displayFun( fullpath,pathCost,totalTime,station,trainNo )
disp(stopTime)
% s_No = 1579;
% d_No = 933;
% station(s_No)
% station(d_No)
% train = trainNo(trainList{s_No,d_No}(q(d_No)))

