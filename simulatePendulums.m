function [] = simulatePendulums()
%CHAOES

g = 9.8;%m/s2
lengthA = 1;%m
massA = 1;%kg
initThetaA = -pi/2;
initVelA = 0;
lengthB = 1;%m
massB = 2;%kg
initThetaB = -pi/2;
initVelB = 0;

ode45(@derivatives, [0,10], [initThetaA;initVelA;initThetaB;initVelB]);
legend('Theta_A','Velocity_A','Theta_B','Velocity_B');

    function dYdt = derivatives(~,Y)
        thetaA = Y(1);
        velA = Y(2);
        thetaB = Y(3);
        velB = Y(4);
        
        FgA = -massA*g;
        FgB = -massB*g;
        
        accelA = (FgA*sin(thetaA))/(massA*lengthA);
        accelB = (FgB*sin(thetaB))/(massB*lengthB);
        
        dYdt = [velA; accelA; velB; accelB];
    end
end
