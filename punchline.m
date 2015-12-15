%punchlineGraph.m
 
% RatiosOfMasses = [logspace(-3,-1,200) logspace(1,3,200)];
RatiosOfMasses = logspace(-2,2,500);
Chaoses = zeros(1,length(RatiosOfMasses));
Times = linspace(0,4);

for i = 1:length(RatiosOfMasses)
    AllTheChaoses = chaos3(Times, RatiosOfMasses(i));
    Chaoses(i) = AllTheChaoses(end);
    disp(['Actually ' num2str(i/length(RatiosOfMasses)*100) '%']);
end

semilogx(RatiosOfMasses, Chaoses, '*');
xlabel('Ratio of m_A:m_B');
ylabel('Number of Peaks after 4 Seconds');
title('Amount of Chaos for Different Mass Ratios');