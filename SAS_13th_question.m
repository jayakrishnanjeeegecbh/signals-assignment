% Clear workspace and command window
clear; clc;

% Define the numerator and denominator
numerator = [10, 10];  % Coefficients of the numerator (10(s + 1))
denominator = [1, 6, 10]; % Coefficients of the denominator (s^2 + 6s + 10)

% Calculate zeros and poles
zeros = roots(numerator);    % Calculate zeros
poles = roots(denominator);  % Calculate poles

% Create the pole-zero map
figure;
hold on;
plot(real(zeros), imag(zeros), 'ro', 'MarkerSize', 10, 'DisplayName', 'Zeros'); % Plot zeros
plot(real(poles), imag(poles), 'bx', 'MarkerSize', 10, 'DisplayName', 'Poles'); % Plot poles

% Annotate the plot
xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-Zero Map');
legend('show');
grid on;
axis equal; % Equal scaling for both axes
hold off;

% Display zeros and poles in command window
disp('Zeros:');
disp(zeros);
disp('Poles:');
disp(poles);
