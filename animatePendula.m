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
    currenttime = timestep;
    for i=2:length(T);
        currenttime = currenttime+timestep;
        % change position of rectangles
        set(c1,'Position',[sin(thetaA(i)),-cos(thetaA(i)),.1,.1]);
        set(c2,'Position',[sin(thetaA(i))+sin(thetaB(i)),-cos(thetaA(i))-cos(thetaB(i)),.1,.1]);
        drawnow; % wait a little while so that the animation is visible
        pause((T(i)-T(i-1)));
    end
end