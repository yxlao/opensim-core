
import org.opensim.modeling.*

model = Model('double_pendulum_markers.osim');


%% Build the frame from the location of the markers
state = model.initSystem();
markernames = [{'hjc'} {'lfc'} {'mfc'}];

for i = 1 : length(markernames)
    eval([markernames{i} ' = [model.getMarkerSet().get(markernames{i}).get_location().get(0) model.getMarkerSet().get(markernames{i}).get_location().get(1) model.getMarkerSet().get(markernames{i}).get_location().get(2)];']);
end


% for i = 1 : length(markernames)
%     eval([markernames{i} ' = [model.getMarkerSet().get(markernames{i}).getLocationInGround(state).get(0) model.getMarkerSet().get(markernames{i}).getLocationInGround(state).get(1) model.getMarkerSet().get(markernames{i}).getLocationInGround(state).get(2)];']);
% end

% compute the unit vectors for the anatomical frame created by HJC, LFC,
% MFC
vec1  = lfc - mfc;
firstAxis = vec1./norm(vec1);
kjc = (lfc + mfc)/2;
vec3 = hjc-kjc;
thirdAxis = vec3./norm(vec3);
vec2 = cross(thirdAxis,firstAxis); 
secondAxis = vec2./norm(vec2);
thirdAxis = cross(firstAxis,secondAxis); 

% build the frame and set up the transform between the computed frame and
% the 


rotMat  = Mat33(firstAxis(1),firstAxis(2),firstAxis(3),secondAxis(1),secondAxis(2),secondAxis(3),thirdAxis(1),thirdAxis(2),thirdAxis(3))

r = Rotation()
r.setRotationFromApproximateMat33(rotMat)
t.R().setRotationFromApproximateMat33(rotMat)
t.setP(Vec3(0,0,0))

%% add an offset frame to the model 
rod1 = model.getBodySet().get(0);
crosstalkframe = PhysicalOffsetFrame();
crosstalkframe.setName('crosstalkframe')
crosstalkframe.setParentFrame(rod1)
crosstalkframe.setOffsetTransform(t)
model.addComponent(crosstalkframe)

%% add coordinate reporter
reportTimeInterval = 0.1;
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
    
    % todo: do below!!!!!!!! 
    rot = crosstalkframe.findTransformBetween(state, model.getBodySet().get(1));
    % get the rotationcomponent
    r = rot.R();
    % convert matrix to three rotational angles
    vec3_angles = r.convertThreeAxesRotationToThreeAngles(BodyOrSpaceType.BodyRotationSequence,...
                                          CoordinateAxis(0),...
                                          CoordinateAxis(1),...
                                          CoordinateAxis(2));
               
     angles(i+1,:) = [vec3_angles.get(0) vec3_angles.get(1) vec3_angles.get(2)];                                 
                                      
end




