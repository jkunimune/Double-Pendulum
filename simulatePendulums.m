function [] = simulatePendulums()
%CHAOES

x = 1;
y = 2;

g = 9.8;%m/s2
lengthA = 1;%m
massA = 1;%kg
initThetaA = -pi/2;
initVelA = 0;
lengthB = 1;%m
massB = 1;%kg
initThetaB = -pi/2;
initVelB = 0;

initXA = lengthA*sin(initThetaA);
initYA = -lengthA*cos(initThetaA);
initVXA = lengthA*sin(initVelA);
initVYA = -lengthA*cos(initVelA);
initXB = lengthB*sin(initThetaA)+initXA;
initYB = -lengthB*cos(initThetaA)+initYA;
initVXB = lengthB*sin(initVelA)+initVXA;
initVYB = -lengthB*cos(initVelA)+initVYA;

ode45(@derivatives, [0,10], [initXA;initYA;initVXA;initVYA;initXB;initYB;initVXB;initVYB]);
legend('Theta_A','Velocity_A','Theta_B','Velocity_B');

    function dYdt = derivatives(~,Y)
        %cellzzz = num2cell(vectorsFromScalars(Y));
        [RA,VA,RB,VB] = vectorsFromScalars(Y);
        rA = norm(RA);
        RAhat = RA/rA;
        vA = norm(VA);
        VAhat = VA/vA;
        
        rB = norm(RB);
        RBhat = RB/rB;
        vB = norm(VB);
        VBhat = VB/vB;
        
        vBrelA = norm(VB - VA);
        VBrelAhat = (VB - VA)/vBrelA;
        rBrelA = norm(RB - RA);
        RBrelAhat = (RB - RA)/rBrelA;
        
        ft = massA*(vA^2)/lengthA;
        Ft = -ft*RAhat;
        fc = calculateThatThing(Y);
        FcA = fc*RBrelAhat;
        FcB = -fc*RBrelAhat;
        FgA = [0,-massA*g];
        FgB = [0,-massB*g];
        
        AA = (FcA + Ft + FgA)/massA;
        AB = (FcB + FgB)/massB;
        
        dYdt = [VA';AA';VB';AB'];
        
        function [RA,VA,RB,VB] = vectorsFromScalars(Set)
           RA = [Set(1),Set(2)];
           VA = [Set(3),Set(4)];
           RB = [Set(5),Set(6)];
           VB = [Set(7),Set(8)];
        end
    end
end
