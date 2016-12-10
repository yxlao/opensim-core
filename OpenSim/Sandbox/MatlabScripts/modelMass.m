function modelMass(path2model)


import org.opensim.modeling.*

% if path2Model

model = Model('scaled_model.osim');

totalMass = 0;
for i = 0 : model.getBodySet().getSize() - 1 
    disp([char(model.getBodySet().get(i).getName()) ' = ' num2str(model.getBodySet().get(i).getMass())])
end

mass = model.getTotalMass(model.initSystem);

disp(['Total Mass = ' num2str(mass)])
