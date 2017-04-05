clear all; close all; clc;

import org.opensim.modeling.*

model = Model('double_pendulum_markers.osim');

%% Build a new offset frame from the location of the markers
% The markers are on the model, but we must first compute the location of
% the frame in ground, compute the transform difference between the frame
% in ground and the body we want to attach it to, the apply that transform
% to a frame that we place on the body of interest. 

% (i) compute a frame from the markers (ground)
state = model.initSystem();
markernames = [{'hjc'} {'lfc'} {'mfc'}];

for i = 1 : length(markernames)
    eval([markernames{i} ' = [model.getMarkerSet().get(markernames{i}).get_location().get(0) model.getMarkerSet().get(markernames{i}).get_location().get(1) model.getMarkerSet().get(markernames{i}).get_location().get(2)];']);
end

% compute the y,x,z unit vectors of the frame
kjc = (lfc + mfc)/2;
zAxis = (mfc - lfc)./norm((mfc - lfc));
yAxis = (hjc-kjc)./norm((hjc-kjc));
xAxis = cross(yAxis,zAxis);
xAxis = xAxis./norm(xAxis);
yAxis = cross(zAxis,xAxis);
yAxis = yAxis./norm(yAxis);

% build the rotation transform (y,x,z)
rotMat  = Mat33(xAxis(1),xAxis(2),xAxis(3),...
                yAxis(1),yAxis(2),yAxis(3),...
                zAxis(1),zAxis(2),zAxis(3));

t = Transform();            
t.R().setRotationFromApproximateMat33(rotMat)
t.setP(Vec3(0,0,0))
            
%% add a a frame to rod1 given the calculated transform
rod1 = model.getBodySet().get('rod1');
rod2 = model.getBodySet().get('rod2');
crosstalkframe = PhysicalOffsetFrame();
crosstalkframe.setName('crosstalkframe')
crosstalkframe.setParentFrame(rod1)
crosstalkframe.setOffsetTransform(t)
model.addComponent(crosstalkframe)
state = model.initSystem();


%% add coordinate reporter
reportTimeInterval = 0.01;
coordinateReporter = TableReporter();
coordinateReporter.set_report_time_interval(reportTimeInterval);
coordinateReporter.addToReport( ...
    model.getCoordinateSet().get(0).getOutput('value'), 'pin1_angle');
coordinateReporter.addToReport( ...
    model.getCoordinateSet().get(1).getOutput('value'), 'pin2_angle');
model.addComponent(coordinateReporter);

%%  Run a forward simulation using the Manager.
state = model.initSystem();
manager = Manager(model);
manager.setInitialTime(0);
manager.setFinalTime(2);
manager.integrate(state);


%% update coordinate on the model
coords = coordinateReporter.getTable();

for i = 0 : coords.getNumRows - 1
    
    updcoord = model.updCoordinateSet();
    
    updcoord.get(0).setValue(state,coords.getDependentColumnAtIndex(0).get(i));
    updcoord.get(1).setValue(state,coords.getDependentColumnAtIndex(1).get(i));
    
    model.realizePosition(state);
    
    % get the transform between the frames
    rot = rod2.findTransformBetween(state, crosstalkframe);

    % get the rotation component of the transform
    r = rot.R();
    % convert to axes to angles
    
    r.convertRotationToBodyFixedXYZ
    
    
    vec3_angles = r.convertThreeAxesRotationToThreeAngles(BodyOrSpaceType.BodyRotationSequence,...
                                          CoordinateAxis(0),...
                                          CoordinateAxis(1),...
                                          CoordinateAxis(2));
               
     angles(i+1,:) = [vec3_angles.get(0) vec3_angles.get(1) vec3_angles.get(2)];                                 
                                      
end

%% plot the results
model_coords = osimTableToStruct(coords);

hold on

plot(rad2deg(angles))
plot(rad2deg(model_coords.pin2_angle), 'r*--' )




















