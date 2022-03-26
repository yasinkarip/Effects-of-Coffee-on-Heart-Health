%% Bu Program EKG Verilerinin Heart Rate'lerini hesaplamak için oluşturulmuştur.
%% Düzce Üniversitesi Biyomedikal Mühendisliği Laboratuvar'ında EKG cihazı alınan sinyaller osiloskop ile .csv formatı ile bilgisayar ortmamına aktarılmıştır.
%% Yapılan çalışma Kahvenin Kardiyovasküler Etkilerini anlamlı hale getirmek için oluşturulmuştur.
%% 5 kişi ile yapılan çalışma, katılımcıların kahve içmeden önce ve kahve içtikten sonra kalp atım hızlarında olan değişimleri kayıt altına almıştır.
close all
clear all
clc
disp('                                  HOŞGELDİNİZ ')
disp('                                  %%%%%%%')
disp('Program EKG atım sayılarını hesaplar')
disp('-------------------------------')

% Kullanıcı Girişi
file_name=input('Uzantısı olan dosyanın adını girin:','s');
sample_freq=input('Sinyalin örnekleme frekansını girin:');

%% Dosya Yükleme
load("EKG.mat");

index=1:10000;
ECG=ecg(index)
[pks,locs]=findpeaks(ECG,'minpeakdistance',100,'minpeakheight',4000);
Rpeaks=zeros(1,length(ECG));
Rpeaks(locs)=ECG(locs);
figure
plot(ECG)
hold
stem(Rpeaks,'r','linewidth',2);

RR=diff(locs);
figure
plot(RR,'ro')
HR=(60*sample_freq./RR);
figure,
plot(HR,'o')
meanHR=mean(HR)