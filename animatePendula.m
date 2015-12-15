function animatePendula(T,Y,E)
    % animatependula.m 
    % by Mark Somerville
    % 
    % This script does a simple animation of a reaction mass hopper.
    %
    % It calls hopper.m, which takes the two masses as input, and returns the
    % trajectory information.
    close all
    
    thetaA = Y(:,1);
    thetaB = Y(:,2);
    
    plot(T,E);
    hold on;
    plot(T,sum(E'));
%     
%     XA = cos(thetaA(i));
%     YA = -sin(thetaA(i));
%     
    
    figure;
    axis([-2.5,2.5,-4,1]);
    
    c1 = rectangle('Position',[sin(thetaA(1)),-cos(thetaA(1)),.1,.1], ...
        'Curvature',[1,1]);
    c2 = rectangle('Position',[sin(thetaA(1))+sin(thetaB(1)),-cos(thetaA(1))-cos(thetaB(1)),.1,.1], ...
        'Curvature',[1,1]);
    timestep = .1;
    for i=2:length(T);
        clf;
        hold on;
        axis square;
        plot([0,sin(thetaA(i)),sin(thetaB(i))+sin(thetaA(i))], [0,-cos(thetaA(i)),-cos(thetaB(i))-cos(thetaA(i))], 'k-o','LineWidth',2);
        plot([sin(thetaA(i)),sin(thetaB(i))+sin(thetaA(i))], [-cos(thetaA(i)),-cos(thetaB(i))-cos(thetaA(i))], 'k.','MarkerSize',20);
        axis([-2,2,-3,1]);
        pause((T(i)-T(i-1)));
    end
    
    hold on;
    plot(sin(thetaA),-cos(thetaA),'r');
    plot(sin(thetaB)+sin(thetaA),-cos(thetaB)-cos(thetaA),'b');
    
    %%
    figure;
    i = 418;
    thtA = Y(i,1);
    thtB = Y(i,2);
    dThA = Y(i,3);
    dThB = Y(i,4);
    
    hold on;
    axis square;
    plot([0,sin(thtA),sin(thtB)+sin(thtA)], [0,-cos(thtA),-cos(thtB)-cos(thtA)], 'k-o','LineWidth',2,'MarkerSize',10);
    plot([sin(thtA),sin(thtB)+sin(thtA)], [-cos(thtA),-cos(thtB)-cos(thtA)], 'k.','MarkerSize',30);
    quiver(sin(thtA),           -cos(thtA),           dThA*cos(thtA),                dThA*sin(thtA),                'r','MaxHeadSize',.5);
    quiver(sin(thtB)+sin(thtA), -cos(thtB)-cos(thtA), dThB*cos(thtB)+dThA*cos(thtA), dThB*sin(thtB)+dThA*sin(thtA), 'b','MaxHeadSize',.5);
    axis([-2,1,-2,1]);
end