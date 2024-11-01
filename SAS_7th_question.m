% Clear workspace and command window
clear; clc;

% Define parameters
T = 2 * pi;                % Period
t = linspace(0, T, 1000); % Time vector
x = zeros(size(t));        % Initialize square wave

% Define the square wave
x(t < pi) = 1;             % For 0 <= t < π
x(t >= pi) = -1;          % For π <= t < 2π

% Number of terms for Fourier series approximations
N_terms = [5, 10, 20];
approx = zeros(length(t), length(N_terms)); % Initialize approximation matrix

% Calculate Fourier series approximation
for idx = 1:length(N_terms)
    N = N_terms(idx); % Get current N
    approx(:, idx) = zeros(size(t)); % Reset approximation for current N
    for n = 1:2:N % Only odd n
        bn = 2 / (n * pi); % Fourier coefficient
        approx(:, idx) = approx(:, idx) + bn * sin(n * t(:)); % Ensure t is a column vector
    end
end

% Plotting
figure;
hold on;
plot(t, x, 'k', 'LineWidth', 2); % Original square wave
colors = ['r', 'g', 'b']; % Colors for different N
for idx = 1:length(N_terms)
    plot(t, approx(:, idx), colors(idx), 'LineWidth', 1.5); % Plot approximations
end
hold off;

% Customize the plot
legend('Square Wave', 'N=5', 'N=10', 'N=20');
title('Fourier Series Approximation of Square Wave');
xlabel('Time (t)');
ylabel('x(t)');
grid on;
axis([0 T -1.5 1.5]); % Set axis limits
