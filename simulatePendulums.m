function [T,Y,E] = simulatePendulums(Times, Initials)
%CHAOES

x = 1;
y = 2;

g = 9.8;%m/s2
rA = 1;%m
mA = 1;%kg
rB = 1;%m
mB = 1;%kg

options = odeset('RelTol',1e-4);

[T,Y] = ode45(@derivatives, Times, Initials, options);
%ode45(@derivatives, [0,10], [initThetaA; initThetaB; initThetaDotA; initThetaDotB]);

thetaA = Y(:,1);
thetaB = Y(:,2);
thetaDotA = Y(:,3);
thetaDotB = Y(:,4);
PEA = mA*g*rA*-cos(thetaA);
PEB = mB*g*(-rA*cos(thetaA)-rB*cos(thetaB));
KEA = 1/2*mA*(rA*thetaDotA).^2;
KEB = 1/2*mB*(rA^2*thetaDotA.^2 + rB^2*thetaDotB.^2 + 2*rA*rB*thetaDotA.*thetaDotB.*cos(thetaA - thetaB));
% KEB = 1/2*mB*((rA^2*thetaDotA^2.*cos(thetaA)+rB*thetaDotB.*cos(thetaB)).^2 + (rA*thetaDotA.*sin(thetaA)+rB*thetaDotB.*sin(thetaB)).^2);
E = [PEA,PEB,KEA,KEB];
%legend('Theta_A','Velocity_A','Theta_B','Velocity_B');

    function dYdt = derivatives(~,Y)
         thetaA = Y(1);
         thetaB = Y(2);
         dThetaA = Y(3);
         dThetaB = Y(4);
         
         numeratorA = -mB*g*sin(thetaB)*cos(thetaA-thetaB) + mB*rA*dThetaA^2*sin(thetaA-thetaB)*cos(thetaA-thetaB) + mA*g*sin(thetaA) + mB*g*sin(thetaA) + mB*rB*dThetaB^2*sin(thetaA-thetaB);
         denominatorA = -mA*rA - mB*rA + mB*rA*cos(thetaA-thetaB)^2;
         ddThetaA = numeratorA/denominatorA;
         numeratorB = -g*sin(thetaB) - rA*ddThetaA*cos(thetaA-thetaB) + rA*dThetaA^2*sin(thetaA-thetaB);
         denominatorB = rB;
         
         
         ddThetaB = numeratorB/denominatorB;
         
         dYdt = [dThetaA;dThetaB;ddThetaA;ddThetaB];
    end
end
