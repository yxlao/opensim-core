function figContents = ref_muscleActPlotLabels()
% Purpose:  Returns a list of labels specifying the data to be plotted
%           in each subplot of each figure created by 
%           compare_muscleActFromMot(). 
%
%           NOTES:
%           qPlotLabel{} specifies column headings of a motion file 
%               associated with the UW Gait Workflow; the corresponding 
%               data will be plotted on figNum(plotNum)
%           qMeasuredLabel{} specifies column headings of a motion file 
%               associated with measured EMG data; the corresponding 
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
%               *(figNum).qMeasuredLabel{plotNum} 
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
qPlotLabel{5}  = {'glut_max1_l', 'glut_max2_l', 'glut_max3_l'};
qPlotLabel{6}  = {'glut_max1_r', 'glut_max2_r', 'glut_max3_r'};
qPlotLabel{7}  = {'glut_med1_l', 'glut_med2_l', 'glut_med3_l'};
qPlotLabel{8}  = {'glut_med1_r', 'glut_med2_r', 'glut_med3_r'};
qPlotLabel{9}  = {'glut_min1_l', 'glut_min2_l', 'glut_min3_l'};
qPlotLabel{10} = {'glut_min1_r', 'glut_min2_r', 'glut_min3_r'};
qMeasuredLabel{1}  = {};
qMeasuredLabel{2}  = {};
qMeasuredLabel{3}  = {};
qMeasuredLabel{4}  = {};
qMeasuredLabel{5}  = {};
qMeasuredLabel{6}  = {'glut_max_r_emgRec', 'glut_max_r_emgAve', ...
					  'glut_max_r_emgSDp', 'glut_max_r_emgSDm'};
qMeasuredLabel{7}  = {};
qMeasuredLabel{8}  = {'glut_med_r_emgRec', 'glut_med_r_emgAve', ...
					  'glut_med_r_emgSDp', 'glut_med_r_emgSDm'};
qMeasuredLabel{9}  = {};
qMeasuredLabel{10} = {};
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
subplotAxisLabel{5}  = 'muscle activation';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle activation';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle activation';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1];
subplotRange{6}  = [0 1];
subplotRange{7}  = [0 1];
subplotRange{8}  = [0 1];
subplotRange{9}  = [0 1];
subplotRange{10} = [0 1];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = [0:0.5:1];
subplotTick{6}  = [0:0.5:1];
subplotTick{7}  = [0:0.5:1];
subplotTick{8}  = [0:0.5:1];
subplotTick{9}  = [0:0.5:1];
subplotTick{10} = [0:0.5:1];
figContents(1).qPlotLabel = qPlotLabel;
figContents(1).qMeasuredLabel = qMeasuredLabel;
figContents(1).perryAbbr = perryAbbr;
figContents(1).subplotTitle = subplotTitle;
figContents(1).subplotAxisLabel = subplotAxisLabel;
figContents(1).subplotRange = subplotRange;
figContents(1).subplotTick = subplotTick;
clear qPlotLabel qMeasuredLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 2: Iliopsoas, TFL, sartorius.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'iliacus_l', 'psoas_l'};
qPlotLabel{6}  = {'iliacus_r', 'psoas_r'};
qPlotLabel{7}  = {'sar_l'};
qPlotLabel{8}  = {'sar_r'};
qPlotLabel{9}  = {'tfl_l'};
qPlotLabel{10} = {'tfl_r'};
qMeasuredLabel{1}  = {};
qMeasuredLabel{2}  = {};
qMeasuredLabel{3}  = {};
qMeasuredLabel{4}  = {};
qMeasuredLabel{5}  = {};
qMeasuredLabel{6}  = {};
qMeasuredLabel{7}  = {};
qMeasuredLabel{8}  = {};
qMeasuredLabel{9}  = {};
qMeasuredLabel{10} = {};
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
subplotAxisLabel{5}  = 'muscle activation';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle activation';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle activation';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1];
subplotRange{6}  = [0 1];
subplotRange{7}  = [0 1];
subplotRange{8}  = [0 1];
subplotRange{9}  = [0 1];
subplotRange{10} = [0 1];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = [0:0.5:1];
subplotTick{6}  = [0:0.5:1];
subplotTick{7}  = [0:0.5:1];
subplotTick{8}  = [0:0.5:1];
subplotTick{9}  = [0:0.5:1];
subplotTick{10} = [0:0.5:1];
figContents(2).qPlotLabel = qPlotLabel;
figContents(2).qMeasuredLabel = qMeasuredLabel;
figContents(2).perryAbbr = perryAbbr;
figContents(2).subplotTitle = subplotTitle;
figContents(2).subplotAxisLabel = subplotAxisLabel;
figContents(2).subplotRange = subplotRange;
figContents(2).subplotTick = subplotTick;
clear qPlotLabel qMeasuredLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 3: Vasti, RF.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {};
qPlotLabel{6}  = {};
qPlotLabel{7}  = {'vas_med_l', 'vas_int_l', 'vas_lat_l'};
qPlotLabel{8}  = {'vas_med_r', 'vas_int_r', 'vas_lat_r'};
qPlotLabel{9}  = {'rect_fem_l'};
qPlotLabel{10} = {'rect_fem_r'};
qMeasuredLabel{1}  = {};
qMeasuredLabel{2}  = {};
qMeasuredLabel{3}  = {};
qMeasuredLabel{4}  = {};
qMeasuredLabel{5}  = {};
qMeasuredLabel{6}  = {};
qMeasuredLabel{7}  = {};
qMeasuredLabel{8}  = {'vas_lat_r_emgRec', 'vas_lat_r_emgAve'
					  'vas_lat_r_emgSDp', 'vas_lat_r_emgSDm'};
qMeasuredLabel{9}  = {'rect_fem_l_emgRec', 'rect_fem_l_emgAve', ...
                     'rect_fem_l_emgSDp', 'rect_fem_l_emgSDm'};
qMeasuredLabel{10} = {'rect_fem_r_emgRec', 'rect_fem_r_emgAve', ...
                     'rect_fem_r_emgSDp', 'rect_fem_r_emgSDm'};
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
subplotAxisLabel{5}  = 'muscle activation';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle activation';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle activation';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1];
subplotRange{6}  = [0 1];
subplotRange{7}  = [0 1];
subplotRange{8}  = [0 1];
subplotRange{9}  = [0 1];
subplotRange{10} = [0 1];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = [0:0.5:1];
subplotTick{6}  = [0:0.5:1];
subplotTick{7}  = [0:0.5:1];
subplotTick{8}  = [0:0.5:1];
subplotTick{9}  = [0:0.5:1];
subplotTick{10} = [0:0.5:1];
figContents(3).qPlotLabel = qPlotLabel;
figContents(3).qMeasuredLabel = qMeasuredLabel;
figContents(3).perryAbbr = perryAbbr;
figContents(3).subplotTitle = subplotTitle;
figContents(3).subplotAxisLabel = subplotAxisLabel;
figContents(3).subplotRange = subplotRange;
figContents(3).subplotTick = subplotTick;
clear qPlotLabel qMeasuredLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 4: SM, ST, BFLH, BFSH. 
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'semimem_l', 'semiten_l'};
qPlotLabel{6}  = {'semimem_r', 'semiten_r'};
qPlotLabel{7}  = {'bifemlh_l'};
qPlotLabel{8}  = {'bifemlh_r'};
qPlotLabel{9}  = {'bifemsh_l'};
qPlotLabel{10} = {'bifemsh_r'};
qMeasuredLabel{1}  = {};
qMeasuredLabel{2}  = {};
qMeasuredLabel{3}  = {};
qMeasuredLabel{4}  = {};
qMeasuredLabel{5}  = {'hams_l_emgRec', 'hams_l_emgAve', ...
					  'hams_l_emgSDp', 'hams_l_emgSDm'};
qMeasuredLabel{6}  = {'hams_r_emgRec', 'hams_r_emgAve', ...
					  'hams_r_emgSDp', 'hams_r_emgSDm'};
qMeasuredLabel{7}  = {};
qMeasuredLabel{8}  = {};
qMeasuredLabel{9}  = {};
qMeasuredLabel{10} = {};
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
subplotAxisLabel{5}  = 'muscle activation';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle activation';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle activation';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1];
subplotRange{6}  = [0 1];
subplotRange{7}  = [0 1];
subplotRange{8}  = [0 1];
subplotRange{9}  = [0 1];
subplotRange{10} = [0 1];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = [0:0.5:1];
subplotTick{6}  = [0:0.5:1];
subplotTick{7}  = [0:0.5:1];
subplotTick{8}  = [0:0.5:1];
subplotTick{9}  = [0:0.5:1];
subplotTick{10} = [0:0.5:1];
figContents(4).qPlotLabel = qPlotLabel;
figContents(4).qMeasuredLabel = qMeasuredLabel;
figContents(4).perryAbbr = perryAbbr;
figContents(4).subplotTitle = subplotTitle;
figContents(4).subplotAxisLabel = subplotAxisLabel;
figContents(4).subplotRange = subplotRange;
figContents(4).subplotTick = subplotTick;
clear qPlotLabel qMeasuredLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 5: Adductors.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'add_brev_l', 'add_long_l'};
qPlotLabel{6}  = {'add_brev_r', 'add_long_r'};
qPlotLabel{7}  = {'add_mag1_l', 'add_mag2_l', 'add_mag3_l'};
qPlotLabel{8}  = {'add_mag1_r', 'add_mag2_r', 'add_mag3_r'};
qPlotLabel{9}  = {'pect_l', 'grac_l'};
qPlotLabel{10} = {'pect_r', 'grac_r'};
qMeasuredLabel{1}  = {};
qMeasuredLabel{2}  = {};
qMeasuredLabel{3}  = {};
qMeasuredLabel{4}  = {};
qMeasuredLabel{5}  = {};
qMeasuredLabel{6}  = {};
qMeasuredLabel{7}  = {};
qMeasuredLabel{8}  = {};
qMeasuredLabel{9}  = {};
qMeasuredLabel{10} = {};
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
subplotAxisLabel{5}  = 'muscle activation';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle activation';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle activation';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1];
subplotRange{6}  = [0 1];
subplotRange{7}  = [0 1];
subplotRange{8}  = [0 1];
subplotRange{9}  = [0 1];
subplotRange{10} = [0 1];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = [0:0.5:1];
subplotTick{6}  = [0:0.5:1];
subplotTick{7}  = [0:0.5:1];
subplotTick{8}  = [0:0.5:1];
subplotTick{9}  = [0:0.5:1];
subplotTick{10} = [0:0.5:1];
figContents(5).qPlotLabel = qPlotLabel;
figContents(5).qMeasuredLabel = qMeasuredLabel;
figContents(5).perryAbbr = perryAbbr;
figContents(5).subplotTitle = subplotTitle;
figContents(5).subplotAxisLabel = subplotAxisLabel;
figContents(5).subplotRange = subplotRange;
figContents(5).subplotTick = subplotTick;
clear qPlotLabel qMeasuredLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 6: Rotators.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'quad_fem_l'};
qPlotLabel{6}  = {'quad_fem_r'};
qPlotLabel{7}  = {'gem_l'};
qPlotLabel{8}  = {'gem_r'};
qPlotLabel{9}  = {'peri_l'};
qPlotLabel{10} = {'peri_r'};
qMeasuredLabel{1}  = {};
qMeasuredLabel{2}  = {};
qMeasuredLabel{3}  = {};
qMeasuredLabel{4}  = {};
qMeasuredLabel{5}  = {};
qMeasuredLabel{6}  = {};
qMeasuredLabel{7}  = {};
qMeasuredLabel{8}  = {};
qMeasuredLabel{9}  = {};
qMeasuredLabel{10} = {};
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
subplotAxisLabel{5}  = 'muscle activation';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle activation';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle activation';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1];
subplotRange{6}  = [0 1];
subplotRange{7}  = [0 1];
subplotRange{8}  = [0 1];
subplotRange{9}  = [0 1];
subplotRange{10} = [0 1];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = [0:0.5:1];
subplotTick{6}  = [0:0.5:1];
subplotTick{7}  = [0:0.5:1];
subplotTick{8}  = [0:0.5:1];
subplotTick{9}  = [0:0.5:1];
subplotTick{10} = [0:0.5:1];
figContents(6).qPlotLabel = qPlotLabel;
figContents(6).qMeasuredLabel = qMeasuredLabel;
figContents(6).perryAbbr = perryAbbr;
figContents(6).subplotTitle = subplotTitle;
figContents(6).subplotAxisLabel = subplotAxisLabel;
figContents(6).subplotRange = subplotRange;
figContents(6).subplotTick = subplotTick;
clear qPlotLabel qMeasuredLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 7: Plantarflexors.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'med_gas_l', 'lat_gas_l'};
qPlotLabel{6}  = {'med_gas_r', 'lat_gas_r'};
qPlotLabel{7}  = {'soleus_l', 'tib_post_l'};
qPlotLabel{8}  = {'soleus_r', 'tib_post_r'};
qPlotLabel{9}  = {'flex_dig_l', 'flex_hal_l'};
qPlotLabel{10} = {'flex_dig_r', 'flex_hal_r'};
qMeasuredLabel{1}  = {};
qMeasuredLabel{2}  = {};
qMeasuredLabel{3}  = {};
qMeasuredLabel{4}  = {};
qMeasuredLabel{5}  = {'gas_l_emgRec', 'gas_l_emgAve', ...
                      'gas_l_emgSDp', 'gas_l_emgSDm'};
qMeasuredLabel{6}  = {'gas_r_emgRec', 'gas_l_emgAve', ...
                      'gas_r_emgSDp', 'gas_l_emgSDm'};
qMeasuredLabel{7}  = {'soleus_l_emgRec', 'soleus_l_emgAve', ...
					  'soleus_l_emgSDp', 'soleus_l_emgSDm'};
qMeasuredLabel{8}  = {'soleus_r_emgRec', 'soleus_r_emgAve', ...
					  'soleus_r_emgSDp', 'soleus_r_emgSDm'};
qMeasuredLabel{9}  = {};
qMeasuredLabel{10} = {};
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
subplotAxisLabel{5}  = 'muscle activation';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle activation';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle activation';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1];
subplotRange{6}  = [0 1];
subplotRange{7}  = [0 1];
subplotRange{8}  = [0 1];
subplotRange{9}  = [0 1];
subplotRange{10} = [0 1];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = [0:0.5:1];
subplotTick{6}  = [0:0.5:1];
subplotTick{7}  = [0:0.5:1];
subplotTick{8}  = [0:0.5:1];
subplotTick{9}  = [0:0.5:1];
subplotTick{10} = [0:0.5:1];
figContents(7).qPlotLabel = qPlotLabel;
figContents(7).qMeasuredLabel = qMeasuredLabel;
figContents(7).perryAbbr = perryAbbr;
figContents(7).subplotTitle = subplotTitle;
figContents(7).subplotAxisLabel = subplotAxisLabel;
figContents(7).subplotRange = subplotRange;
figContents(7).subplotTick = subplotTick;
clear qPlotLabel qMeasuredLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 8: Dorsiflexors, Evertors.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'tib_ant_l', 'ext_hal_l'};
qPlotLabel{6}  = {'tib_ant_r', 'ext_hal_r'};
qPlotLabel{7}  = {'ext_dig_l', 'per_tert_l'};
qPlotLabel{8}  = {'ext_dig_r', 'per_tert_r'};
qPlotLabel{9}  = {'per_long_l', 'per_brev_l'};
qPlotLabel{10} = {'per_long_r', 'per_brev_r'};
qMeasuredLabel{1}  = {};
qMeasuredLabel{2}  = {};
qMeasuredLabel{3}  = {};
qMeasuredLabel{4}  = {};
qMeasuredLabel{5}  = {'tib_ant_l_emgRec', 'tib_ant_l_emgAve', ...
                     'tib_ant_l_emgSDp', 'tib_ant_l_emgSDm'};
qMeasuredLabel{6}  = {'tib_ant_r_emgRec', 'tib_ant_r_emgAve', ...
                     'tib_ant_r_emgSDp', 'tib_ant_r_emgSDm'};
qMeasuredLabel{7}  = {};
qMeasuredLabel{8}  = {};
qMeasuredLabel{9}  = {};
qMeasuredLabel{10} = {};
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
subplotAxisLabel{5}  = 'muscle activation';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle activation';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle activation';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1];
subplotRange{6}  = [0 1];
subplotRange{7}  = [0 1];
subplotRange{8}  = [0 1];
subplotRange{9}  = [0 1];
subplotRange{10} = [0 1];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = [0:0.5:1];
subplotTick{6}  = [0:0.5:1];
subplotTick{7}  = [0:0.5:1];
subplotTick{8}  = [0:0.5:1];
subplotTick{9}  = [0:0.5:1];
subplotTick{10} = [0:0.5:1];
figContents(8).qPlotLabel = qPlotLabel;
figContents(8).qMeasuredLabel = qMeasuredLabel;
figContents(8).perryAbbr = perryAbbr;
figContents(8).subplotTitle = subplotTitle;
figContents(8).subplotAxisLabel = subplotAxisLabel;
figContents(8).subplotRange = subplotRange;
figContents(8).subplotTick = subplotTick;
clear qPlotLabel qMeasuredLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;


% Figure 9: Erector spinae, obliques.
qPlotLabel{1}  = {'ground_force_vy'};
qPlotLabel{2}  = {'ground_force_vy'};
qPlotLabel{3}  = {};
qPlotLabel{4}  = {};
qPlotLabel{5}  = {'ercspn_l'};
qPlotLabel{6}  = {'ercspn_r'};
qPlotLabel{7}  = {'intobl_l'};
qPlotLabel{8}  = {'intobl_r'};
qPlotLabel{9}  = {'extobl_l'};
qPlotLabel{10} = {'extobl_r'};
qMeasuredLabel{1}  = {};
qMeasuredLabel{2}  = {};
qMeasuredLabel{3}  = {};
qMeasuredLabel{4}  = {};
qMeasuredLabel{5}  = {};
qMeasuredLabel{6}  = {'ercspn_r_emgRec', 'ercspn_r_emgAve', ...
                      'ercspn_r_emgSDp', 'ercspn_r_emgSDm'};
qMeasuredLabel{7}  = {};
qMeasuredLabel{8}  = {};
qMeasuredLabel{9}  = {};
qMeasuredLabel{10} = {};
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
subplotAxisLabel{5}  = 'muscle activation';
subplotAxisLabel{6}  = {};
subplotAxisLabel{7}  = 'muscle activation';
subplotAxisLabel{8}  = {};
subplotAxisLabel{9}  = 'muscle activation';
subplotAxisLabel{10} = {};
subplotRange{1}  = {};
subplotRange{2}  = {};
subplotRange{3}  = {};
subplotRange{4}  = {};
subplotRange{5}  = [0 1];
subplotRange{6}  = [0 1];
subplotRange{7}  = [0 1];
subplotRange{8}  = [0 1];
subplotRange{9}  = [0 1];
subplotRange{10} = [0 1];
subplotTick{1}  = {};
subplotTick{2}  = {};
subplotTick{3}  = {};
subplotTick{4}  = {};
subplotTick{5}  = [0:0.5:1];
subplotTick{6}  = [0:0.5:1];
subplotTick{7}  = [0:0.5:1];
subplotTick{8}  = [0:0.5:1];
subplotTick{9}  = [0:0.5:1];
subplotTick{10} = [0:0.5:1];
figContents(9).qPlotLabel = qPlotLabel;
figContents(9).qMeasuredLabel = qMeasuredLabel;
figContents(9).perryAbbr = perryAbbr;
figContents(9).subplotTitle = subplotTitle;
figContents(9).subplotAxisLabel = subplotAxisLabel;
figContents(9).subplotRange = subplotRange;
figContents(9).subplotTick = subplotTick;
clear qPlotLabel qMeasuredLabel perryAbbr; 
clear subplotTitle subplotAxisLabel subplotRange subplotTick;

return;
