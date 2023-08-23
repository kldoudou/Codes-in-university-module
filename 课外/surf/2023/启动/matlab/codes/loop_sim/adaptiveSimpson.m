function [Q, err] = adaptiveSimpson(f, a, b, toler)
    % Initialize variables
    beta = 0.5;
    Q = 0;
    err = toler + 1;
    stack = struct('a', a, 'b', b, 'fa', f(a), 'fb', f(b), 'fc', f((a + b) / 2),'tol',toler);
    top = 1;
    
    while top > 0
        % Pop the top interval from the stack
        interval = stack(top);
        top = top - 1;
        
        a = interval.a;
        b = interval.b;
        fa = interval.fa;
        fb = interval.fb;
        fc = interval.fc;
        tol = interval.tol;
        % Calculate the midpoint and function values
        c = (a + b) / 2;
        fd = f((a + c) / 2);
        fe = f((c + b) / 2);
        
        % Simpson's rule approximation for the whole interval
        Q1 = (b - a) * (fa + 4 * fc + fb) / 6;
        
        % Simpson's rule approximation for subintervals
        Q2 = (c - a) * (fa + 4 * fd + fc) / 6;
        Q3 = (b - c) * (fc + 4 * fe + fb) / 6;
        
        % Estimate the error
        err = abs(Q2 + Q3 - Q1) / 15;
        
        if err <= tol
            % Error is within the tolerance, update Q and continue
            Q = Q + Q2 + Q3;
        else
            % Error is not within the tolerance, push the subintervals onto the stack
            top = top + 1;
            stack(top) = struct('a', c, 'b', b, 'fa', fc, 'fb', fb, 'fc', fe,'tol', beta.*tol);
            top = top + 1;
            stack(top) = struct('a', a, 'b', c, 'fa', fa, 'fb', fc, 'fc', fd,'tol', beta.*tol);
        end
    end
end
