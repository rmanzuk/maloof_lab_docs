function sercon(file,a,b)
% NOTE: This function was altered on 5/19/17 to deal with a second peak
% issue on the spec. Delete and uncomment code in the peak selection part
% of the code to restore to the original. AKM AOH
close all; home;
%Add the Raw Data folder to the file directory
fileList = dir('~/Documents/MATLAB/Sercon_Data_Scripts/Raw_data');
% % for testing purposes only
% file = '130507_JMH_SAMPLEACID.prn';
% a    = 88; total samples
% b    = 1;  offset from start to begin with, default 1
%sercon('131122_BCD.prn',88,1)
%%
%file = '131209_GHSMJ.prn';
%a    = 88; %total samples
%b    = 1;  %offset from start to begin with, default 1
b = b-1;
finaldata = [];
finalname = [];

for k = 0:a-1
    fclose('all');
    fid = fopen(file);
    data = textscan(fid, '%f%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%s',1, 'headerLines', 7+k);
    DATA = [data{1} data{3:end-1}];
    name = {data{2}{1}};
    beam = [2     7    12    17    22    27    32    37    42    47    52    57];
    for i = 1:numel(beam);
        if i~=numel(beam)
            finaldata = [finaldata;[DATA(1)+b i DATA(beam(i):beam(i+1)-1)]];
            finalname = [finalname;name];
        else
            finaldata = [finaldata;[DATA(1)+b i DATA(beam(i):end)]];
            finalname = [finalname;name];
        end
    end
end

L    = finaldata(:,1);
Id   = finalname;
%%

%the data: peak number, area all, d13C, d18O
DATA = [finaldata(:,2) finaldata(:,3) finaldata(:,4) finaldata(:,5)];
%%
% Pk = input('Which peaks should we keep? (Ex: input "5" will exclude peaks 1-5 for each sample (contains 12 peaks))  ');

%%
Pk = 4;
%sample identifiers, excluding peaks 1-5 for each sample

% Id   = Id(DATA(:,1)>Pk);
Id = Id(DATA(:,1) > Pk & DATA(:,1) ~= 6);
% sample line numbers, excluding peaks 1-5 for each sample
% L    = L(DATA(:,1)>Pk);
L = L(DATA(:,1) > Pk & DATA(:,1) ~= 6);


%the data, excluding peaks 1-5 for each sample
% DATA = DATA(DATA(:,1)>Pk, :);
DATA = DATA(DATA(:,1)>Pk & DATA(:,1) ~= 6,:);


V  = find(strncmp(Id,'V',1)==1);
Lv = L(V);
V  = DATA(V,:);
V  = [Lv,V];
Vline = sortrows(V,2);

%line numbers for the VTS secondary standard
Vline = Vline(Vline(:,2)==Pk+1);

N  = find(strncmp(Id,'N',1)==1);
Ln = L(N);
N  = DATA(N,:);
N  = [Ln,N];
Nline = sortrows(N,2);

%line numbers for the NBS primary standard
Nline = Nline(Nline(:,2)==Pk+1);

%%
figure(1)
clf
subplot(3,2,5)
hist(DATA(:,2))
dplusformat('AA','Number')
subplot(3,2,1)
plot(N(:,3),N(:,4),'bo','MarkerFaceColor','b','MarkerSize',5);
dplusformat('AA','N13')
 xlim([9e-9 9e-8]) 
hold on;
subplot(3,2,2)
plot(N(:,3),N(:,5),'ro','MarkerFaceColor','r','MarkerSize',5);
dplusformat('AA','N18')
 xlim([9e-9 9e-8]) 
subplot(3,2,3)
plot(V(:,3),V(:,4),'bo','MarkerFaceColor','b','MarkerSize',5);
dplusformat('AA','V13')
 xlim([9e-9 9e-8]) 
subplot(3,2,4)
plot(V(:,3),V(:,5),'ro','MarkerFaceColor','r','MarkerSize',5);
dplusformat('AA','V18')
 xlim([9e-9 9e-8]) 
[Nx Ny] = ginput(2);
[Vx Vy] = ginput(2);


Vx = sortrows(Vx);
Nx = sortrows(Nx);

%area all selection; Nx is the min, max area all selection for NBS; Vx is
%the min, max selection for VTS
AA = [Nx;Vx];


% Throwing out peaks from full dataset who are below and above peak area limits
nsamps = max(L);


DATA = [L, DATA];

id       = Id(DATA(:,3)>min(AA)&DATA(:,3)<max(AA));
data     = DATA(DATA(:,3)>min(AA)&DATA(:,3)<max(AA),:);

%%
Lnf = Ln(N(:,3)>=Nx(1) & N(:,3)<=Nx(2));
Lnf = char(Lnf);
Lnf = str2num(Lnf);
Nf  = N(N(:,3)>=Nx(1) & N(:,3)<=Nx(2),:);

%final subset of NBS standards, filtered for area all min and max
Nf  = [Lnf, Nf];

Lvf = Lv(V(:,3)>=Vx(1) & V(:,3)<=Vx(2));
Lvf = char(Lvf);
Lvf = str2num(Lvf);
Vf  = V(V(:,3)>=Vx(1) & V(:,3)<=Vx(2),:);

%final subset of VTS standards, filtered for area all min and max
Vf  = [Lvf, Vf];


%plotting the VTS and NBS as individual samples
dstnd(Nf, Nline, Vf, Vline);
keyboard

%selected NBS outliers to be exluded (Nex)
Nex = input('Exclude any NBS?   ');
figure(1)

%selected VTS outliers to be exluded (Vex)
Vex = input('Exclude any VTS?   ');
figure(1)

NEX = Nf;

if Nex~=0;
    for i = 1:numel(Nex);
        NEX = NEX(NEX(:,1)~=Nline(Nex(i)),:);
    end
else
    Nex = NaN;
end

VEX = Vf;
if Vex~=0;
    for i = 1:numel(Vex);
        VEX = VEX(VEX(:,1)~=Vline(Vex(i)),:);
    end
else
    Vex = NaN;
end


%%

%NEX and VEX are the final subsets of NBS and VTS, respectively, filtered
%for area all and individual samples (outliers). Plots of NEX and VEX

figure(1)
clf
subplot(2,2,1)
plot(NEX(:,3),NEX(:,4),'bo','MarkerFaceColor','b','MarkerSize',5);
dplusformat('AA','N13')
hold on;
subplot(2,2,2)
plot(NEX(:,3),NEX(:,5),'ro','MarkerFaceColor','r','MarkerSize',5);
dplusformat('AA','N18')
subplot(2,2,3)
plot(VEX(:,3),VEX(:,4),'bo','MarkerFaceColor','b','MarkerSize',5);
dplusformat('AA','V13')
subplot(2,2,4)
plot(VEX(:,3),VEX(:,5),'ro','MarkerFaceColor','r','MarkerSize',5);
dplusformat('AA','V18')

%mtit('Standards Used for this Run',...
	     %'fontsize',18,'color',[1 0 0]);

%%

%NBS slopes for d13C and d18O vs area all
N13m = polyfit(NEX(:,3),NEX(:,4),1);
N18m = polyfit(NEX(:,3),NEX(:,5),1);

%VTS slopes for d13C and d18O vs area all
V13m = polyfit(VEX(:,3),VEX(:,4),1);
V18m = polyfit(VEX(:,3),VEX(:,5),1);

%mean slopes between NBS and VTS for d13C and d18O vs area all
NV13m = mean([N13m; V13m]);
NV18m = mean([N18m; V18m]);

%NEX and VEX standard subset detrended using NBS slopes
NEXlinN = [NEX(:,1:3),NEX(:,4)-NEX(:,3)*N13m(1),NEX(:,5)-NEX(:,3)*N18m(1)];
VEXlinN = [VEX(:,1:3),VEX(:,4)-VEX(:,3)*N13m(1),VEX(:,5)-VEX(:,3)*N18m(1)];

%NEX and VEX standard subset detrended using VTS slopes
NEXlinV = [NEX(:,1:3),NEX(:,4)-NEX(:,3)*V13m(1),NEX(:,5)-NEX(:,3)*V18m(1)];
VEXlinV = [VEX(:,1:3),VEX(:,4)-VEX(:,3)*V13m(1),VEX(:,5)-VEX(:,3)*V18m(1)];

%NEX and VEX standard subset detrended using mean slopes
NEXlinNV = [NEX(:,1:3),NEX(:,4)-NEX(:,3)*NV13m(1),NEX(:,5)-NEX(:,3)*NV18m(1)];
VEXlinNV = [VEX(:,1:3),VEX(:,4)-VEX(:,3)*NV13m(1),VEX(:,5)-VEX(:,3)*NV18m(1)];

%plots of d13C vs area all and d18O vs area all (detrended using the NBS slopes)
figure(2)
x=[0:1:10];

clf

subplot(3,2,1), plot(x.^2,x)
plot(NEXlinN(:,3),NEXlinN(:,4),'bo','MarkerFaceColor','b','MarkerSize',5);
dplusformat('AA','N13')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(NEXlinN(:,4)), '\sigma', sqrt(var(NEXlinN(:,4)))));
hold on;
subplot(3,2,2), plot(x.^2,x)
plot(NEXlinN(:,3),NEXlinN(:,5),'ro','MarkerFaceColor','r','MarkerSize',5);
dplusformat('AA','N18')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(NEXlinN(:,5)), '\sigma', sqrt(var(NEXlinN(:,5)))));
subplot(3,2,3), plot(x.^2,x)
plot(VEXlinN(:,3),VEXlinN(:,4),'bo','MarkerFaceColor','b','MarkerSize',5);
dplusformat('AA','V13')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(VEXlinN(:,4)), '\sigma', sqrt(var(VEXlinN(:,4)))));
subplot(3,2,4), plot(x.^2,x)
plot(VEXlinN(:,3),VEXlinN(:,5),'ro','MarkerFaceColor','r','MarkerSize',5);
dplusformat('AA','V18')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(VEXlinN(:,5)), '\sigma', sqrt(var(VEXlinN(:,5)))));
%mtit('NBS Slope',...
	     %'fontsize',18,'color',[1 0 0]);
     
% removing isotope value vs slope dependence with linear NBS slope
d13ClinN  = data(:,4) - N13m(1)*data(:,3);
d18OlinN  = data(:,5) - N18m(1)*data(:,3);

[g1 s1]  = row2stats(data(:,1), d13ClinN);

[g1 s2]  = row2stats(data(:,1), d18OlinN);

d13CstdN  = sqrt(s1.variance(:));
d18OstdN  = sqrt(s2.variance(:));

subplot(3,2,5), plot(x.^2,x)
hist(d13CstdN)
dplusformat('Standard Deviation of All Analyses','Number')
title(sprintf('%s = %3.3f','\mu', mean(d13CstdN)));

subplot(3,2,6), plot(x.^2,x)
hist(d18OstdN)
dplusformat('Standard Deviation of All Analyses','Number')
title(sprintf('%s = %3.3f','\mu', mean(d18OstdN)));
h = findobj(gca,'Type','patch');
set(h,'FaceColor','r','EdgeColor','r')

ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 
1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');

text(0.5, 1,'\bf NBS Slope','HorizontalAlignment','center','VerticalAlignment', 'top','FontSize',16)

%plots of d13C vs area all and d18O vs area all (detrended using the VTS slopes)
figure(3)
clf
subplot(3,2,1), plot(x.^2,x)
plot(NEXlinV(:,3),NEXlinV(:,4),'bo','MarkerFaceColor','b','MarkerSize',5);
dplusformat('AA','N13')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(NEXlinV(:,4)), '\sigma', sqrt(var(NEXlinV(:,4)))));
hold on;
subplot(3,2,2), plot(x.^2,x)
plot(NEXlinV(:,3),NEXlinV(:,5),'ro','MarkerFaceColor','r','MarkerSize',5);
dplusformat('AA','N18')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(NEXlinV(:,5)), '\sigma', sqrt(var(NEXlinV(:,5)))));
subplot(3,2,3), plot(x.^2,x)
plot(VEXlinV(:,3),VEXlinV(:,4),'bo','MarkerFaceColor','b','MarkerSize',5);
dplusformat('AA','V13')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(VEXlinV(:,4)), '\sigma', sqrt(var(VEXlinV(:,4)))));
subplot(3,2,4), plot(x.^2,x)
plot(VEXlinV(:,3),VEXlinV(:,5),'ro','MarkerFaceColor','r','MarkerSize',5);
dplusformat('AA','V18')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(VEXlinV(:,5)), '\sigma', sqrt(var(VEXlinV(:,5)))));
%mtit('VTS Slope',...
	     %'fontsize',18,'color',[1 0 0]);
     
% removing isotope value vs slope dependence with linear NBS slope
d13ClinV  = data(:,4) - V13m(1)*data(:,3);
d18OlinV  = data(:,5) - V18m(1)*data(:,3);

[g1 s1]  = row2stats(data(:,1), d13ClinV);

[g1 s2]  = row2stats(data(:,1), d18OlinV);

d13CstdV  = sqrt(s1.variance(:));
d18OstdV  = sqrt(s2.variance(:));

subplot(3,2,5), plot(x.^2,x)
hist(d13CstdV)
dplusformat('Standard Deviation of All Analyses','Number')
title(sprintf('%s = %3.3f','\mu', mean(d13CstdV)));

subplot(3,2,6), plot(x.^2,x)
hist(d18OstdV)
dplusformat('Standard Deviation of All Analyses','Number')
title(sprintf('%s = %3.3f','\mu', mean(d18OstdV)));
h = findobj(gca,'Type','patch');
set(h,'FaceColor','r','EdgeColor','r')


ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 
1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');

text(0.5, 1,'\bf VTS Slope','HorizontalAlignment','center','VerticalAlignment', 'top','FontSize',16)

     
%plots of d13C vs area all and d18O vs area all (detrended using the average slopes)
figure(4)
clf
subplot(3,2,1), plot(x.^2,x)
plot(NEXlinNV(:,3),NEXlinNV(:,4),'bo','MarkerFaceColor','b','MarkerSize',5);
dplusformat('AA','N13')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(NEXlinNV(:,4)), '\sigma', sqrt(var(NEXlinNV(:,4)))));
hold on;
subplot(3,2,2), plot(x.^2,x)
plot(NEXlinNV(:,3),NEXlinNV(:,5),'ro','MarkerFaceColor','r','MarkerSize',5);
dplusformat('AA','N18')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(NEXlinNV(:,5)), '\sigma', sqrt(var(NEXlinNV(:,5)))));
subplot(3,2,3), plot(x.^2,x)
plot(VEXlinNV(:,3),VEXlinNV(:,4),'bo','MarkerFaceColor','b','MarkerSize',5);
dplusformat('AA','V13')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(VEXlinNV(:,4)), '\sigma', sqrt(var(VEXlinNV(:,4)))));
subplot(3,2,4), plot(x.^2,x)
plot(VEXlinNV(:,3),VEXlinNV(:,5),'ro','MarkerFaceColor','r','MarkerSize',5);
dplusformat('AA','V18')
title(sprintf('%s = %3.3f; %s = %3.3f','\mu', mean(VEXlinNV(:,5)), '\sigma', sqrt(var(VEXlinNV(:,5)))));
%mtit('Average Slopes',...
	    % 'fontsize',18,'color',[1 0 0]);

% removing isotope value vs slope dependence with linear NBS slope
d13ClinNV  = data(:,4) - NV13m(1)*data(:,3);
d18OlinNV  = data(:,5) - NV18m(1)*data(:,3);

[g1 s1]  = row2stats(data(:,1), d13ClinNV);

[g1 s2]  = row2stats(data(:,1), d18OlinNV);

d13CstdNV  = sqrt(s1.variance(:));
d18OstdNV  = sqrt(s2.variance(:));

subplot(3,2,5), plot(x.^2,x)
hist(d13CstdNV)
dplusformat('Standard Deviation of All Analyses','Number')
title(sprintf('%s = %3.3f','\mu', mean(d13CstdNV)));

subplot(3,2,6), plot(x.^2,x)
hist(d18OstdNV)
dplusformat('Standard Deviation of All Analyses','Number')
title(sprintf('%s = %3.3f','\mu', mean(d18OstdNV)));
h = findobj(gca,'Type','patch');
set(h,'FaceColor','r','EdgeColor','r')

ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 
1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');

text(0.5, 1,'\bf Average Slopes','HorizontalAlignment','center','VerticalAlignment', 'top','FontSize',16)

%%

p = input('Which standard should be used as the primary standard [N or V]?   ','s');

if strcmp(p,'V')==1;
    PSTND = VEX;
    SSTND = NEX;
    true13C = -1.48;
    true18O = -8.54; 
    s = 'N';
else
    PSTND = NEX;
    SSTND = VEX;
    true13C = 1.95;
    true18O = -2.20;
    s = 'V';
end


%selection of the slopes to use (NBS, VTS or the means)
slope = input('Which slope to use [N, V, or mu]?   ','s');
figname = [slope p '_standards_' file];
figname = figname(1:end-4);
if strcmp(slope,'N')==1
    corr = [N13m;N18m];
    figure(2)
    set(gcf,'PaperPositionMode','auto')
    print(figure(2),'-depsc',figname)
elseif strcmp(slope,'V')==1
    corr = [V13m;V18m];
    figure(3)
    set(gcf,'PaperPositionMode','auto')
    print(figure(3),'-depsc',figname)
else
    corr = [NV13m;NV18m];
    figure(4)
    set(gcf,'PaperPositionMode','auto')
    print(figure(4),'-depsc',figname)
end

PSTND_13C = mean(PSTND(:,4)-PSTND(:,3)*corr(1));
PSTND_18O = mean(PSTND(:,5)-PSTND(:,3)*corr(2));
PSTND_13Cstd = std(PSTND(:,4)-PSTND(:,3)*corr(1));
PSTND_18Ostd = std(PSTND(:,5)-PSTND(:,3)*corr(2));
%%

% removing isotope value vs slope dependence with linear slopes from above 
d13Clin  = data(:,4) - corr(1)*data(:,3);
d18Olin  = data(:,5) - corr(2)*data(:,3);

data     = [data, d13Clin, d18Olin];

% correcting data using single point correction. Standard used: NBS
% NBS values: 1.95 for 13C, -2.20 for 18O

d13Ccorr = (((data(:,6)+1000)*(true13C+1000))/(PSTND_13C+1000))-1000;
d18Ocorr = (((data(:,7)+1000)*(true18O+1000))/(PSTND_18O+1000))-1000;

SSTND = [SSTND, SSTND(:,4) - corr(1)*SSTND(:,3),SSTND(:,5) - corr(2)*SSTND(:,3)];

SSTND = [SSTND, (((SSTND(:,6)+1000)*(true13C+1000))/(PSTND_13C+1000))-1000,(((SSTND(:,7)+1000)*(true18O+1000))/(PSTND_18O+1000))-1000];

SSTND_13C = mean(SSTND(:,8));
SSTND_13Cstd = std(SSTND(:,8));

SSTND_18O = mean(SSTND(:,9));
SSTND_18Ostd = std(SSTND(:,9));

d13CcorrTP = ((-1.48 - 1.95)/((mean(VEX(:,4)-VEX(:,3)*corr(1))) - (mean(NEX(:,4)-NEX(:,3)*corr(1)))))*(data(:,6) - (mean(NEX(:,4)-NEX(:,3)*corr(1)))) + 1.95;
d18OcorrTP = ((-8.54- -2.20)/((mean(VEX(:,5)-VEX(:,3)*corr(2))) - (mean(NEX(:,5)-NEX(:,3)*corr(2)))))*(data(:,7) - (mean(NEX(:,5)-NEX(:,3)*corr(2)))) + -2.20;


%%

data     = [data, d13Ccorr, d18Ocorr, d13CcorrTP, d18OcorrTP];

% gathered all corrected data and exported as file 'AllData,' exported to
% the directory

AllData  = dataset(id, data);
fname1 = [slope p '_AllData_' file(1:end-4) '.csv'];
export(AllData,'File',fname1,'Delimiter',',')


% taking 13C and 18O averages for groups of data (all data for sample 1, 
% sample 2, etc)

[g1,s1]  = row2stats(data(:,1), d13Ccorr);

[g1,s2]  = row2stats(data(:,1), d18Ocorr);


line     = g1(:);
d13CmuSP   = s1.mean(:);
d13CstdSP  = sqrt(s1.variance(:));
d18OmuSP   = s2.mean(:);
d18OstdSP  = sqrt(s2.variance(:));
NumPeaks = s2.nonnans(:);


[g1,s1]  = row2stats(data(:,1), d13CcorrTP);

[g1,s2]  = row2stats(data(:,1), d18OcorrTP);


d13CmuTP   = s1.mean(:);
d13CstdTP  = sqrt(s1.variance(:));
d18OmuTP   = s2.mean(:);
d18OstdTP  = sqrt(s2.variance(:));

diff13C = abs(d13CmuSP - d13CmuTP);
diff18O = abs(d18OmuSP - d18OmuTP);

figure(5)
subplot(2,1,1)
plot(d13CmuSP, diff13C,'bo','MarkerFaceColor','b','MarkerSize',5)
set(gca,'FontSize',16)
ylabel('TWO-POINT minus SINGLE POINT','FontSize',13)
xlabel('SINGLE POINT \delta^{13}C Value','FontSize',13)
grid on
subplot(2,1,2)
plot(d18OmuSP, diff18O,'ro','MarkerFaceColor','r','MarkerSize',5)
set(gca,'FontSize',16)
grid on
xlabel('SINGLE POINT \delta^{18}O Value','FontSize',13)

pt = input('Two Point (TP) or Single Point (SP) Correction?   ','s');

if strcmp(pt,'TP')==1;
    d13Cmu = d13CmuTP;
    d18Omu = d18OmuTP;
    d13Cstd = d13CstdTP;
    d18Ostd = d18OstdTP;
else
    d13Cmu = d13CmuSP;
    d18Omu = d18OmuSP;
    d13Cstd = d13CstdSP;
    d18Ostd = d18OstdSP;
end


%%
%recovering the Sample Id - to be attached to the averaged data set
MeanData = [line,d13Cmu,d13Cstd,d18Omu,d18Ostd,NumPeaks];

[nrows ncols] = size(MeanData);
%%
finalid = [];

MD = [];

for i = 1:nsamps
    b = MeanData(MeanData(:,1)==i,:);
    if isempty(b)==0;
        c = find(data(:,1)==i);
        c = c(1);
        finalid = [finalid; id(c)];
        MD = [MD; b];
    else
        MD = [MD; i,NaN(1,5)];
        if ~isempty(find(Nline==i))
            finalid = [finalid; 'N_FAIL'];
        elseif ~isempty(find(Vline==i))
            finalid = [finalid; 'V_FAIL'];
        else
            finalid = [finalid; 'FAIL'];
        end
    end
end

% MD = [];
% 
% for i=1:nrows
%     MD = [MD; MeanData(i,:)];
%     if i~=nrows
%         if MeanData(i,1)+1 - MeanData(i+1,1)~=0;
%             MD = [MD; i+1,NaN(1,5)];
%         end
%     else
%         n = nsamps - max(MD(:,1));
%         if n~=0;
%             MD = [MD; (max(MD(:,1))+1:1:nsamps)',NaN(n,5)];
%         end          
%     end
% end
% 
% if max(MD(:,1))~=nsamps;
%     MD = [MD; nsamps,NaN(1,5)];
% end
%%

%exported dataset includes line number for each sample, mean d13C, stdev
%13C, mean d18O, stdev 18O, and number of measurements used for each
%statistic
line	 = MD(:,1);
d13Cmu	 = MD(:,2);
d13Cstd  = MD(:,3);
d18Omu   = MD(:,4);
d18Ostd  = MD(:,5);

size(finalid);
size(line);
size(d13Cmu);
size(d13Cstd);
size(d18Omu);
size(d18Ostd);
size(NumPeaks);


d13Cd18O = dataset(finalid,line,d13Cmu,d13Cstd,d18Omu,d18Ostd);
fname2 = [slope pt '_reduced_' file(1:end-4) '.csv'];
export(d13Cd18O,'File',fname2,'Delimiter',',')

Cslope = corr(1);
Oslope = corr(2);
AAmin  = min(AA);
AAmax  = max(AA);
if isnan(Nex)==0;
    N_excluded = Nline(Nex)';
else
    N_excluded = NaN;
end

if isnan(Vex)==0;
    V_excluded = Vline(Vex)';
else
    V_excluded = NaN;
end

%%
% exported parameter file, inluding the area all minimum, area all maximum,
% the d13C vs AA slope used to detrend data, the d18O vs AA used to detrend
% data, the primary standard d13C value for that run, the primary standard
% d18O value for that run, which peaks were thrown out,
% any NBS standards exluded (the line number), and any VTS standards
% exluded (the line number)
parameters = dataset(AAmin,AAmax,Cslope,Oslope,PSTND_13C,PSTND_13Cstd,PSTND_18O,PSTND_18Ostd,Pk, N_excluded,V_excluded);
fname3 = ['parameters_' file(1:end-4) '.csv'];
export(parameters,'File',fname3,'Delimiter',',')

%%
secondary = dataset(SSTND);
fname4 = [s '_secondarySTND_' file(1:end-4) '.csv'];
export(secondary,'File',fname4,'Delimiter',',')

%%

meansecondarySSTND = dataset(SSTND_13C,SSTND_13Cstd, SSTND_18O, SSTND_18Ostd);
fname5 = [s '_meansecondarySTND_' file(1:end-4) '.csv'];
export(meansecondarySSTND,'File',fname5,'Delimiter',',')

