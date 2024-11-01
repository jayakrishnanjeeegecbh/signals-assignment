% Clear workspace and command window
clear; clc;

% Define parameters
T = 2 * pi;                % Period
t = linspace(0, T, 1000); % Time vector
x = zeros(size(t));        % Initialize triangular wave

% Define the triangular wave
for i = 1:length(t)
    if t(i) < pi
        x(i) = t(i) / pi; % First segment
    else
        x(i) = -t(i) / pi + 2; % Second segment
    end
end

% Number of terms for Fourier series approximations
N_terms = [5, 10, 20];
approx = zeros(length(t), length(N_terms)); % Initialize approximation matrix

% Calculate Fourier series approximation
for idx = 1:length(N_terms)
    N = N_terms(idx); % Get current N
    approx(:, idx) = 0; % Reset approximation for current N
    for n = 1:N
        bn = (4 * (-1)^(n + 1)) / (n^2); % Fourier coefficient for sine terms
        approx(:, idx) = approx(:, idx) + bn * sin(n * t(:)); % Use t(:) to ensure a column vector
    end
end

% Plotting
figure;
hold on;
plot(t, x, 'k', 'LineWidth', 2); % Original triangular wave
colors = ['r', 'g', 'b']; % Colors for different N
for idx = 1:length(N_terms)
    plot(t, approx(:, idx) + 3/8, colors(idx), 'LineWidth', 1.5); % Plot approximations, add a0
end
hold off;

% Customize the plot
legend('Triangular Wave', 'N=5', 'N=10', 'N=20');
title('Fourier Series Approximation of Triangular Wave');
xlabel('Time (t)');
ylabel('x(t)');
grid on;
axis([0 T 0 2]); % Set axis limits
