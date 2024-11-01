% (a) Define the time vector and input signal
t = 0:0.01:10; % Time from 0 to 10 seconds

% Define the frequencies
f1 = 1; % Frequency 1 (Hz)
f2 = 10; % Frequency 2 (Hz)

% Define the input signal x(t)
x = sin(2 * pi * f1 * t) + sin(2 * pi * f2 * t);

% Plot the input signal x(t)
figure;
plot(t, x, 'LineWidth', 2);
title('Input Signal x(t)');
xlabel('Time (s)');
ylabel('x(t)');
grid on;

% (b) Define the impulse response h(t)
h = exp(-t); % h(t) = e^(-t) for t >= 0

% Perform the convolution
y = conv(x, h, 'full') * 0.01; % Use 'full' for convolution

% (c) Plot the output signal y(t)
% Create a time vector for the output based on convolution result
t_output = linspace(t(1), t(end) + t(end), length(y)); % Adjust output time vector

% Plot the output signal y(t)
figure;
plot(t_output, y, 'LineWidth', 2);
title('Output Signal y(t) = x(t) * h(t)');
xlabel('Time (s)');
ylabel('y(t)');
grid on;

% (d) Analysis can be written in comments or printed to the console
disp('Analysis of System Response:');
disp('The output y(t) retains the low-frequency component (1 Hz) while attenuating the high-frequency component (10 Hz).');
disp('This demonstrates the low-pass filtering behavior of the system.');
