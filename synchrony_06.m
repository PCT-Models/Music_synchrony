%% Sychrony - Beats: TG, Point Cook, Melbourne, 07-11-2022

clear all; clc; close all;

%%
% 3 Participants - Gp = 1,2,3,6,7,9,11,12,16
% 2 Participants - Gp = 4,5,8,10,13,14,15,17,18,19,20
diff_0001 = [];
diff_0002 = [];
diff_0003 = [];
compp1 = [];
compp2 = [];

time_all = [];

for x = [8]
    for xxx = 1:1:1
        diff_001 = [];
        diff_002 = [];
        %         diff_003 = [];
        for xx = 1:1:2 %(for 2 and for 3 Participants)
            file = sprintf('All music data/Group %d/%d_%d_%d',x,x,xx,xxx);
            if xx == 1
                [nmat1, mstr1] = readmidi(horzcat(file,'.mid'));
            end
            
            % For 2 Participants
            if xx == 2
                [nmat2, mstr2] = readmidi(horzcat(file,'.mid'));
                
                fulltime = round(max([nmat1(end,6),nmat2(end,6)]));
                %for n = 10:10:500 %max_onset;
                
%                 for i =  fulltime-10:4:fulltime-4 %0:4:fulltime-4
                    for i =  0:4:8
                    onset1 = find(nmat1(:,6) > i & nmat1(:,6) < i+4);
                    onset2 = find(nmat2(:,6) > i & nmat2(:,6) < i+4);
                    
                    % Find the Minimum division and let the quatized be like
                    % that, i.e. divide i/min(diff(onset1))
                    
                    max_onset = max([length(onset1),length(onset2)]);
                    n = max_onset;
                    
                    t = linspace(i,i+4,n);
                    t = t';
                    time_all = [time_all t'];
                    % For Participant-1
                    comp1 = nmat1(onset1,6);
                    
                    if ~isempty(t)
                        diff_01 = syncrony_func(t,comp1,4);
                        if isnan(diff_01)
                            disp('Hello');
                            diff_01 = 0;
                        end
                        diff_001 = [diff_001 diff_01'];
                        compp1 = [compp1,comp1'];
                    end
                    
                    
                    % For Participant-2
                    comp2 = nmat2(onset2,6);
                    
                    if ~isempty(t)
                        diff_02 = syncrony_func(t,comp2,4);
                        if isnan(diff_02)
                            disp('Pello');
                            diff_02 = 0;
                        end
                        diff_002 = [diff_002 diff_02'];
                        compp2 = [compp2,comp2'];
                    end
                end
                
                  diff_0001 = [diff_0001 mean(diff_001)];
                  diff_0002 = [diff_0002 mean(diff_002)];
                
%                 diff_0001 = [diff_0001 (diff_001)];
%                 diff_0002 = [diff_0002 (diff_002)];

%                   sum(d)/(length(data)*window)  
                  
%                 diff_0001 = [diff_0001 sum(diff_001)/length(diff_001)*4];
%                 diff_0002 = [diff_0002 sum(diff_002)/length(diff_002)*4];
                
                %end
            end
            % For 3 Participants
            if xx == 3
                [nmat3, mstr3] = readmidi(horzcat(file,'.mid'));
                
                fulltime = round(max([nmat1(end,6),nmat2(end,6),nmat3(end,6)]));
                
                for i = 0:4:fulltime-4
                    onset1 = find(nmat1(:,6) > i & nmat1(:,6) < i+4);
                    onset2 = find(nmat2(:,6) > i & nmat2(:,6) < i+4);
                    onset3 = find(nmat3(:,6) > i & nmat3(:,6) < i+4);
                    
                    % Find the Minimum division and let the quatized be like
                    % that, i.e. divide i/min(diff(onset1))
                    
                    max_onset = max([length(onset1),length(onset2),length(onset3)]);
                    
                    n = max_onset;
                    t = linspace(i,i+4,n);
                    t = t';
                    
                    % For Participant-1
                    comp1 = nmat1(onset1,6);
                    if ~isempty(t)
                        diff_01 = syncrony_func(t,comp1,4);
                        if isnan(diff_01)
                            disp('Hello');
                            diff_01 = 0;
                        end
                        diff_001 = [diff_001 diff_01];
                    end
                    
                    
                    % For Participant-2
                    comp2 = nmat2(onset2,6);
                    if ~isempty(t)
                        diff_02 = syncrony_func(t,comp2,4);
                        if isnan(diff_02)
                            disp('Hello');
                            diff_02 = 0;
                        end
                        diff_002 = [diff_002 diff_02];
                    end
                    
                    
                    % For Participant-3
                    comp3 = nmat3(onset3,6);
                    
                    if ~isempty(t)
                        diff_03 = syncrony_func(t,comp3,4);
                        if isnan(diff_03)
                            disp('Hello');
                            diff_03 = 0;
                        end
                        diff_003 = [diff_003 diff_03];
                    end
                    
                    
                end
                
                
            end
            
            
            
        end
        
        %         diff_0001 = [diff_0001 mean(diff_001)];
        %         diff_0002 = [diff_0002 mean(diff_002)];
        %         diff_0003 = [diff_0003 mean(diff_003)];       
        %         diff_0001 = [diff_0001 (diff_001)];
        %         diff_0002 = [diff_0002 (diff_002)];
        %         compp1 = [compp1,comp1'];
        %         compp2 = [compp2,comp2'];
        
        
        
    end
    
    
    
    
    
% ABC(G1)
% For P==2 make it y1y2 for both
% For P==3 make it y2y3 for both
%     writematrix(data1(:,1),'All data_01.xlsx','Sheet','Raw','Range','D2')
%     writematrix(data2(:,1),'All data_01.xlsx','Sheet','Raw','Range','E2')
%     writematrix(data3(:,1),'All data_01.xlsx','Sheet','Raw','Range','F2')

%     writematrix(RR1','All data_01.xlsx','Sheet','P10','Range','G3:G12')
%     writematrix(RR2','All data_01.xlsx','Sheet','P11','Range','G3:G12')
%     writematrix(RR3','All data_01.xlsx','Sheet','P41','Range','G3:G12')

% writematrix(diff_0001','All data_01.xlsx','Sheet','P39','Range','H3')
% writematrix(diff_0002','All data_01.xlsx','Sheet','P40','Range','H3')
% writematrix(diff_0003','All data_01.xlsx','Sheet','P41','Range','H3')

%     save(sprintf('gp%d_data1_t.mat',x),'cory1y2')
%     save(sprintf('gp%d_data2_t.mat',x),'cory2y3')
%     save(sprintf('gp%d_data3_t.mat',x),'cory1y3')
end


%     figure;
%     hold on;
%     plot(diff_0001,'--dr','LineWidth',1.5,'MarkerFaceColor','g','MarkerEdgeColor','k');
%     plot(diff_0002,'--ob','LineWidth',1.5,'MarkerFaceColor','c','MarkerEdgeColor','k');
% %     plot(abs(diff_0001(1:10) - diff_0002(1:10)),'--ok','LineWidth',2,'MarkerFaceColor','r','MarkerEdgeColor','k');
%     %plot(diff_0003,'-ob','LineWidth',2);
%     title('Proposed Digitised Synch Method');
%     legend('Prt-20','Prt-21','Sync = Abs(Prt-20 - Prt-21)','Location','Best');
%     xlabel('Within a Dyad Group 10 Trials');
%     ylabel('Synchrony');
% %     xlabel('Four Second Window with N-divisions');
% %     ylabel('Synchrony');
    
    figure;
    hold on;
    p1 = plot(time_all,0*ones(length(time_all)),'dk','LineWidth',2,'MarkerSize',10,'MarkerFaceColor','c');
    p2 = plot(compp1,0.5*ones(length(compp1)),'or','LineWidth',2,'MarkerSize',7,'MarkerFaceColor','c');
    p3 = plot(compp2,1*ones(length(compp2)),'ob','LineWidth',2,'MarkerSize',7,'MarkerFaceColor','c');
    h = gridxy(time_all,'Color','k','linewidth',1,'Linestyle','-.') ;    
    title('Proposed Digitised Synch Method (Group-8) 1st Min');
%     legend('Quant','Prt-1','Prt-2','Location','Best');
    xlabel('Onset Times (secs)');
%     ylabel('Onset Times (secs)');
    ylim([-1 2]);
    yticks([0 0.5 1])
    yticklabels({'Quant ','Part-20 ','Part-21'})
    ax = gca;
    ax.XGrid = 'on';
    ax.GridLineStyle = '--';

