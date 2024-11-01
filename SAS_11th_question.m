% Define system parameters
numerator = 5;
denominator = [1 4 8];  % Coefficients of y'' + 4y' + 8y = 5u

% Define the time vector
t = 0:0.01:10;  % 0 to 10 seconds with a step of 0.01 seconds
dt = t(2) - t(1);  % Time step

% Initialize the output and state arrays
y = zeros(size(t));  % Output
y_dot = 0;  % Initial derivative (y')
y_double_dot = 0;  % Initial second derivative (y'')

% Step input
u = ones(size(t));  % Step input of 1

% Simulate the step response using numerical integration
for k = 1:length(t)-1
    % Calculate the second derivative
    y_double_dot = (numerator * u(k) - denominator(2) * y_dot - denominator(3) * y(k)) / denominator(1);
    
    % Update the first derivative and output using Euler's method
    y_dot = y_dot + y_double_dot * dt;
    y(k+1) = y(k) + y_dot * dt;
end

% Plot the step response
figure;
plot(t, y);
title('Step Response of the System');
xlabel('Time (seconds)');
ylabel('Output y(t)');
grid on;
