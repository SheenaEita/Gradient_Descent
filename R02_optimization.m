%% Illustration
clc;
clear;
close all;

addpath generated_function\;

%% Set up
%initial point = (8, 6.5)
x_start = 8;
y_start = 6;
iteration = 100;

data_recorder = NaN(iteration, 4);

% Choose your goal function and the relative gradient function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % f = @(x, y)f_peak(x, y);
        % g = @(x, y)g_peak(x, y);
        f = @(x, y)f_square(x, y);
        g = @(x, y)g_square(x, y);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Optimization
for i = 1:iteration
    org_value = f(x_start, y_start);
    grad_value = g(x_start, y_start);
    
    learning_rate_x = grad_value(1)*0.01;
    learning_rate_y = grad_value(2)*0.01;
    
    data_recorder(i, 1) = i;
    data_recorder(i, 2) = org_value;
    data_recorder(i, 3) = x_start;
    data_recorder(i, 4) = y_start;

    x_start = x_start - learning_rate_x;
    y_start = y_start - learning_rate_y;
end

figure('Name', 'value_iteration')
plot(data_recorder(:, 1), data_recorder(:, 2));

figure('Name', '3Dplot')
plot_x = -10:0.1:10;
plot_y = plot_x';
meshz(plot_x, plot_y, f(plot_x, plot_y));
hold on;
plot3(data_recorder(:, 3), data_recorder(:, 4), data_recorder(:, 2), '.', 'MarkerSize', 10);