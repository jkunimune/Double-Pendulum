function res = chaos3(times, massRatio)
    res = zeros(1,length(times));
    InitPositions = linspace(0,pi,5000);
    Finals = zeros(length(times),length(InitPositions));

    for j = 1:length(InitPositions)
        initThetaA = InitPositions(j);%rad
        initThetaB = InitPositions(j);%rad
        initThetaDotA = 0;%rad/s
        initThetaDotB = 0;%rad/s

        Initials = [initThetaA; initThetaB; initThetaDotA; initThetaDotB];
        [~,Y,~] = simulatePendulums(massRatio, times, Initials); % runs simulation
        Finals(:,j) = Y(:,2);
        if rem(j/length(InitPositions)*100, 1) == 0
            disp([num2str(j/length(InitPositions)*100) ' %']);
        end
    end

    for i = 1:length(times)
        pks = findpeaks(-Finals(i,:)./InitPositions);
        res(i) = length(pks);
    end
end