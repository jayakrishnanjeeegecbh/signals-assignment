% Clear workspace and command window
clear; clc;

% Define the coefficients of the transfer function
numerator = [7];               % Coefficient of the numerator (7)
denominator = [1, 3, 2];       % Coefficients of the denominator (s^2 + 3s + 2)

% Calculate the poles of the system
poles = roots(denominator); % Calculate poles
disp('Poles:');
disp(poles);

% Create time vector for impulse response
t = 0:0.01:10;                % Time from 0 to 10 seconds
dt = t(2) - t(1);             % Time step
impulse_input = [1, zeros(1, length(t) - 1)]; % Impulse input (delta function)

% Initialize response array
response = zeros(size(t));

% Calculate impulse response using the difference equation
for n = 1:length(t)
    if n == 1
        response(n) = numerator(1); % Initial condition (impulse)
    elseif n == 2
        response(n) = -denominator(2) * response(n-1); % Use first term
    else
        response(n) = ...
            -denominator(2) * response(n-1) - ...
            denominator(3) * response(n-2); % For n >= 3
    end
end

% Normalize the response (optional)
response = response * dt; % Scale by time step for continuous-time simulation

% Plot the impulse response
figure;
plot(t, response);
title('Impulse Response of the System');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Analyze stability based on poles
if all(real(poles) < 0)
    disp('The system is stable.');
else
    disp('The system is unstable.');
end
