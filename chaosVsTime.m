%plots chaos vs time for different mass ratios
MassRatios = [.5,1,2];
Times = linspace(0,5,200)';
Scatter = zeros(length(Times),length(MassRatios));
Eyys = zeros(length(MassRatios),1);
Bees = zeros(length(MassRatios),1);

parfor i = 1:length(MassRatios)
    Scatter(:,i) = chaos3(Times,MassRatios(i))';
    f = fit(Times,Scatter(:,i),'exp1');
    Eyys(i) = f.a;
    Bees(i) = f.b;
end

p1 = semilogy(Times, Scatter(:,1), 'r.');
hold on;
% semilogy(Times, Eyys(1)*exp(Bees(1)*Times), 'r-');
p2 = semilogy(Times, Scatter(:,2), 'g.');
% semilogy(Times, Eyys(2)*exp(Bees(2)*Times), 'g-');
p3 = semilogy(Times, Scatter(:,3), 'b.');
% semilogy(Times, Eyys(3)*exp(Bees(3)*Times), 'b-');

xlabel('Time (s)');
ylabel('Number of Peaks');
title('Chaos over Time for Various Mass Ratios');
legend([p1 p2 p3],'m_A:m_B = ^1/_2','m_A:m_B = 1','m_A:m_B = 2', 'Location','northwest');