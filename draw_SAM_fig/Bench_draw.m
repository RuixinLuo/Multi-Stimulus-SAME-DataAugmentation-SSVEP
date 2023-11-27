clc;
clear all; 
load bench_All_PT.mat;  % n_channel, 2 n_harm, n_event, n_sub

i_sub = 29; % choose a subject
event_list = [2,3,4,17,18,19,37,38,39]; % choose some events
fre_list = [8.2,8.4,8.6,11.2,11.4,11.6,15.2,15.4,15.6];

n_event = size(event_list,2);

data = squeeze(All_PT(:,:,event_list,i_sub));

figure(1),
set(gcf,'Position',[0,0,500,400]);
for i=1:1:n_event
    subplot(3,3,i);
    % draw heatmap
    dat = data(:,:,i);
    dat1 = dat/max(max(dat))
    h=heatmap(dat1,'Colormap',jet,'ColorLimits',[-1 1],'Title',[num2str(fre_list(i)),'Hz']) ; 
    h.FontSize = 10;
    h.FontName = 'Arial';
    h.ColorbarVisible = 'off';    
    ax = gca;
    ax.XDisplayLabels = nan(size(ax.XDisplayData));
    ax.YDisplayLabels = nan(size(ax.YDisplayData));
    if i == 1 || i == 4  || i == 7 
        h.YLabel = 'Nc';
    end
    if i == 7 || i == 8  || i == 9 
        h.XLabel = '2Nh';
    end
    if i == 3 || i == 6  || i == 9 
       h.ColorbarVisible = 'on';
    end
end
