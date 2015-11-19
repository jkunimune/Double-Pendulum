function diagnostic7()
    g = 9.8;
    k = 100;
    l0 = 1;
    m = 1;
    x0 = -1;
    y0 = -1;
    vx0 = 0;
    vy0 = 0;

    [~,Y] = ode45(@derivatives, [0,5], [x0;y0;vx0;vy0]);
    comet(Y(:,1), Y(:,2));

    function res = derivatives(~,S)
        x = S(1);
        y = S(2);
        vx = S(3);
        vy = S(4);

        ax = -k*(sqrt(x^2+y^2)-l0)*x/sqrt(x^2+y^2)/m;
        ay = -k*(sqrt(x^2+y^2)-l0)*y/sqrt(x^2+y^2)/m - g;

        res = [vx;vy;ax;ay];
    end
end 