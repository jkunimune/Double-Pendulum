function [] = simulatePendulums()
%CHAOES

g = 9.8;%m/s2
lengthA = 1;%m
massA = 1;%kg
initThetaA = -pi/2;
initVelA = 0;

ode45(@derivatives, [0,10], [initThetaA;initVelA]);
legend('Theta_A','Velocity_A');

    function dYdt = derivatives(~,Y)
        thetaA = Y(1);
        velA = Y(2);
        
        Fg = -massA*g;
        
        accelA = (Fg*sin(thetaA))/(massA*lengthA);
        
        dYdt = [velA; accelA];
    end
end
