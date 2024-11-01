% Clear workspace and command window
clear; clc;

% Define parameters
T = 2 * pi;                % Period
t = linspace(0, T, 1000); % Time vector
x = zeros(size(t));        % Initialize the half-wave rectified sine wave

% Define the half-wave rectified sine wave
for i = 1:length(t)
    if t(i) < pi
        x(i) = sin(t(i)); % First segment
    else
        x(i) = 0; % Second segment
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
        an = (2 / pi) * (1 / (1 + n) + 1 / (1 - n)); % Fourier coefficient for cosine terms
        approx(:, idx) = approx(:, idx) + an * cos(n * t(:)); % Ensure t is a column vector
    end
end

% Adding a0 term (DC offset)
a0 = 1 / pi; % a0 already computed
for idx = 1:length(N_terms)
    approx(:, idx) = approx(:, idx) + a0; % Include a0 in the approximation
end

% Plotting
figure;
hold on;
plot(t, x, 'k', 'LineWidth', 2); % Original half-wave rectified sine wave
colors = ['r', 'g', 'b']; % Colors for different N
for idx = 1:length(N_terms)
    plot(t, approx(:, idx), colors(idx), 'LineWidth', 1.5); % Plot approximations
end
hold off;

% Customize the plot
legend('Half-Wave Rectified Sine Wave', 'N=5', 'N=10', 'N=20');
title('Fourier Series Approximation of Half-Wave Rectified Sine Wave');
xlabel('Time (t)');
ylabel('x(t)');
grid on;
axis([0 T -0.5 1.5]); % Set axis limits
