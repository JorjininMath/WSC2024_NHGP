function branin = Branin(Xdesign)
%  Brainin-Hoo 2D example
%------------------------------------------------------------------------
%  Created on 07/25/2021, last update on 07/25/2021
%------------------------------------------------------------------------


% Note: R = normrnd(mu,sigma) generates random numbers from the normal distribution with mean parameter mu and standard deviation parameter sigma.
 
 x1 = 15 * Xdesign(:,1) - 5;
 x2 = 15 * Xdesign(:,2);
 % branin = sin(9 * x1.^2) + sin(9 * x2.^2);
 branin = (x2 - 5.*x1.^2/(4*pi^2) + 5.*x1/pi - 6).^2 + 10.*(1 - 1/(8*pi)).*cos(x1) + 10;