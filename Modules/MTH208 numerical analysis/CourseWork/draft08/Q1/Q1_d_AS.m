function [Ic,Is] = Q1_d_AS(tol)
% Adapt Simpson with loop
fc = @(t) 2.*cos(t.^2);
fs = @(t) 2.*sin(t.^2);
[Ic,~,~] = loopsimp(fc,[0,1],tol);
[Is,~,~] = loopsimp(fs,[0,1],tol);
end