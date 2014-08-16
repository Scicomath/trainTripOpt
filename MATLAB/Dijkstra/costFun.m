function [ cost ] = costFun( data,s_No,d_No,trainID )
%costFun ��������վ��֮��ĳ���ε�Ʊ��
%   data Ϊ�г����ݿ�
%   s_No Ϊ��������
%   d_No ΪĿ�ĵر��
%   trainNo Ϊ���α��
%   cost ΪƱ��

% s_No = 933; d_No = 1065; trainID = 1154;
s = find(data.NumNo==trainID&data.StationNo==s_No);
d = find(data.NumNo==trainID&data.StationNo==d_No);

if data.S_No(s)==1&&(~isempty(data.P1(d)))&&(~isnan(data.P1(d)))
    cost = data.P1(d);
    return
end
if data.S_No(s)==1&&(~isempty(data.P3(d)))&&(~isnan(data.P3(d)))
    cost = data.P3(d);
    return
end

x = data.Distance(d) - ...
    data.Distance(s);
index = find(data.NumNo==trainID,1);
if strcmp(data.Type{index},'�Ǽʸ���')
    cost = min(table2array(data(d,9:12))) - min(table2array(data(s,9:12)));
    cost =round(cost);
    return
end
if strcmp(data.Type{index},'������')
    cost = 0.3085*x;
    cost =round(cost);
    return
end
if strcmp(data.Type{index},'���ٶ���')
    cost = 0.485*x;
    cost =round(cost);
    return
end
if strcmp(data.Type{index},'�¿�ֱ��')
    
    cost = min(table2array(data(d,9:12))) - min(table2array(data(s,9:12)));
    cost =round(cost);
    return
end

sigma = 1;
if strcmp(data.Type{index},'�տ�')
    sigma = sigma+0.02;
end
if strcmp(data.Type{index},'�տ�')
    sigma = sigma+0.02+0.2;
end
if strcmp(data.Type{index},'�¿��տ�')
    sigma = sigma+0.02+0.2+0.25;
end
if strcmp(data.Type{index},'�¿��տ�')
    sigma = sigma+0.02+0.25;
end
if strcmp(data.Type{index},'����')
    sigma = sigma+0.02+0.4;
end
if strcmp(data.Type{index},'�¿տ���')
    sigma = sigma+0.02+0.4+0.25;
end
if strcmp(data.Type{index},'�¿��ؿ�')
    sigma = sigma+0.02+0.4+0.25;
end


eta = 0.05861;
if 0<x&&x>200
    cost = eta*x*sigma+1;
elseif 200>x&&x<=500
    cost = eta*(200+(x-200)*0.9)*sigma+1;
elseif 500>x&&x<=1000
    cost = eta*(200+300*0.9+(x-500)*0.8)*sigma+1;
elseif 1000>x&&x<=1500
    cost = eta*(200+300*0.9+500*0.8+(x-1000)*0.7)*sigma+1;
elseif 1500>x&&x<=2500
    cost = eta*(200+300*0.9+500*0.8+500*0.7+(x-1500)*0.6)*sigma+1;
else
    cost = eta*(200+300*0.9+500*0.8+500*0.7+1000*0.6+(x-2500)*0.5)*sigma+1;
end

cost =round(cost);


end

