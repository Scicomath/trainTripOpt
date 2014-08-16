[ cost ] = costFun( data,s_No,d_No,1 )
find(strcmp(trainNo,'1134/1135'))
find(strcmp(station,data.Station(1:28)))
piaojia = zeros(28,28);
for i=1:27
    for j = i+1:28
        if i~=j
            piaojia(i,j) = costFun( data,data.StationNo(i),data.StationNo(j),1 );
        end
    end
end