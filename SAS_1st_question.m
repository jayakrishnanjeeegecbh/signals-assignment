% Define the time vector
t = -1:0.01:10; % Time from -1 to 10 for better visibility

% Initialize the signal
x = zeros(size(t));

% Define the trapezoidal signal x(t)
for i = 1:length(t)
    if t(i) >= 0 && t(i) < 2
        x(i) = t(i);
    elseif t(i) >= 2 && t(i) <= 6
        x(i) = 2;
    elseif t(i) > 6 && t(i) <= 8
        x(i) = 8 - t(i);
    end
end

% (a) Plot x(t)
figure;
plot(t, x, 'LineWidth', 2);
title('Signal x(t)');
xlabel('Time (t)');
ylabel('x(t)');
grid on;

% (b) Plot x(t - 3)
x_shifted = zeros(size(t));
for i = 1:length(t)
    if t(i) - 3 >= 0 && t(i) - 3 < 2
        x_shifted(i) = t(i) - 3;
    elseif t(i) - 3 >= 2 && t(i) - 3 <= 6
        x_shifted(i) = 2;
    elseif t(i) - 3 > 6 && t(i) - 3 <= 8
        x_shifted(i) = 8 - (t(i) - 3);
    end
end

figure;
plot(t, x_shifted, 'LineWidth', 2);
title('Signal x(t - 3)');
xlabel('Time (t)');
ylabel('x(t - 3)');
grid on;

% (c) Plot x(1/2 * t)
x_scaled_half = zeros(size(t));
for i = 1:length(t)
    if (1/2)*t(i) >= 0 && (1/2)*t(i) < 2
        x_scaled_half(i) = (1/2)*t(i);
    elseif (1/2)*t(i) >= 2 && (1/2)*t(i) <= 6
        x_scaled_half(i) = 2;
    elseif (1/2)*t(i) > 6 && (1/2)*t(i) <= 8
        x_scaled_half(i) = 8 - (1/2)*t(i);
    end
end

figure;
plot(t, x_scaled_half, 'LineWidth', 2);
title('Signal x(1/2 * t)');
xlabel('Time (t)');
ylabel('x(1/2 * t)');
grid on;

% (d) Plot x(2*t)
% This is unchanged from before, but included for completeness
x_scaled_2t = zeros(size(t));
for i = 1:length(t)
    if 2*t(i) >= 0 && 2*t(i) < 2
        x_scaled_2t(i) = 2*t(i);
    elseif 2*t(i) >= 2 && 2*t(i) <= 6
        x_scaled_2t(i) = 2;
    elseif 2*t(i) > 6 && 2*t(i) <= 8
        x_scaled_2t(i) = 8 - 2*t(i);
    end
end

figure;
plot(t, x_scaled_2t, 'LineWidth', 2);
title('Signal x(2*t)');
xlabel('Time (t)');
ylabel('x(2*t)');
grid on;

% (e) Plot x(2t + 3)
x_scaled_shifted = zeros(size(t));
for i = 1:length(t)
    if 2*t(i) + 3 >= 0 && 2*t(i) + 3 < 2
        x_scaled_shifted(i) = 2*t(i) + 3;
    elseif 2*t(i) + 3 >= 2 && 2*t(i) + 3 <= 6
        x_scaled_shifted(i) = 2;
    elseif 2*t(i) + 3 > 6 && 2*t(i) + 3 <= 8
        x_scaled_shifted(i) = 8 - (2*t(i) + 3);
    end
end

figure;
plot(t, x_scaled_shifted, 'LineWidth', 2);
title('Signal x(2t + 3)');
xlabel('Time (t)');
ylabel('x(2t + 3)');
grid on;
