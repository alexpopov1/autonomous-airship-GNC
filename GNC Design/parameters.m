% This function defines fixed numerical parameters to be used in the model
% All values stated in SI units

function  [k_f,k_t,L,d,mass,mass_add,g,Ixx,Iyy,Izz,Ixz,Buoy,CD] = parameters

% Gravitational constant
g = 9.81;

% Lengths associated with airship: L = radius, d = distance from CG to CB
lengths = {0.55,0.204};
[L,d] = lengths{:};



% Added mass term (X_udot)
mass_add = 0.4269;

% Buoyancy force
Buoy = 7.35;

% Mass of airship - 0.7417kg
mass = Buoy*1.08/9.81;


% Thrust and torque constants
constants = {1.915e-8,1.071e-10};
[k_f,k_t] = constants{:};


% Moments of inertia
inertia = {0.2,0.2,0.2,0.0022};
[Ixx,Iyy,Izz,Ixz] = inertia{:};

% Drag coefficient
CD = 0.47;
%CD = 0.43;


end