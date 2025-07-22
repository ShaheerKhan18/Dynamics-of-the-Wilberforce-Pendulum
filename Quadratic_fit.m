% Define J and phi vectors (replace with your actual data)
J = [775193.7984496124, 358423.1651376147, 259067.35751295334, 224719.10112359552];  % Example moments of inertia (kg·m^2)
phi = [0.026981, 0.0020106, 0.0363919, 0.0008501];  % Example phi = (2*pi*f)^2 for f ~ 0.625 Hz

% Perform quadratic fit: phi = C2*J^2 + C1*J + C0
coeffs = polyfit(J, phi, 2);

% Extract coefficients
C2 = coeffs(1);
C1 = coeffs(2);
C0 = coeffs(3);

% Display results
disp(['C2 = ', num2str(C2)]);
disp(['C1 = ', num2str(C1)]);
disp(['C0 = ', num2str(C0)]);

% Optional: Plot the fit 
J_fit = linspace(min(J), max(J), 100);
phi_fit = polyval(coeffs, J_fit);
figure;
plot(J, phi, 'o', 'MarkerSize', 8, 'DisplayName', 'Data');
hold on;
plot(J_fit, phi_fit, '-', 'DisplayName', 'Quadratic Fit');
xlabel('Moment of Inertia J (kg·m^2)');
ylabel('phi (rad^2/s^2)');
title('Quadratic Fit of phi vs J');
legend('show');
grid on;