%% Generate the function
clc;
clear;
close all
addpath generated_function\;

syms x y;
f_peak(x, y) = 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ... 
   - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ... 
   - 1/3*exp(-(x+1).^2 - y.^2);
g_peak = gradient(f_peak);

f_square = x.^2 + y.^2;
g_square = gradient(f_square);

matlabFunction(simplify(f_peak), 'file', 'generated_function\f_peak', 'vars', {x, y});
matlabFunction(simplify(g_peak), 'file', 'generated_function\g_peak', 'vars', {x, y});
matlabFunction(simplify(f_square), 'file', 'generated_function\f_square', 'vars', {x, y});
matlabFunction(simplify(g_square), 'file', 'generated_function\g_square', 'vars', {x, y});
disp('Done.');