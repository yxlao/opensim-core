/* -------------------------------------------------------------------------- *
 *                      OpenSim:  PointToPointSpring.cpp                      *
 * -------------------------------------------------------------------------- *
 * The OpenSim API is a toolkit for musculoskeletal modeling and simulation.  *
 * See http://opensim.stanford.edu and the NOTICE file for more information.  *
 * OpenSim is developed at Stanford University and supported by the US        *
 * National Institutes of Health (U54 GM072970, R24 HD065690) and by DARPA    *
 * through the Warrior Web program.                                           *
 *                                                                            *
 * Copyright (c) 2005-2012 Stanford University and the Authors                *
 * Author(s): Ajay Seth, James Dunne                                          *
 *                                                                            *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may    *
 * not use this file except in compliance with the License. You may obtain a  *
 * copy of the License at http://www.apache.org/licenses/LICENSE-2.0.         *
 *                                                                            *
 * Unless required by applicable law or agreed to in writing, software        *
 * distributed under the License is distributed on an "AS IS" BASIS,          *
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   *
 * See the License for the specific language governing permissions and        *
 * limitations under the License.                                             *
 * -------------------------------------------------------------------------- */

//=============================================================================
// INCLUDES
//=============================================================================
#include "PointToPointSpring.h"
#include <OpenSim/Simulation/Model/Model.h>
#include <OpenSim/Simulation/Model/PhysicalFrame.h>

using namespace OpenSim;
using namespace std;

//=============================================================================
// CONSTRUCTOR(S) AND DESTRUCTOR
//=============================================================================
//_____________________________________________________________________________
//Default constructor.
PointToPointSpring::PointToPointSpring()
{
    setNull();
    constructInfrastructure();
}
//_____________________________________________________________________________
// Convenience constructor for API users.
PointToPointSpring::
PointToPointSpring(const PhysicalFrame& body1, const SimTK::Vec3& point1,
                   const PhysicalFrame& body2, const SimTK::Vec3& point2,
                   double stiffness, double restlength )
{
    setNull();
    constructInfrastructure();
    
    auto s1 = new Station(body1, point1);
    auto s2 = new Station(body2, point2);
    
    s1->setName("point1");
    s2->setName("point2");
    
    addComponent(s1);
    addComponent(s2);
    
    setPoint1(*s1);
    setPoint2(*s2);
    
    setStiffness(stiffness);
    setRestlength(restlength);
}

void PointToPointSpring::constructConnectors()
{
    constructConnector<Station>("point1");
    constructConnector<Station>("point2");
}

//=============================================================================
// CONSTRUCTION
//=============================================================================
//_____________________________________________________________________________
/**
 * Set the data members of this force to their null values.
 */
void PointToPointSpring::setNull()
{
    setAuthors("Ajay Seth");
}


//_____________________________________________________________________________
/**
 * Construct properties and initialize to their default values.
 */
void PointToPointSpring::constructProperties()
{
    constructProperty_stiffness(1.0);
    constructProperty_rest_length(0.0);
}

void PointToPointSpring::setPoint1(const Station& p1)
{
    updConnector<Station>("point1").connect(p1);
}

void PointToPointSpring::setPoint2(const Station& p2)
{
    updConnector<Station>("point2").connect(p2);
}

const Station& PointToPointSpring::getPoint1() const
{
    return getConnector<Station>("point1").getConnectee();
}

const Station& PointToPointSpring::getPoint2() const
{
    return getConnector<Station>("point2").getConnectee();
}

// GET THE POINT AND RETURN THE PHYSICAL FRAME THAT THE POINT IS ON
const PhysicalFrame& PointToPointSpring::getBody1() const
{
    return getConnectee<Station>("point1").getParentFrame();
}
// GET THE POINT AND RETURN THE PHYSICAL FRAME THAT THE POINT IS ON
const PhysicalFrame& PointToPointSpring::getBody2() const
{
    return getConnectee<Station>("body2").getParentFrame();
}

//=============================================================================
// Create the underlying system component(s)
//=============================================================================
void PointToPointSpring::
extendAddToSystemAfterSubcomponents(SimTK::MultibodySystem& system) const
{
    Super::extendAddToSystemAfterSubcomponents(system);
    
    const PhysicalFrame& body1 = getBody1();
    const PhysicalFrame& body2 = getBody2();
    
    // Get underlying mobilized bodies
    const SimTK::MobilizedBody& b1 = body1.getMobilizedBody();
    const SimTK::MobilizedBody& b2 = body2.getMobilizedBody();
    
    // Now create a Simbody Force::TwoPointLinearSpring
    SimTK::Force::TwoPointLinearSpring simtkSpring
    (_model->updForceSubsystem(), b1, getPoint1().get_location(), b2, getPoint2().get_location(),
     getStiffness(), getRestlength());
    
    // Beyond the const Component get the index so we can access the
    // SimTK::Force later.
    PointToPointSpring* mutableThis = const_cast<PointToPointSpring *>(this);
    mutableThis->_index = simtkSpring.getForceIndex();
}



//=============================================================================
// Reporting
//=============================================================================
// Provide names of the quantities (column labels) of the force value(s)
// reported.
OpenSim::Array<std::string> PointToPointSpring::getRecordLabels() const
{
    const string& body1Name = getBody1().getName();
    const string& body2Name = getBody2().getName();
    
    OpenSim::Array<std::string> labels("");
    labels.append(getName()+"."+body1Name+".force.X");
    labels.append(getName()+"."+body1Name+".force.Y");
    labels.append(getName()+"."+body1Name+".force.Z");
    labels.append(getName()+"."+body1Name+".point.X");
    labels.append(getName()+"."+body1Name+".point.Y");
    labels.append(getName()+"."+body1Name+".point.Z");
    labels.append(getName()+"."+body2Name+".force.X");
    labels.append(getName()+"."+body2Name+".force.Y");
    labels.append(getName()+"."+body2Name+".force.Z");
    labels.append(getName()+"."+body2Name+".point.X");
    labels.append(getName()+"."+body2Name+".point.Y");
    labels.append(getName()+"."+body2Name+".point.Z");
    
    return labels;
}

// Provide the value(s) to be reported that correspond to the labels.
OpenSim::Array<double> PointToPointSpring::
getRecordValues(const SimTK::State& state) const
{
    OpenSim::Array<double> values(1);
    
    const SimTK::Force::TwoPointLinearSpring&
    simtkSpring = SimTK::Force::TwoPointLinearSpring::downcast
    (_model->getForceSubsystem().getForce(_index));
    
    SimTK::Vector_<SimTK::SpatialVec> bodyForces(0);
    SimTK::Vector_<SimTK::Vec3> particleForces(0);
    SimTK::Vector mobilityForces(0);
    
    const PhysicalFrame& body1 = getBody1();
    const PhysicalFrame& body2 = getBody2();
    
    //get the net force added to the system contributed by the Spring
    simtkSpring.calcForceContribution(state, bodyForces, particleForces,
                                      mobilityForces);
    SimTK::Vec3 forces = bodyForces(body1.getMobilizedBodyIndex())[1];
    values.append(3, &forces[0]);
    
    forces = bodyForces(body2.getMobilizedBodyIndex())[1];
    values.append(3, &forces[0]);
    
    
    SimTK::Vec3 gpoint1 = getPoint1().getLocationInGround(state);
    SimTK::Vec3 gpoint2 = getPoint2().getLocationInGround(state);
    
    values.append(3, &gpoint1[0]);
    values.append(3, &gpoint2[0]);
    
    return values;
}

SimTK::Vec3 PointToPointSpring::
getVector(const SimTK::State& state) const
{
    // Get the vector between point 1 and 2
    SimTK::Vec3 gpoint1 = getPoint1().getLocationInGround(state);
    SimTK::Vec3 gpoint2 = getPoint2().getLocationInGround(state);
    return gpoint2 - gpoint1;
}

// compute the tension in the spring
double PointToPointSpring::
getTension(const SimTK::State& state) const
{
    
    SimTK::Vec3 r = getVector(state);
    const double length = r.norm();
    const double& restingLength = getRestlength();
    double stretch = length > restingLength ? (length-restingLength) : 0.0;
    
    return getStiffness() * stretch;
}

// compute the force on point 2
SimTK::Vec3 PointToPointSpring::
getForceOnPoint2(const SimTK::State& state) const
{
    
    double t = getTension(state);
    SimTK::Vec3 r = getVector(state);
    
    const SimTK::UnitVec3 direction(r); // normalize
    
    //force on point2
    return -t*direction;
}

// compute the force on point 1
SimTK::Vec3 PointToPointSpring::
getForceOnPoint1(const SimTK::State& state) const
{
    
    double t = getTension(state);
    SimTK::Vec3 r = getVector(state);
    
    const SimTK::UnitVec3 direction(r); // normalize
    
    //force on point1
    return t*direction;
}





