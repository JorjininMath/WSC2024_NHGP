function sin2D = Sin2D(Xdesign)
%  Brainin-Hoo 2D example
%------------------------------------------------------------------------
%  Created on 07/25/2021, last update on 07/25/2021
%------------------------------------------------------------------------


% Note: R = normrnd(mu,sigma) generates random numbers from the normal distribution with mean parameter mu and standard deviation parameter sigma.
 
 x1 = 2 * Xdesign(:,1) - 1;
 x2 = 2 * Xdesign(:,2) - 1;

 sin2D = sin(9 * x1.^2) + sin(9 * x2.^2);