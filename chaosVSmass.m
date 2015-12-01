function chaosVSmass()
MassRatios = logspace(-1,1,30);
Slopes = zeros(1,length(MassRatios));
TimeSpan = linspace(.0001,10);
for i = 1:length(MassRatios)
    chaosCurve = chaos2(TimeSpan, MassRatios(i));
    chaosLine = polyfit(TimeSpan,chaosCurve,1);
    Slopes(i) = chaosLine(1);
    disp([num2str(floor(i/length(MassRatios)*100)) ' %']);
end

semilogx(MassRatios, Slopes);
xlabel('Ratio of Mass_A to Mass_B');
ylabel('Rate at which chaos generally increases over time (Hz)');
end