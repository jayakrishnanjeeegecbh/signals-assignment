% Define the time vector
t = -1:0.01:5; % Time from -1 to 5 for better visibility

% Define the input signal x(t)
x = zeros(size(t));
x(t >= 0 & t < 3) = 1;

% Define the impulse response h(t)
h = zeros(size(t));
h(t >= 0) = exp(-t(t >= 0));

% (a) Plot x(t) and h(t)
figure;
subplot(2, 1, 1);
plot(t, x, 'LineWidth', 2);
title('Input Signal x(t)');
xlabel('Time (t)');
ylabel('x(t)');
grid on;

subplot(2, 1, 2);
plot(t, h, 'LineWidth', 2);
title('Impulse Response h(t)');
xlabel('Time (t)');
ylabel('h(t)');
grid on;

% (b) Perform convolution
y = conv(x, h, 'same') * 0.01; % Scale by the time step

% Adjust the time vector for the output
t_output = linspace(t(1) + t(1), t(end) + t(end), length(y));

% (c) Plot y(t)
figure;
plot(t_output, y, 'LineWidth', 2);
title('Output Signal y(t) = x(t) * h(t)');
xlabel('Time (t)');
ylabel('y(t)');
grid on;

% (d) Analysis can be written in comments or printed to the console
disp('Analysis of System Behavior:');
disp('The output y(t) represents the response of the system to the rectangular pulse input x(t).');
disp('It starts from t = 0 and gradually decays due to the impulse response h(t), which is an exponential decay.');
