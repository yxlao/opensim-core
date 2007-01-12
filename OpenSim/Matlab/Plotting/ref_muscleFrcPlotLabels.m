function figContents = ref_muscleFrcPlotLabels()
% Purpose:  Returns a list of labels specifying the data to be plotted
%           in each subplot of each figure created by 
%           compare_muscleFrcFromMot(). 
%
%           NOTES:
%           qPlotLabel{} specifies column headings of a motion file 
%               associated with the UW Gait Workflow; the corresponding 
%               data will be plotted on figNum(plotNum)
%           perryAbbr{} specifies muscle abbreviations as coded in
%               get_emgTimingFromPerry()
%           subplotTitle{} specifies title of each subplot
%           subplotAxisLabel{} specifies y-axis label of each subplot
%           subplotRange{} specifies the min, max values for scaling each
%               subplot
%           subplotTick{} specifies the y-tick labels of each subplot
%
% Output:   figContents returns a structure, formatted as follows:
%               *(figNum).qPlotLabel{plotNum}                                
%               *(figNum).perryAbbr{muscleAbbrNum}        
%               *(figNum).subplotTitle{plotNum}   
%               *(figNum).subplotAxisLabel{plotNum}   
%               *(figNum).subplotRange{plotNum}   
%               *(figNum).subplotTick{plotNum}
%
% ASA, 11-05, rev 2-06


% Figure 1: Gluteus maximus, medius, and minimus.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'glut_max1_l_frc', 'glut_max2_l_frc', 'glut_max3_l_frc'};
qPlotLabel{6}  = {'glut_max1_r_frc', 'glut_max2_r_frc', 'glut_max3_r_frc'};
qPlotLabel{7}  = {'glut_med1_l_frc', 'glut_med2_l_frc', 'glut_med3_l_frc'};
qPlotLabel{8}  = {'glut_med1_r_frc', 'glut_med2_r_frc', 'glut_med3_r_frc'};
qPlotLabel{9}  = {'glut_min1_l_frc', 'glut_min2_l_frc', 'glut_min3_l_frc'};
qPlotLabel{10} = {'glut_min1_r_frc', 'glut_min2_r_frc', 'glut_min3_r_frc'};
perryAbbr = {'GMAX upper', 'GMAX lower', 'GMED'};
subplotTitle{1}  = {'Left'};
subplotTitle{2}  = {'Right'};
subplotTitle{3}  = {};
subplotTitle{4}  = {};
subplotTitle{5}  = {'GMAX 1, 2, 3'};
subplotTitle{6}  = {'GMAX 1, 2, 3'};
subplotTitle{7}  = {'GMED 1, 2, 3'};
subplotTitle{8}  = {'GMED 1, 2, 3'};
subplotTitle{9}  = {'GMIN 1, 2, 3'};
subplotTitle{10} = {'GMIN 1, 2, 3'};
subplotAxisLabel{1}  = 'vertical GRF (N)';
subplotAxisLabel{2}  = {};
subplotAxisLabel{3}  = {};
subplotAxisLabel{4}  = {};
subplotAxisLabel{5}  = 'muscle force (N)';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle force (N)';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle force (N)';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 400];     % Generic Max = 500
subplotRange{6}  = [0 400];
subplotRange{7}  = [0 800];
subplotRange{8}  = [0 800];
subplotRange{9}  = [0 400];
subplotRange{10} = [0 400];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = {};
subplotTick{6}  = {};
subplotTick{7}  = {};
subplotTick{8}  = {};
subplotTick{9}  = {};
subplotTick{10} = {};
figContents(1).qPlotLabel = qPlotLabel;
figContents(1).perryAbbr = perryAbbr;
figContents(1).subplotTitle = subplotTitle;
figContents(1).subplotAxisLabel = subplotAxisLabel;
figContents(1).subplotRange = subplotRange;
figContents(1).subplotTick = subplotTick;
clear qPlotLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 2: Iliopsoas, TFL, sartorius.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'iliacus_l_frc', 'psoas_l_frc'};
qPlotLabel{6}  = {'iliacus_r_frc', 'psoas_r_frc'};
qPlotLabel{7}  = {'sar_l_frc'};
qPlotLabel{8}  = {'sar_r_frc'};
qPlotLabel{9}  = {'tfl_l_frc'};
qPlotLabel{10} = {'tfl_r_frc'};
perryAbbr = {'IL', 'SAR', 'TFL'};
subplotTitle{1}  = {'Left'};
subplotTitle{2}  = {'Right'};
subplotTitle{3}  = {};
subplotTitle{4}  = {};
subplotTitle{5}  = {'IL, PS'};
subplotTitle{6}  = {'IL, PS'};
subplotTitle{7}  = {'SAR'};
subplotTitle{8}  = {'SAR'};
subplotTitle{9}  = {'TFL'};
subplotTitle{10} = {'TFL'};
subplotAxisLabel{1}  = 'vertical GRF (N)';
subplotAxisLabel{2}  = {};
subplotAxisLabel{3}  = {};
subplotAxisLabel{4}  = {};
subplotAxisLabel{5}  = 'muscle force (N)';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle force (N)';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle force (N)';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1120];     % Generic Max = 900
subplotRange{6}  = [0 1120];
subplotRange{7}  = [0 260];
subplotRange{8}  = [0 260];
subplotRange{9}  = [0 260];
subplotRange{10} = [0 260];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = {};
subplotTick{6}  = {};
subplotTick{7}  = {};
subplotTick{8}  = {};
subplotTick{9}  = {};
subplotTick{10} = {};
figContents(2).qPlotLabel = qPlotLabel;
figContents(2).perryAbbr = perryAbbr;
figContents(2).subplotTitle = subplotTitle;
figContents(2).subplotAxisLabel = subplotAxisLabel;
figContents(2).subplotRange = subplotRange;
figContents(2).subplotTick = subplotTick;
clear qPlotLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 3: Vasti, RF.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {};
qPlotLabel{6}  = {};
qPlotLabel{7}  = {'vas_med_l_frc', 'vas_int_l_frc', 'vas_lat_l_frc'};
qPlotLabel{8}  = {'vas_med_r_frc', 'vas_int_r_frc', 'vas_lat_r_frc'};
qPlotLabel{9}  = {'rect_fem_l_frc'};
qPlotLabel{10} = {'rect_fem_r_frc'};
perryAbbr = {'VASmed', 'VASint', 'VASlat', 'RF'};
subplotTitle{1}  = {'Left'};
subplotTitle{2}  = {'Right'};
subplotTitle{3}  = {};
subplotTitle{4}  = {};
subplotTitle{5}  = {};
subplotTitle{6}  = {};
subplotTitle{7}  = {'VAS med, int, lat'};
subplotTitle{8}  = {'VAS med, int, lat'};
subplotTitle{9}  = {'RF'};
subplotTitle{10} = {'RF'};
subplotAxisLabel{1}  = 'vertical GRF (N)';
subplotAxisLabel{2}  = {};
subplotAxisLabel{3}  = {};
subplotAxisLabel{4}  = {};
subplotAxisLabel{5}  = 'muscle force (N)';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle force (N)';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle force (N)';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = {};
subplotRange{6}  = {};
subplotRange{7}  = [0 880];     % Generic Max = 500
subplotRange{8}  = [0 880];
subplotRange{9}  = [0 880];
subplotRange{10} = [0 880];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = {};
subplotTick{6}  = {};
subplotTick{7}  = {};
subplotTick{8}  = {};
subplotTick{9}  = {};
subplotTick{10} = {};
figContents(3).qPlotLabel = qPlotLabel;
figContents(3).perryAbbr = perryAbbr;
figContents(3).subplotTitle = subplotTitle;
figContents(3).subplotAxisLabel = subplotAxisLabel;
figContents(3).subplotRange = subplotRange;
figContents(3).subplotTick = subplotTick;
clear qPlotLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 4: SM, ST, BFLH, BFSH. 
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'semimem_l_frc', 'semiten_l_frc'};
qPlotLabel{6}  = {'semimem_r_frc', 'semiten_r_frc'};
qPlotLabel{7}  = {'bifemlh_l_frc'};
qPlotLabel{8}  = {'bifemlh_r_frc'};
qPlotLabel{9}  = {'bifemsh_l_frc'};
qPlotLabel{10} = {'bifemsh_r_frc'};
perryAbbr = {'SM', 'ST', 'BFLH', 'BFSH'};
subplotTitle{1}  = {'Left'};
subplotTitle{2}  = {'Right'};
subplotTitle{3}  = {};
subplotTitle{4}  = {};
subplotTitle{5}  = {'SM, ST'};
subplotTitle{6}  = {'SM, ST'};
subplotTitle{7}  = {'BFLH'};
subplotTitle{8}  = {'BFLH'};
subplotTitle{9}  = {'BFSH'};
subplotTitle{10} = {'BFSH'};
subplotAxisLabel{1}  = 'vertical GRF (N)';
subplotAxisLabel{2}  = {};
subplotAxisLabel{3}  = {};
subplotAxisLabel{4}  = {};
subplotAxisLabel{5}  = 'muscle force (N)';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle force (N)';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle force (N)';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 500];     % Generic Max = 500
subplotRange{6}  = [0 500];
subplotRange{7}  = [0 500];
subplotRange{8}  = [0 500];
subplotRange{9}  = [0 750];
subplotRange{10} = [0 750];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = {};
subplotTick{6}  = {};
subplotTick{7}  = {};
subplotTick{8}  = {};
subplotTick{9}  = {};
subplotTick{10} = {};
figContents(4).qPlotLabel = qPlotLabel;
figContents(4).perryAbbr = perryAbbr;
figContents(4).subplotTitle = subplotTitle;
figContents(4).subplotAxisLabel = subplotAxisLabel;
figContents(4).subplotRange = subplotRange;
figContents(4).subplotTick = subplotTick;
clear qPlotLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 5: Adductors.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'add_brev_l_frc', 'add_long_l_frc'};
qPlotLabel{6}  = {'add_brev_r_frc', 'add_long_r_frc'};
qPlotLabel{7}  = {'add_mag1_l_frc', 'add_mag2_l_frc', 'add_mag3_l_frc'};
qPlotLabel{8}  = {'add_mag1_r_frc', 'add_mag2_r_frc', 'add_mag3_r_frc'};
qPlotLabel{9}  = {'pect_l_frc', 'grac_l_frc'};
qPlotLabel{10} = {'pect_r_frc', 'grac_r_frc'};
perryAbbr = {'AL', 'ADM', 'GR'};
subplotTitle{1}  = {'Left'};
subplotTitle{2}  = {'Right'};
subplotTitle{3}  = {};
subplotTitle{4}  = {};
subplotTitle{5}  = {'AB, AL'};
subplotTitle{6}  = {'AB, AL'};
subplotTitle{7}  = {'ADM 1, 2, 3 '};
subplotTitle{8}  = {'ADM 1, 2, 3 '};
subplotTitle{9}  = {'PECT, GR'};
subplotTitle{10} = {'PECT, GR'};
subplotAxisLabel{1}  = 'vertical GRF (N)';
subplotAxisLabel{2}  = {};
subplotAxisLabel{3}  = {};
subplotAxisLabel{4}  = {};
subplotAxisLabel{5}  = 'muscle force (N)';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle force (N)';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle force (N)';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 320];     % Generic Max = 300
subplotRange{6}  = [0 320];
subplotRange{7}  = [0 320];
subplotRange{8}  = [0 320];
subplotRange{9}  = [0 100];
subplotRange{10} = [0 100];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = {};
subplotTick{6}  = {};
subplotTick{7}  = {};
subplotTick{8}  = {};
subplotTick{9}  = {};
subplotTick{10} = {};
figContents(5).qPlotLabel = qPlotLabel;
figContents(5).perryAbbr = perryAbbr;
figContents(5).subplotTitle = subplotTitle;
figContents(5).subplotAxisLabel = subplotAxisLabel;
figContents(5).subplotRange = subplotRange;
figContents(5).subplotTick = subplotTick;
clear qPlotLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 6: Rotators.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'quad_fem_l_frc'};
qPlotLabel{6}  = {'quad_fem_r_frc'};
qPlotLabel{7}  = {'gem_l_frc'};
qPlotLabel{8}  = {'gem_r_frc'};
qPlotLabel{9}  = {'peri_l_frc'};
qPlotLabel{10} = {'peri_r_frc'};
perryAbbr = {};
subplotTitle{1}  = {'Left'};
subplotTitle{2}  = {'Right'};
subplotTitle{3}  = {};
subplotTitle{4}  = {};
subplotTitle{5}  = {'Quadratus Femoris'};
subplotTitle{6}  = {'Quadratus Femoris'};
subplotTitle{7}  = {'Gemelli'};
subplotTitle{8}  = {'Gemelli'};
subplotTitle{9}  = {'Piriformis'};
subplotTitle{10} = {'Piriformis'};
subplotAxisLabel{1}  = 'vertical GRF (N)';
subplotAxisLabel{2}  = {};
subplotAxisLabel{3}  = {};
subplotAxisLabel{4}  = {};
subplotAxisLabel{5}  = 'muscle force (N)';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle force (N)';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle force (N)';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 160];     % Generic Max = 160
subplotRange{6}  = [0 160];
subplotRange{7}  = [0 160];
subplotRange{8}  = [0 160];
subplotRange{9}  = [0 160];
subplotRange{10} = [0 160];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = {};
subplotTick{6}  = {};
subplotTick{7}  = {};
subplotTick{8}  = {};
subplotTick{9}  = {};
subplotTick{10} = {};
figContents(6).qPlotLabel = qPlotLabel;
figContents(6).perryAbbr = perryAbbr;
figContents(6).subplotTitle = subplotTitle;
figContents(6).subplotAxisLabel = subplotAxisLabel;
figContents(6).subplotRange = subplotRange;
figContents(6).subplotTick = subplotTick;
clear qPlotLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 7: Plantarflexors.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'med_gas_l_frc', 'lat_gas_l_frc'};
qPlotLabel{6}  = {'med_gas_r_frc', 'lat_gas_r_frc'};
qPlotLabel{7}  = {'soleus_l_frc', 'tib_post_l_frc'};
qPlotLabel{8}  = {'soleus_r_frc', 'tib_post_r_frc'};
qPlotLabel{9}  = {'flex_dig_l_frc', 'flex_hal_l_frc'};
qPlotLabel{10} = {'flex_dig_r_frc', 'flex_hal_r_frc'};
perryAbbr = {'GAS', 'SOL', 'PTIB', 'FDL', 'FHL'};
subplotTitle{1}  = {'Left'};
subplotTitle{2}  = {'Right'};
subplotTitle{3}  = {};
subplotTitle{4}  = {};
subplotTitle{5}  = {'GAS med, lat'};
subplotTitle{6}  = {'GAS med, lat'};
subplotTitle{7}  = {'SOL, PTIB'};
subplotTitle{8}  = {'SOL, PTIB'};
subplotTitle{9}  = {'FDL, FHL'};
subplotTitle{10} = {'FDL, FHL'};
subplotAxisLabel{1}  = 'vertical GRF (N)';
subplotAxisLabel{2}  = {};
subplotAxisLabel{3}  = {};
subplotAxisLabel{4}  = {};
subplotAxisLabel{5}  = 'muscle force (N)';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle force (N)';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle force (N)';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1500];     % Generic Max = 1300
subplotRange{6}  = [0 1500];
subplotRange{7}  = [0 2200];    % Generic Max = 2000
subplotRange{8}  = [0 2200];  
subplotRange{9}  = [0 120];     % Generic Max = 200
subplotRange{10} = [0 120];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = {};
subplotTick{6}  = {};
subplotTick{7}  = {};
subplotTick{8}  = {};
subplotTick{9}  = {};
subplotTick{10} = {};
figContents(7).qPlotLabel = qPlotLabel;
figContents(7).perryAbbr = perryAbbr;
figContents(7).subplotTitle = subplotTitle;
figContents(7).subplotAxisLabel = subplotAxisLabel;
figContents(7).subplotRange = subplotRange;
figContents(7).subplotTick = subplotTick;
clear qPlotLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 8: Dorsiflexors, Evertors.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'tib_ant_l_frc', 'ext_hal_l_frc'};
qPlotLabel{6}  = {'tib_ant_r_frc', 'ext_hal_r_frc'};
qPlotLabel{7}  = {'ext_dig_l_frc', 'per_tert_l_frc'};
qPlotLabel{8}  = {'ext_dig_r_frc', 'per_tert_r_frc'};
qPlotLabel{9}  = {'per_long_l_frc', 'per_brev_l_frc'};
qPlotLabel{10} = {'per_long_r_frc', 'per_brev_r_frc'};
perryAbbr = {'TA', 'EDL', 'EHL', 'PERlong', 'PERbrev'};
subplotTitle{1}  = {'Left'};
subplotTitle{2}  = {'Right'};
subplotTitle{3}  = {};
subplotTitle{4}  = {};
subplotTitle{5}  = {'TA, EHL'};
subplotTitle{6}  = {'TA, EHL'};
subplotTitle{7}  = {'EDL, PER tert'};
subplotTitle{8}  = {'EDL, PER tert'};
subplotTitle{9}  = {'PER long, brev'};
subplotTitle{10} = {'PER long, brev'};
subplotAxisLabel{1}  = 'vertical GRF (N)';
subplotAxisLabel{2}  = {};
subplotAxisLabel{3}  = {};
subplotAxisLabel{4}  = {};
subplotAxisLabel{5}  = 'muscle force (N)';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle force (N)';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle force (N)';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 600];
subplotRange{6}  = [0 600];
subplotRange{7}  = [0 480];
subplotRange{8}  = [0 480];
subplotRange{9}  = [0 480];
subplotRange{10} = [0 480];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = {};
subplotTick{6}  = {};
subplotTick{7}  = {};
subplotTick{8}  = {};
subplotTick{9}  = {};
subplotTick{10} = {};
figContents(8).qPlotLabel = qPlotLabel;
figContents(8).perryAbbr = perryAbbr;
figContents(8).subplotTitle = subplotTitle;
figContents(8).subplotAxisLabel = subplotAxisLabel;
figContents(8).subplotRange = subplotRange;
figContents(8).subplotTick = subplotTick;
clear qPlotLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 9: Erector spinae, obliques.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'ercspn_l_frc'};
qPlotLabel{6}  = {'ercspn_r_frc'};
qPlotLabel{7}  = {'intobl_l_frc'};
qPlotLabel{8}  = {'intobl_r_frc'};
qPlotLabel{9}  = {'extobl_l_frc'};
qPlotLabel{10} = {'extobl_r_frc'};
perryAbbr = {};
subplotTitle{1}  = {'Left'};
subplotTitle{2}  = {'Right'};
subplotTitle{3}  = {};
subplotTitle{4}  = {};
subplotTitle{5}  = {'Erector Spinae'};
subplotTitle{6}  = {'Erector Spinae'};
subplotTitle{7}  = {'Int OBL'};
subplotTitle{8}  = {'Int OBL'};
subplotTitle{9}  = {'Ext OBL'};
subplotTitle{10} = {'Ext OBL'};
subplotAxisLabel{1}  = 'vertical GRF (N)';
subplotAxisLabel{2}  = {};
subplotAxisLabel{3}  = {};
subplotAxisLabel{4}  = {};
subplotAxisLabel{5}  = 'muscle force (N)';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle force (N)';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle force (N)';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1700];     % Generic Max = 800
subplotRange{6}  = [0 1700];
subplotRange{7}  = [0 360];
subplotRange{8}  = [0 360];
subplotRange{9}  = [0 360];
subplotRange{10} = [0 360];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = {};
subplotTick{6}  = {};
subplotTick{7}  = {};
subplotTick{8}  = {};
subplotTick{9}  = {};
subplotTick{10} = {};
figContents(9).qPlotLabel = qPlotLabel;
figContents(9).perryAbbr = perryAbbr;
figContents(9).subplotTitle = subplotTitle;
figContents(9).subplotAxisLabel = subplotAxisLabel;
figContents(9).subplotRange = subplotRange;
figContents(9).subplotTick = subplotTick;
clear qPlotLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;

return;
