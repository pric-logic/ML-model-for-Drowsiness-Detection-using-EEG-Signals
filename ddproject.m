clc;
clear all;
close all;
sub ={'1','2','3','4','5','6','7','8','10','11','12'};
state = {'fatigue','normal'};
segment_size = 2000;
xdata =[];
ydata =[];
for j =1:2
for i = 1:11
file1 = strcat("C://Users//Arunam//Desktop//eeglab//eeglab_current//eeglab2023.1//dataset full//",sub{1,i},"_",state{1,j},"_ref.mat");
disp(file1)
original_data = load(file1);
temp = original_data.data;
[r,c] = size(temp);
Data = zeros(33,c);
Data(1,:) = temp(1,:);
Data(2,:)= temp(3,:);
Data(3,:) = temp(4,:);
Data(4,:)= temp(5,:);
Data(5,:) = temp(6,:);
Data(6,:)= temp(7,:);
Data(7,:) = temp(8,:);
Data(8,:)= temp(9,:);
Data(9,:) = temp(10,:);
Data(10,:)= temp(11,:);
Data(11,:) = temp(12,:);
Data(12,:)= temp(13,:);
Data(13,:) = temp(14,:);
Data(14,:)= temp(15,:);
Data(15,:) = temp(16,:);
Data(16,:)= temp(17,:);
Data(17,:) = temp(18,:);
Data(18,:)= temp(19,:);
Data(19,:) = temp(20,:);
Data(20,:)= temp(21,:);
Data(21,:) = temp(22,:);
Data(22,:)= temp(23,:);
Data(23,:) = temp(24,:);
Data(24,:)= temp(25,:);
Data(25,:) = temp(26,:);
Data(26,:)= temp(27,:);
Data(27,:) = temp(28,:);
Data(28,:)= temp(29,:);
Data(29,:) = temp(30,:);
Data(30,:)= temp(31,:);
Data(31,:)= temp(32,:);
Data(32,:) = temp(33,:);
Data(33,:)= temp(34,:);
count = 1;
for k = 1:segment_size:c-segment_size
clipped_data = Data(:,k:k+segment_size-1);
file2 = strcat("C://Users//Arunam//Desktop//eeglab//eeglab_current//eeglab2023.1//dataset//Data//",state{1,j},"//",sub{1,i},"_",state{1,j},"_ref",num2str(count),".mat");
save(file2,"clipped_data")
disp(file2)
count = count +1;
feat = [];
for ll = 1:33
pband_t = bandpower(Data(ll,:),1000,[4 8]);
pband_a = bandpower(Data(ll,:),1000,[8 12]);
ptot = bandpower(Data(ll,:),1000,[0 500]);
feat = horzcat(feat, pband_t, pband_a);
end
xdata=vertcat(xdata,feat);
if strcmp(state{1,j},'fatigue')==0
ydata=vertcat(ydata,1);
elseif strcmp(state{1,j},'normal')==0
ydata=vertcat(ydata,0);
end
save('C:\Users\Arunam\Desktop\eeglab\eeglab_current\eeglab2023.1\xdata3.mat', 'xdata');
save('C:\Users\Arunam\Desktop\eeglab\eeglab_current\eeglab2023.1\ydata3.mat', 'ydata');
end
end
End
classify
y=ydata;
x=xdata;
y=categorical(y);
x1 ={};
for i=1:1499
x1{i}=x(i,:);
end
x=x1;
x=x';
numFeatures = 66;
numHiddenUnits = 100;
numClasses = 2;
layers = [ ...
sequenceInputLayer(1)
lstmLayer(numHiddenUnits,'OutputMode','last')
fullyConnectedLayer(numClasses)
softmaxLayer
classificationLayer];
options = trainingOptions("adam", ...
InitialLearnRate=0.002,...
MaxEpochs=50, ...
Shuffle="never", ...
GradientThreshold=1, ...
Verbose=false, ...
Plots="training-progress");
[m,n] = size(x) ;
P = 0.70 ;
idx = randperm(m) ;
Training_x = x(idx(1:round(P*m)),:) ;
Testing_x = x(idx(round(P*m)+1:end),:) ;
Training_y = y(idx(1:round(P*m)),:) ;
Testing_y = y(idx(round(P*m)+1:end),:) ;
net = trainNetwork(Training_x,Training_y,layers,options);
YTest = classify(net,Testing_x);
acc = mean(YTest == Testing_y);
figure
confusionchart(Testing_y,YTest)

