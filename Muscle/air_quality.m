%% Air Quality Sensor Testing
% Collect data from the muscle sensor and plot
% Author: Thomas Dunnington
% Modified: 3/7/2025
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
s1 = subplot(2,1,1);
h1 = animatedline('Color', 'r', 'LineWidth', 1.5);
title('Total Volatile Organic Compounds');
xlabel('Time (s)');
ylabel('VOC Concentration (ppb)');
grid on;

s2 = subplot(2,1,2);
h2 = animatedline('Color', 'b', 'LineWidth', 1.5);
title('Carbon Dioxide');
xlabel('Time (s)');
ylabel('C02 Concentration (ppm)');
grid on;


% Read and parse data
pause(5); % Wait 5 seconds for arduino start up
flush(arduinoObj); % Clear any old data
start_time = tic;
while true
    try
        % Read a line of data from Arduino
        dataStr = readline(arduinoObj);

        % Parse data
        C = strsplit(dataStr, ',');
        aqi = str2double(C(1));
        voc = str2double(C(2));
        c02 = str2double(C(3));

        % Plot data
        current_time = toc(start_time);
        addpoints(h1, current_time, voc);
        addpoints(h2, current_time, c02);
        drawnow;

        % Adjust axis limits dynamically
        xlim(s1, [max(0, current_time - 10), current_time]); % Keep last 10 sec
        xlim(s2, [max(0, current_time - 10), current_time]);
        
        % Print the AQI
        fprintf("Air Quality Index: %d \n", aqi);

    catch
        disp("Error reading data. Check connection.");
    end
end



