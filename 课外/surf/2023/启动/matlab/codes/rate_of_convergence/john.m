ga=0.5;beta=0.5;sige=0.5;
I_star = [0,1];
M_star = [];


function [IL,IR,nita] = P(I,nita_I,beta)
    middle = sum(I)/2;
    IL = [I(1),middle];
    IR = [middle,I(2)];
    nita = beta*nita_I;
end