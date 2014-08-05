%module(directors="1") common
%module common
#pragma SWIG nowarn=822,451,503,516,325

/** Pass Doxygen documentation to python wrapper */
%feature("autodoc", "3");

/*
For consistency with the rest of the API, we use camel-case for variable names.
This breaks Python PEP 8 convention, but allows us to be consistent within our
own project.
*/

%{
#define SWIG_FILE_WITH_INIT

#include <OpenSim/version.h>
#include <SimTKsimbody.h>
#include <OpenSim/Common/osimCommonDLL.h>
#include <OpenSim/Common/Exception.h>
#include <OpenSim/Common/Array.h>
#include <OpenSim/Common/ArrayPtrs.h>
#include <OpenSim/Common/AbstractProperty.h>
#include <OpenSim/Common/Component.h>
#include <OpenSim/Common/Property.h>
#include <OpenSim/Common/PropertyGroup.h>
#include <OpenSim/Common/Object.h>
#include <OpenSim/Common/ObjectGroup.h>
#include <OpenSim/Common/Geometry.h>
#include <OpenSim/Common/DisplayGeometry.h>
#include <OpenSim/Common/Set.h>
#include <OpenSim/Common/GeometrySet.h>
#include <OpenSim/Common/VisibleObject.h>
#include <OpenSim/Common/StateVector.h>
#include <OpenSim/Common/StorageInterface.h>
#include <OpenSim/Common/Storage.h>
#include <OpenSim/Common/Scale.h>
#include <OpenSim/Common/ScaleSet.h>
#include <OpenSim/Common/Units.h>
#include <OpenSim/Common/IO.h>
#include <OpenSim/Common/Function.h>
#include <OpenSim/Common/Constant.h>
#include <OpenSim/Common/SimmSpline.h>
#include <OpenSim/Common/StepFunction.h>
#include <OpenSim/Common/PiecewiseConstantFunction.h>
#include <OpenSim/Common/LinearFunction.h>
#include <OpenSim/Common/PiecewiseLinearFunction.h>
#include <OpenSim/Common/MultiplierFunction.h>
#include <OpenSim/Common/GCVSpline.h>
#include <OpenSim/Common/Sine.h>
#include <OpenSim/Common/PolynomialFunction.h>
#include <OpenSim/Common/SmoothSegmentedFunctionFactory.h>
#include <OpenSim/Common/SmoothSegmentedFunction.h>
#include <OpenSim/Common/XYFunctionInterface.h>
#include <OpenSim/Common/FunctionSet.h>

#include <OpenSim/Common/LoadOpenSimLibrary.h>
#include <OpenSim/Common/MarkerData.h>

using namespace OpenSim;
using namespace SimTK;

%}

%feature("director") SimTK::DecorativeGeometryImplementation;

%rename(OpenSimObject) OpenSim::Object;
%rename(OpenSimException) OpenSim::Exception;

%rename(printToXML) OpenSim::Object::print(const std::string&);
%rename(printToXML) OpenSim::XMLDocument::print(const std::string&);
%rename(printToXML) OpenSim::XMLDocument::print();
%rename(printToFile) OpenSim::Storage::print;

/* To silence warning 314. */
%rename(NoType) OpenSim::Geometry::None;
%rename(NoPreference) OpenSim::DisplayGeometry::None;

/* If needed %extend will be used, these operators are not supported.*/
%ignore *::operator[];
%ignore *::operator=;

/* This file is for creation/handling of arrays */
%include "std_carray.i";

/* This interface file is for better handling of pointers and references */
%include "typemaps.i"
%include "std_string.i"

// Memory management
// =================
/*
This facility will help us avoid segfaults that occur when two different
objects believe they own a pointer, and so they both try to delete it. We can
instead notify the object that something else has adopted it, and will take
care of deleting it.
*/
%extend OpenSim::Object {
%pythoncode %{
    def _markAdopted(self):
        if self.this and self.thisown:
            self.thisown = False
%}
};

%extend OpenSim::Array<double> {
	void appendVec3(SimTK::Vec3 vec3) {
		for(int i=0; i<3; i++)
			self->append(vec3[i]);
	}
	void appendVector(SimTK::Vector vec) {
		for(int i=0; i<vec.size(); i++)
			self->append(vec[i]);
	}

	SimTK::Vec3 getAsVec3() {
		return SimTK::Vec3::getAs(self->get());
	};
	
	static SimTK::Vec3 createVec3(double e1, double e2, double e3) {
		Array<double>* arr = new Array<double>(e1, 3);
		arr->set(1, e2);
		arr->set(2, e3);
		return SimTK::Vec3::getAs(arr->get());
	};
  
   static SimTK::Vec3 createVec3(double e1) {
		Array<double>* arr = new Array<double>(e1, 3);
		return SimTK::Vec3::getAs(arr->get());
  };
   
   static SimTK::Vec3  createVec3(double es[3]) {
		Array<double>* arr = new Array<double>(es[0], 3);
		arr->set(1, es[1]);
		arr->set(2, es[2]);
		return SimTK::Vec3::getAs(arr->get());
  };

   SimTK::Vector_<double>  getAsVector() {
		return SimTK::Vector(self->getSize(), &(*self)[0]);
  };

   void populateFromVector(SimTK::Vector_<double> aVector) {
		int sz = aVector.size();
		for(int i=0; i<sz; ++i)
			self->append(aVector[i]);
   }

   static  OpenSim::Array<double> getValuesFromVec3(SimTK::Vec3 vec3) {
		OpenSim::Array<double> arr(0, 3);
		for (int i=0; i<3; i++) arr[i] = vec3[i];
		return arr;
  };
  
  std::string toString() const {
		std::stringstream stream;
		for (int i=0; i< self->getSize(); i++)
			stream <<  self->get(i) << " ";
		return stream.str(); 
  }

  void setFromPyArray(double* dValues, int size) {
		self->setSize(size);
		for(int i=0; i< size; ++i)
		    self->set(i, dValues[i]);
};
};

/* rest of header files to be wrapped */
%include <OpenSim/version.h>
%include <SimTKcommon.h>

%include <SimTKcommon/Constants.h>
%include <SWIGSimTK/Vec.h>
%include <SimTKcommon/SmallMatrix.h>
// Vec3
namespace SimTK {
%template(Vec3) Vec<3>;
}
// Mat33
%include <SWIGSimTK/Mat.h>
namespace SimTK {
%template(Mat33) Mat<3, 3>;
}
// Vector and Matrix
%include <SWIGSimTK/BigMatrix.h>
namespace SimTK {
%template(MatrixBaseDouble) SimTK::MatrixBase<double>;
%template(VectorBaseDouble) SimTK::VectorBase<double>;
%template(Vector) SimTK::Vector_<double>;
%template(Matrix) SimTK::Matrix_<double>;
}

%include <SWIGSimTK/SpatialAlgebra.h>
namespace SimTK {
%template(SpatialVec) Vec<2,   Vec3>;
%template(VectorOfSpatialVec) Vector_<SpatialVec>;
%template(VectorOfVec3) Vector_<Vec3>;
}
// Transform
%include <SWIGSimTK/Transform.h>
namespace SimTK {
%template(Transform) SimTK::Transform_<double>;
}

%include <SWIGSimTK/MassProperties.h>
namespace SimTK {
%template(Inertia) SimTK::Inertia_<double>;
%template(MassProperties) SimTK::MassProperties_<double>;
}
%include <SWIGSimTK/common.h>
%include <SWIGSimTK/Array.h>

typedef int MobilizedBodyIndex;
typedef int SubsystemIndex;
typedef int SystemQIndex;
typedef int SystemQErrIndex;
typedef int SystemZIndex;
typedef int SystemYIndex;
typedef int SystemYErrIndex;
typedef int SystemUIndex;
typedef int SystemUErrIndex;
typedef int SystemUDotErrIndex;

namespace SimTK {
%template(ArrayIndexUnsigned) ArrayIndexTraits<unsigned>; 
%template(ArrayIndexInt) ArrayIndexTraits<int>; 
}

%include <SWIGSimTK/DecorativeGeometry.h>

namespace SimTK {
%template(ArrayDecorativeGeometry) SimTK::Array_<SimTK::DecorativeGeometry>;
}

// State & Stage
%include <SWIGSimTK/Stage.h>
%include <SWIGSimTK/State.h>

// osimCommon Library
%include <OpenSim/Common/osimCommonDLL.h>
%include <OpenSim/Common/Exception.h>
%include <OpenSim/Common/Array.h>
%include <OpenSim/Common/ArrayPtrs.h>
%include <OpenSim/Common/AbstractProperty.h>
%include <OpenSim/Common/Property.h>
%include <OpenSim/Common/PropertyGroup.h>
%template(ArrayPtrsPropertyGroup) OpenSim::ArrayPtrs<OpenSim::PropertyGroup>;
%include <OpenSim/Common/Object.h>
%include <OpenSim/Common/ObjectGroup.h>
%include <OpenSim/Common/Geometry.h>
%include <OpenSim/Common/DisplayGeometry.h>
%include <OpenSim/Common/Set.h>
%template(SetGeometry) OpenSim::Set<OpenSim::DisplayGeometry>;
%include <OpenSim/Common/GeometrySet.h>
%include <OpenSim/Common/VisibleObject.h>
%include <OpenSim/Common/StateVector.h>
%include <OpenSim/Common/StorageInterface.h>
%include <OpenSim/Common/Storage.h>
%include <OpenSim/Common/Units.h>
%include <OpenSim/Common/IO.h>
%include <OpenSim/Common/Function.h>

%template(SetFunctions) OpenSim::Set<OpenSim::Function>;
%include <OpenSim/Common/FunctionSet.h>

%include <OpenSim/Common/Constant.h>
%include <OpenSim/Common/SimmSpline.h>
%include <OpenSim/Common/StepFunction.h>
%include <OpenSim/Common/PiecewiseConstantFunction.h>
%include <OpenSim/Common/LinearFunction.h>
%include <OpenSim/Common/PiecewiseLinearFunction.h>
%include <OpenSim/Common/MultiplierFunction.h>
%include <OpenSim/Common/GCVSpline.h>
%include <OpenSim/Common/Sine.h>
%include <OpenSim/Common/PolynomialFunction.h>
%include <OpenSim/Common/SmoothSegmentedFunctionFactory.h>
%include <OpenSim/Common/SmoothSegmentedFunction.h>

%include <OpenSim/Common/XYFunctionInterface.h>
%template(ArrayXYPoint) OpenSim::Array<XYPoint>;
%template(ArrayBool) OpenSim::Array<bool>;
%template(ArrayDouble) OpenSim::Array<double>;
%template(ArrayInt) OpenSim::Array<int>;
%template(ArrayStr) OpenSim::Array<std::string>;
%template(ArrayObjPtr) OpenSim::Array<OpenSim::Object*>;
%template(ArrayPtrsObj) OpenSim::ArrayPtrs<OpenSim::Object>;
%include <OpenSim/Common/ComponentOutput.h>
%include <OpenSim/Common/ComponentConnector.h>
%include <OpenSim/Common/Component.h>
%include <OpenSim/Common/Scale.h>
%template(SetScales) OpenSim::Set<OpenSim::Scale>;
%include <OpenSim/Common/ScaleSet.h>
%include <OpenSim/Common/MarkerData.h>

// Memory management
// =================

/*
A macro to facilitate adding adoptAndAppend methods to these sets. For NAME ==
Geometry, the macro expands to:

%extend OpenSim::GeometrySet {
%pythoncode %{
    def adoptAndAppend(self, aGeometry):
        aGeometry._markAdopted()
        return super(GeometrySet, self).adoptAndAppend(aGeometry)
%}
};

note: ## is a "glue" operator: `a ## b` --> `ab`.
*/
%define SET_ADOPT_HELPER(NAME)
%extend OpenSim:: ## NAME ## Set {
%pythoncode %{
    def adoptAndAppend(self, a ## NAME):
        a ## NAME._markAdopted()
        return super(NAME ## Set, self).adoptAndAppend(a ## NAME)
%}
};
%enddef

SET_ADOPT_HELPER(Geometry);
SET_ADOPT_HELPER(Scale);

// These didn't work with the macro for some reason. I got complaints about
// multiple definitions of, e.g.,  Function in the target language.
%extend OpenSim::FunctionSet {
%pythoncode %{
    def adoptAndAppend(self, aFunction):
        aFunction._markAdopted()
        return super(FunctionSet, self).adoptAndAppend(aFunction)
%}
};
