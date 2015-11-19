function res = derivatives(~,S)
    g = 9.8;
    k = 100;
    l0 = 1;
    m = 1;
    x = -1;
    y = -1;
    vx = 0;
    vy = 0;

    ax = -k*(sqrt(x^2+y^2)-l0)*x/sqrt(x^2+y^2)/m;
    ay = -k*(sqrt(x^2+y^2)-l0)*y/sqrt(x^2+y^2)/m - g;

    res = [vx;vy;ax;ay];
    end