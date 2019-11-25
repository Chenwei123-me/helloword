% clc; clear; close all;
% addpath C:\Users\YNN\Desktop\matlab\心电数据\比赛数据12导联ECG数据汇总\1Normal
% tic;
% data=importdata('A0037.mat');
% data=data(1,:);
% t=0:1/1500:57958/1500;

fsam=500;
T=1/fsam;
load('A0176.mat');
data=ECG.data(1,:);
t=1:length(data);
% t=[0:M-1]*T;
% figure(1);plot(t,X);xlabel('time/s');ylabel('x(t)');title('心电信号');grid on;

g=[1 1 1 1 1 1];
% 闭运算
d1=pengzhang2(data, g, 0);
d1=fushi2(d1, g, 0);
% 开运算
d2=fushi2(data, g, 0);
d2=pengzhang2(d2, g, 0);

d=d1+d2;
d0=2*data-d;

% toc;

[~,locs_Rwave] = findpeaks(d0,'MinPeakHeight',0.1,'MinPeakDistance',200);
                                
                                
% ECG_inverted = -d0;
% [~,locs_Swave] = findpeaks(ECG_inverted,'MinPeakHeight',0.07,'MinPeakDistance',200)
 
                                    
figure;
az(1)=subplot(211);plot(t, data); title('原始信号'); axis tight;
az(2)=subplot(212); plot(t, d0); title('数学形态学滤波后的信号'); axis tight;

figure;
plot(t, d0);
% hold on,plot(t, data);
hold on,scatter(locs_Rwave,d0(locs_Rwave),'rv','MarkerFaceColor','r');
% for i=1:length(locs_Rwave)
%     
% hold on,plot([locs_Rwave(i),locs_Rwave(i)],[-0.5,0.5],'--k','LineWidth',2);
% end
grid on;xlabel('Samples');
ylabel('Voltage(mV)');
title('R-wave and S-wave in Noisy ECG Signal');  
% plot(locs_Swave,d0(locs_Swave),'rs','MarkerFaceColor','b')

% legend('ECG Signal','R-waves','S-waves')
                            
  
% smoothECG = sgolayfilt(ECG_data,7,41);

% N=512;
% mf=fft(data,N);               %进行频谱变换（傅里叶变换）
% mag=abs(mf);
% f=(0:length(mf)-1)*fsam/length(mf);  %进行频率变换
% subplot(211),plot(f,mag);axis tight;grid;      %画出频谱图
% xlabel('频率(HZ)');ylabel('幅值');title('心电信号频谱图');
% 
% mf1=fft(d0,N);               %进行频谱变换（傅里叶变换）
% mag1=abs(mf1);
% f=(0:length(mf1)-1)*fsam/length(mf1);  %进行频率变换
% subplot(212),plot(f,mag1);axis tight;grid;      %画出频谱图
% xlabel('频率(HZ)');ylabel('幅值');title('心电信号频谱图');