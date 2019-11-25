% clc; clear; close all;
% addpath C:\Users\YNN\Desktop\matlab\�ĵ�����\��������12����ECG���ݻ���\1Normal
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
% figure(1);plot(t,X);xlabel('time/s');ylabel('x(t)');title('�ĵ��ź�');grid on;

g=[1 1 1 1 1 1];
% ������
d1=pengzhang2(data, g, 0);
d1=fushi2(d1, g, 0);
% ������
d2=fushi2(data, g, 0);
d2=pengzhang2(d2, g, 0);

d=d1+d2;
d0=2*data-d;

% toc;

[~,locs_Rwave] = findpeaks(d0,'MinPeakHeight',0.1,'MinPeakDistance',200);
                                
                                
% ECG_inverted = -d0;
% [~,locs_Swave] = findpeaks(ECG_inverted,'MinPeakHeight',0.07,'MinPeakDistance',200)
 
                                    
figure;
az(1)=subplot(211);plot(t, data); title('ԭʼ�ź�'); axis tight;
az(2)=subplot(212); plot(t, d0); title('��ѧ��̬ѧ�˲�����ź�'); axis tight;

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
% mf=fft(data,N);               %����Ƶ�ױ任������Ҷ�任��
% mag=abs(mf);
% f=(0:length(mf)-1)*fsam/length(mf);  %����Ƶ�ʱ任
% subplot(211),plot(f,mag);axis tight;grid;      %����Ƶ��ͼ
% xlabel('Ƶ��(HZ)');ylabel('��ֵ');title('�ĵ��ź�Ƶ��ͼ');
% 
% mf1=fft(d0,N);               %����Ƶ�ױ任������Ҷ�任��
% mag1=abs(mf1);
% f=(0:length(mf1)-1)*fsam/length(mf1);  %����Ƶ�ʱ任
% subplot(212),plot(f,mag1);axis tight;grid;      %����Ƶ��ͼ
% xlabel('Ƶ��(HZ)');ylabel('��ֵ');title('�ĵ��ź�Ƶ��ͼ');