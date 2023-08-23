function out = alphafun(P,T,name)
    switch name
        case 'amar'
            PI = 30;
            TI = 400;
        case 'aris'
            PI = 20;
            TI = 300;
    end
    inside = (P./PI)*(T./TI);
    out = tanh(inside);
end