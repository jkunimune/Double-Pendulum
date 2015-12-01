function res = chaos(times, massRatio)
res = zeros(1,length(times));
for i = 1:length(times)
    time = times(i);
    initThetaA = pi/2;%rad
    initThetaB = pi/2;%rad
    initThetaDotA = 0;%rad/s
    initThetaDotB = 0;%rad/s

    variance = 1e-4;%rad
    
    Initials = [initThetaA; initThetaB; initThetaDotA; initThetaDotB];
    [~,Y,~] = simulatePendulums(massRatio,[0,time], Initials);
    original = Y(end,2);

    Initials(2) = Initials(2)+variance;
    [~,Y,~] = simulatePendulums(massRatio,[0,time], Initials);
    varied = Y(end,2);

    res(i) = (varied-original)/variance;
end
end