% Define the time vector for x(t)
t = 0:0.01:5; % Time from 0 to 5 seconds

% Define the input signal x(t)
x = sin(2 * pi * t); % x(t) = sin(2πt)

% (a) Define the impulse responses h1(t) and h2(t)
h1 = exp(-t); % h1(t) = e^(-t) for t ≥ 0
h2 = exp(-2*t); % h2(t) = e^(-2t) for t ≥ 0

% Perform the convolution with h1(t)
y1 = conv(x, h1, 'full') * 0.01; % Use 'full' for convolution and scale by dt

% Perform the convolution with h2(t)
y2 = conv(x, h2, 'full') * 0.01; % Use 'full' for convolution and scale by dt

% Create time vectors for the output signals
t_y1 = linspace(0, t(end) + t(end), length(y1)); % Time vector for y1
t_y2 = linspace(0, t(end) + t(end), length(y2)); % Time vector for y2

% (b) Plot the output signals for both cases
figure;

% Plot y1(t)
subplot(2, 1, 1);
plot(t_y1, y1, 'LineWidth', 2);
title('Output Signal y1(t) = x(t) * h1(t)');
xlabel('Time (s)');
ylabel('y1(t)');
grid on;

% Plot y2(t)
subplot(2, 1, 2);
plot(t_y2, y2, 'LineWidth', 2);
title('Output Signal y2(t) = x(t) * h2(t)');
xlabel('Time (s)');
ylabel('y2(t)');
grid on;

% (c) Analysis of the outputs
disp('Analysis of Outputs:');
disp('The output y1(t) represents the convolution of the input signal with h1(t) = e^(-t).');
disp('The output y2(t) represents the convolution of the input signal with h2(t) = e^(-2t).');
disp('As the decay rate of the impulse response increases (from h1 to h2):');
disp('- The output y2(t) decays more rapidly than y1(t).');
disp('- High-frequency components of the input signal are attenuated more significantly in y2(t).');
disp('- The overall shape of y2(t) is smoother with reduced oscillations.');
disp('This illustrates the effect of the impulse response on the system dynamics and output characteristics.');
