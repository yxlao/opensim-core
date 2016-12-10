

import org.opensim.modeling.*

modelpath = 'gait2354_simbody.osim'
markersetpath = 'gait2354_Scale_MarkerSet.xml'
setupFilePath = 'subject01_Setup_Scale.xml';

model = Model( modelpath );


% add markerset to the model.
markerset = MarkerSet(model, markersetpath);
for i = 0 : markerset.getSize() - 1
    model.addMarker( markerset.get(i) )
end

% make a default scale tool
scaletool = ScaleTool(setupFilePath);

%scaletool.setSubjectAge(20)
%scaletool.setSubjectHeight(120)
%scaletool.setSubjectMass(72)

%% get an instance of the model scaler
scaler = ModelScaler();

% out file name
scaler.setOutputModelFileName('scaled_gaitModel.osim')

% set apply to true
scaler.setApply(true)

% set the scaling order
scalingtypes = ArrayStr();
scalingtypes.set(0,'measurements')
scalingtypes.set(1,'manualScale')
scaler.setScalingOrder(scalingtypes)


%% list of measurements to create MeasurementSet() 
measurements = struct();

measurements.torso.markerpair = [{'V.Sacral'} {'Top.Head'}];
measurements.pelvis.markerpair = [{'R.ASIS'} {'L.ASIS'}];
measurements.rthigh.markerpair = [{'R.ASIS'} {'R.Knee.Lat'}];
measurements.lthigh.markerpair = [{'L.ASIS'} {'L.Knee.Lat'}];
measurements.rshank.markerpair = [{'R.Knee.Lat'} {'R.Ankle.Lat'}];
measurements.lshank.markerpair = [{'L.Knee.Lat'} {'L.Ankle.Lat'}];
measurements.rfoot.markerpair = [{'R.Heel'} {'R.Toe.Tip'}];
measurements.lfoot.markerpair = [{'L.Heel'} {'L.Toe.Tip'}];

measurements.torso.bodies = [{'torso'}];
measurements.pelvis.bodies = [{'pelvis'}];
measurements.rthigh.bodies = [{'femur_r'} {'patella_r'}];
measurements.lthigh.bodies = [{'femur_l'} {'patella_l'}];
measurements.rshank.bodies = [{'tibia_r'} {'talus_r'}];
measurements.lshank.bodies = [{'tibia_r'} {'talus_r'}];
measurements.rfoot.bodies = [{'calcn_r'} {'toes_r'}];
measurements.lfoot.bodies = [{'calcn_l'} {'toes_l'}];

measurementlist = fieldnames(measurements);


%%
for i = 1 : length(measurementlist)

    % make a measurement object
    m = Measurement();

    mps = m.getMarkerPairSet();
    bss = m.getBodyScaleSet();
    
    % marker pairs
    mrk1 = measurements.(measurementlist{1}).markerpair(1);
    mrk2 = measurements.(measurementlist{1}).markerpair(2);
    mp = MarkerPair(mrk1,mrk2);
    mps.cloneAndAppend(mp)


    % Body scales
    for u = 1 : length(measurements.(measurementlist{1}).bodies)
            
        body = measurements.(measurementlist{1}).bodies(u);

        bs = BodyScale();
        bs.setName(body);

        as = ArrayStr();
        as.set(0, 'X')
        as.set(1, 'Y')
        as.set(2, 'Z')
        bs.setAxisNames(as)

        bss.cloneAndAppend(bs);
    end
    
    scaler.addMeasurement(m);
    
    clear m
end
    
scaler.setOutputModelFileName('scaled_model.osim')

% add measurement to the scaler
scaler.processModel(model,'',72)

%% Register markers on the model
registerer = MarkerPlacer();

% get a reference to the ik task set and make a task for each marker to track.
iktasks = registerer.getIKTaskSet();

for i = 0 : markerset.getSize() - 1
    name = char(markerset.get(i).getName());
    ikt = IKMarkerTask();
    ikt.setName(name);
    ikt.setWeight(1);
    iktasks.cloneAndAppend(ikt);
end

registerer.setOutputModelFileName('registered_model.osim')





