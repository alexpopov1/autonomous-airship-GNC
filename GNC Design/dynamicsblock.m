% This function applies the nonlinear dynamics equations to obtain the
% time-derivatives of the states.
%
% This does NOT use symbolic functions which should improve runtimes or any
% issues with syms in Simulink

function states_dot = dynamicsblock(input,states)

% Load function handle for the nonlinear dynamics
functions = load('nonlinear_functions');
functions = functions.functions;

% Set numerical inputs of parameters
[k_f,k_t,L,d,mass,mass_add,g,Ixx,Iyy,Izz,Ixz,Buoy,CD] = parameters;

% Define required elements of state vector
u = states(1); v = states(2); w = states(3); p = states(4); q = states(5); 
r = states(6); phi = states(7); theta = states(8); psi = states(9);  

% Return numerical values for the 12 state derivatives
states_dot = functions(Buoy,CD,Ixx,Ixz,Iyy,Izz,L,d,g, input(1),input(2),input(3),input(4),input(5),input(6),k_f,k_t,mass,mass_add,p,phi,psi,q,r,theta,u,v,w);

end
