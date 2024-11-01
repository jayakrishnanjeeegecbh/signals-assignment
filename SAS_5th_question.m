% Define the time vectors for x(t) and h(t)
t_x = 0:0.01:2; % Time from 0 to 2 for x(t)
t_h = 0:0.01:1; % Time from 0 to 1 for h(t)

% Define the continuous-time signals
x = sin(2 * pi * t_x); % x(t) = sin(2πt), for 0 ≤ t ≤ 2
h = t_h;               % h(t) = t, for 0 ≤ t ≤ 1

% (b) Perform the convolution
y = conv(x, h, 'full') * 0.01; % Scale by the time step (0.01)

% Create a time vector for the output signal
t_y = linspace(0, t_x(end) + t_h(end), length(y)); % Adjust output time vector

% (c) Plot the signals
figure;

% Plot x(t)
subplot(3, 1, 1);
plot(t_x, x, 'LineWidth', 2);
title('Input Signal x(t) = sin(2\pi t)');
xlabel('Time (s)');
ylabel('x(t)');
grid on;

% Plot h(t)
subplot(3, 1, 2);
plot(t_h, h, 'LineWidth', 2);
title('Impulse Response h(t) = t');
xlabel('Time (s)');
ylabel('h(t)');
grid on;

% Plot y(t)
subplot(3, 1, 3);
plot(t_y, y, 'LineWidth', 2);
title('Output Signal y(t) = x(t) * h(t)');
xlabel('Time (s)');
ylabel('y(t)');
grid on;

% (d) Analysis can be written in comments or printed to the console
disp('Analysis of Convolution:');
disp('The output y(t) represents how the input sine wave interacts with the ramp function h(t).');
disp('The convolution captures the accumulated effect of the input over time, smoothing the oscillations.');
