function bool = Can(G,v,colour)
%check whether it can use not contradiction with its neighbourhood
    N = neighbors(G,v);
    judge = colour(N) ~= colour(v);
    bool = all(judge,2);
end