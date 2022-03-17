% This function performs the operations of Feedback 
% Linearisation Law block in the Simulink model 'FBL_loop'

% This does NOT use symbolic functions which should improve runtimes or any
% issues with syms in Simulink

% Inputs:
%   transform_input: This is the transformed input v, whose value has been
%                    defined by the main controller.It is a 6x1 vector.
%   states:          This is a 12x1 vector of numerical values for all 12 
%                    states,obtained from the output of the FBL loop

% Output:
%   real_input: The 'true' input of the system, defined as u = rho, where
%               rho is a 6x1 vector of with terms of form 
%               omega_i^2*sin(alpha_i) and omega_i^2*cos(alpha_i)

function real_input = FBLblock(transform_input,states)
% Import function handles for ALPHA and BETA matrices
load('feedback_linearisation')

% Set numerical inputs of parameters
[k_f,k_t,L,d,mass,mass_add,g,Ixx,Iyy,Izz,Ixz,Buoy,CD] = parameters;

% Define required elements of state vector
u = states(1); v = states(2); w = states(3); p = states(4); q = states(5); 
r = states(6); phi = states(7); theta = states(8); psi = states(9);  

% Apply numerical inputs to symbolic functions to obtain ALPHA and BETA
ALPHA = alpha_function(Buoy,CD,Ixx,Ixz,Iyy,Izz,g,mass,mass_add,p,phi,psi,q,r,theta,u,v,w);
BETA = beta_function(Ixx,Ixz,Iyy,Izz,L,d,k_f,k_t,mass,mass_add,phi,psi,theta);

% Real input (u = rho)
real_input = inv(BETA)*(transform_input - ALPHA);
