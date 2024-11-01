% Define the numerator and denominator coefficients
numerator = [1, 1];            % Coefficients for (s + 1)
denominator = [1, 4, 4];       % Coefficients for (s^2 + 4s + 4)

% Part (a): Find poles and zeros
zeros = roots(numerator);      % Calculate zeros
poles = roots(denominator);    % Calculate poles

disp('Poles of the system:');
disp(poles);
disp('Zeros of the system:');
disp(zeros);

% Part (b): Plot the step response
% Create a time vector for the simulation
t = 0:0.01:10; % Time from 0 to 10 seconds

% Calculate the step response
y = step_response(t, numerator, denominator);

% Plot step response
figure;
plot(t, y);
title('Step Response of H(s)');
xlabel('Time (s)');
ylabel('Response');
grid on;

% Part (c): Generate the pole-zero map
figure;
plot(real(poles), imag(poles), 'x', 'MarkerSize', 10); hold on;
plot(real(zeros), imag(zeros), 'o', 'MarkerSize', 10);
title('Pole-Zero Map of H(s)');
xlabel('Real Part');
ylabel('Imaginary Part');
axis equal;
grid on;

% Step response calculation function
function y = step_response(t, num, den)
    % Initialize step response
    y = zeros(size(t));
    dt = t(2) - t(1);  % Time step

    % Initialize states for simulation
    x = zeros(length(den)-1, 1);  % State vector (for n-1 states)

    for i = 2:length(t)
        % Compute the input (step input = 1)
        u = 1;  % Step input

        % Calculate the output
        y(i) = x(1);  % Output is the first state

        % State update using Euler's method
        % x[n] = Ax[n-1] + Bu[n]
        % Using the system's state-space representation
        x(1) = x(1) + dt * (u * num(1) - den(2) * x(1) - den(3) * x(2));
        x(2) = x(2) + dt * (den(2) * x(1)); % Update for second state
    end
end
