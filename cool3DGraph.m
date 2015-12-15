Positions = linspace(0,pi,10000);
Times = linspace(0,10,200);
Finals = zeros(length(Times),length(Positions));
Relatives = zeros(length(Times),length(Positions));

for i = 1:length(Positions)
    [~,Y,~] = simulatePendulums(1,Times,[Positions(i),Positions(i),0,0]);
    Finals(:,i) = rem(Y(:,2)+41*pi, 2*pi)-pi;
    Relatives(:,i) = Finals(:,i)-Positions(:,i);
    if Relatives(:,i) > pi
        Relatives(:,i) = Relatives(:,i)-2*pi;
    end
    if Relatives(:,i) < -pi
        Relatives(:,i) = Relatives(:,i)+2*pi;
    end

    if i/length(Positions)*100 == floor(i/length(Positions)*100)
        disp([num2str(floor(i/length(Positions)*100)) ' %']);
    end
end

[T,Y,E] = simulatePendulums(1,Times,[pi/2, pi/2, 0,0]);

%%
pcolor(Times,Positions,Relatives');

h = colorbar();
xlabel(h,'Relative Position of Bottom Pendulum (rad)');
ylabel('Initial Position of Bottom Pendulum (rad)');
xlabel('Time (s)');
ax = gca;
ax.YTick = [0, pi/4, pi/2, 3*pi/4, pi];
ax.YTickLabel = {'0','\tau/8','\tau/4','3*\tau/8','\tau/2'};
h.YTick = [-pi, -pi/2, 0, pi/2, pi];
h.YTickLabel = {'-\tau/2','-\tau/4','0','\tau/4','\tau/2'};
axis([0,10,0,pi]);
caxis([-pi,pi]);
title('CHAOS');

shading flat;
shading interp;
%%
figure;

surf(Times,Positions,Finals')
hold on;
surf(Times,-Positions,Finals')

zlabel('Final Position of Bottom Pendulum (rad)');
ylabel('Initial Position of Bottom Pendulum (rad)');
xlabel('Time (s)');
ax = gca;
ax.YTick = [0, pi/2, pi];
ax.YTickLabel = {'0','\tau/4','\tau/2'};
ax.ZTick = [-pi, -pi/2, 0, pi/2, pi];
ax.ZTickLabel = {'-\tau/2','-\tau/4','0','\tau/4','\tau/2'};
axis([0,10,0,pi,-pi,pi]); %for surf
title('CHAOS');
shading flat;
%%
figure;
blank = waitforbuttonpress;
while 1
    for t = 1:length(Times)
        
        while blank == 1
            blank = waitforbuttonpress;
        end
        if t > 1
            pause((Times(t)-Times(t-1)));
        end
        subplot(1,2,1,'replace');
        plot(Positions,Finals(t,:)./Positions*100, 'b.');
        hold on
        plot(-Positions,Finals(t,:)./Positions*100, 'b.');
        plot(pi/2, Y(t,2)/(pi/2)*100, 'ko', 'MarkerSize', 8, 'LineWidth',2);

        %disp([num2str(Times(t)) 's']);
        ylabel('Current Relative Angle of Bottom Pendulum (%)');
        xlabel('Initial Angle of Bottom Pendulum (rad)');
        axis([-pi,pi,-100,100]);
        ax = gca;
        ax.XTick = [-pi, -pi/2, 0, pi/2, pi];
        ax.XTickLabel = {'-\pi','-\pi/2','0','\pi/2','\pi',};
    
        subplot(1,2,2);
        plot([0,sin(Y(t,1)),sin(Y(t,2))+sin(Y(t,1))], [0,-cos(Y(t,1)),-cos(Y(t,2))-cos(Y(t,1))], 'k-o','LineWidth',2);
        axis([-2,2,-3,1]);
    end
end
%%
for t = [10 40 70];
    figure;
    plot(Positions,Finals(t,:)./Positions*100, 'k.');
    hold on;
    plot(-Positions,Finals(t,:)./Positions*100, 'k.');
    ylabel('Current Relative Angle of Bottom Pendulum (%)');
    xlabel('Initial Angle of Bottom Pendulum (rad)');
    axis([-pi,pi,-100,100]);
    ax = gca;
    ax.XTick = [-pi, -pi/2, 0, pi/2, pi];
    ax.XTickLabel = {'-\pi','-\pi/2','0','\pi/2','\pi',};
    title('Final Positions vs Initial Positions');
    annotation('textbox',[.45,.15,.1,.1],'String',['t = ' num2str(round(T(t),2)) 's'],'FitBoxToText','on');
end