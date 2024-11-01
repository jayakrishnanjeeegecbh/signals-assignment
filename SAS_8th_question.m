% Clear workspace and command window
clear; clc;

% Define parameters
T = 2 * pi;                % Period
t = linspace(-pi, pi, 1000); % Time vector
x = t / pi;                % Original sawtooth wave

% Number of terms for Fourier series approximations
N_terms = [5, 10, 20];
approx = zeros(length(t), length(N_terms)); % Initialize approximation matrix

% Calculate Fourier series approximation
for idx = 1:length(N_terms)
    N = N_terms(idx); % Get current N
    approx(:, idx) = 0; % Reset approximation for current N
    for n = 1:N
        bn = (2 * (-1)^(n + 1)) / n; % Fourier coefficient for sine terms
        approx(:, idx) = approx(:, idx) + bn * sin(n * t(:)); % Ensure t is a column vector
    end
end

% Plotting
figure;
hold on;
plot(t, x, 'k', 'LineWidth', 2); % Original sawtooth wave
colors = ['r', 'g', 'b']; % Colors for different N
for idx = 1:length(N_terms)
    plot(t, approx(:, idx), colors(idx), 'LineWidth', 1.5); % Plot approximations
end
hold off;

% Customize the plot
legend('Sawtooth Wave', 'N=5', 'N=10', 'N=20');
title('Fourier Series Approximation of Sawtooth Wave');
xlabel('Time (t)');
ylabel('x(t)');
grid on;
axis([-pi pi -1.5 1.5]); % Set axis limits
