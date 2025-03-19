%% Air Quality Sensor Testing
% Collect data from the optical dust sensor and plot
% Author: Thomas Dunnington
% Modified: 3/10/2025
close all; clear; clc;

%% Read Data
% List the available ports
availablePorts = serialportlist();

if isempty(availablePorts)
    fprintf("Error: No Ports Detected\n")
    return;
end

% Connect to the arduino
arduinoObj = serialport(availablePorts(1), 115200);

% Configure the serial object
configureTerminator(arduinoObj, "LF"); % Newline terminator

% Begin live plotting of VOC concentration and C02
figure();
h1 = animatedline('Color', 'r', 'LineWidth', 1.5);
title('Dust Density');
xlabel('Time (s)');
ylabel('Dust Density (mg/m^3)');
grid on;


% Read and parse data
pause(2); % Wait 5 seconds for arduino start up
flush(arduinoObj); % Clear any old data
start_time = tic;
while true
    try
        % Read a line of data from Arduino
        dataStr = readline(arduinoObj);

        % Parse data
        C = strsplit(dataStr, ',');
        dust = str2double(C(1));
        dust_avg = str2double(C(2));

        % Convert output voltage to dust density
        % linear model, 3.5 V -> 0.5, 0.65 V -> 0
        dust_density = 0.5 / (3.5 - 0.65) * dust - 0.114;

        % Plot data
        current_time = toc(start_time);
        addpoints(h1, current_time, dust_density);
        drawnow;

        % Adjust axis limits dynamically
        xlim([max(0, current_time - 10), current_time]); % Keep last 10 sec

        % Print the voltage
        fprintf("Sensor Output Voltage: %d \n", dust);

    catch
        disp("Error reading data. Check connection.");
    end
end



