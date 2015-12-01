function res = chaos2(times, massRatio)
    res = zeros(1,length(times));
    InitPositions = linspace(0.9*pi/2,1.1*pi/2);
    Finals = zeros(length(times),length(InitPositions));

    for j = 1:length(InitPositions)
        initThetaA = pi/2;%rad
        initThetaB = InitPositions(j);%rad
        initThetaDotA = 0;%rad/s
        initThetaDotB = 0;%rad/s

        Initials = [initThetaA; initThetaB; initThetaDotA; initThetaDotB];
        [~,Y,~] = simulatePendulums(massRatio, times, Initials);
        Finals(:,j) = Y(:,2);
    end

    for i = 1:length(times)
        res(i) = sqrt(mean((diff(Finals(i,:)./InitPositions) ./ diff(InitPositions)).^2));
    end
end