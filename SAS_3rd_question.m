% Define the time vector
t = -1:0.01:7; % Time from -1 to 7 for visibility

% (a) Define the input square wave x(t)
x = zeros(size(t));
x(t >= 0 & t < 5) = 1; % x(t) = 1 for 0 ≤ t < 5

% (b) Define the impulse response h(t)
h = zeros(size(t));
h(t >= 0) = exp(-2 * t(t >= 0)); % h(t) = e^(-2t) for t ≥ 0

% Perform the convolution
y = conv(x, h, 'full') * 0.01; % Use 'full' for convolution
t_y = linspace(t(1) + t(1), t(end) + t(end), length(y)); % Adjust output time vector

% (c) Plot the signals
figure;

% Plot x(t)
subplot(3, 1, 1);
plot(t, x, 'LineWidth', 2);
title('Input Signal x(t)');
xlabel('Time (t)');
ylabel('x(t)');
grid on;

% Plot h(t)
subplot(3, 1, 2);
plot(t, h, 'LineWidth', 2);
title('Impulse Response h(t)');
xlabel('Time (t)');
ylabel('h(t)');
grid on;

% Plot y(t)
subplot(3, 1, 3);
plot(t_y, y, 'LineWidth', 2);
title('Output Signal y(t) = x(t) * h(t)');
xlabel('Time (t)');
ylabel('y(t)');
grid on;

% (d) Analysis can be written in comments or printed to the console
disp('Analysis of System Response:');
disp('The output y(t) is influenced by the square wave input x(t) and the exponential decay of h(t).');
disp('It begins to rise during the input period and then decays after the input is off, reflecting the system dynamics.');
