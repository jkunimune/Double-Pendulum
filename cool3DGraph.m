Positions = linspace(0,pi,1000);
Times = linspace(.001,10,200);
Finals = zeros(length(Positions),length(Times));
Relatives = zeros(length(Positions),length(Times));

for i = 1:length(Positions)
    parfor j = 1:length(Times)
        [T,Y,E] = simulatePendulums(.37,[0,Times(j)],[0,Positions(i),0,0]);
        Finals(i,j) = Y(end,2);
        Relatives(i,j) = Finals(i,j)-Positions(i);
        if Relatives(i,j) > pi
            Relatives(i,j) = Relatives(i,j)-2*pi;
        end
        if Relatives(i,j) < -pi
            Relatives(i,j) = Relatives(i,j)+2*pi;
        end
    end
    disp([num2str(i/length(Positions)*100) ' %']);
end

%%
pcolor(Times,Positions,Relatives);

h = colorbar();
xlabel(h,'Relative Position of Bottom Pendulum (rad)');
ylabel('Initial Position of Bottom Pendulum (rad)');
xlabel('Time (s)');
ax = gca;
ax.YTick = [-pi, -pi/2, 0, pi/2, pi];
ax.YTickLabel = {'-\tau/2','-\tau/4','0','\tau/4','\tau/2'};
h.YTick = [-pi, -pi/2, 0, pi/2, pi];
h.YTickLabel = {'-\tau/2','-\tau/4','0','\tau/4','\tau/2'};
axis([0,30,-pi,pi]);
caxis([-pi,pi]);
title('CHAOS');

shading flat;
shading interp;
%%
figure;

surf(Times,Positions,Finals)

zlabel('Final Position of Bottom Pendulum (rad)');
ylabel('Initial Position of Bottom Pendulum (rad)');
xlabel('Time (s)');
ax = gca;
ax.YTick = [-pi, -pi/2, 0, pi/2, pi];
ax.YTickLabel = {'-\tau/2','-\tau/4','0','\tau/4','\tau/2'};
ax.ZTick = [-pi, -pi/2, 0, pi/2, pi];
ax.ZTickLabel = {'-\tau/2','-\tau/4','0','\tau/4','\tau/2'};
axis([0,15,-pi,pi,-pi,pi]); %for surf
title('CHAOS');
%%
figure;

for t = 1:length(Times)
    if t > 1
        pause(50*(Times(t)-Times(t-1)));
    end
    plot(Positions,(Finals(:,t))./(Positions')*100,'.');
    disp(Times(t))
    ylabel('Current Relative Angle of Bottom Pendulum (%)');
    xlabel('Initial Angle of Bottom Pendulum (rad)');
    axis([-pi,pi,-100,100]);
    ax = gca;
    ax.XTick = [-3*pi/2, -pi, -pi/2, 0, pi/2, pi, 3*pi/2];
    ax.XTickLabel = {'-\tau*3/4','-\tau/2','-\tau/4','0','\tau/4','\tau/2','\tau*3/4'};
    title('CHAOS');
end