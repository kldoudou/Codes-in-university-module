function [bool,colour] = backtracking(G,m,colour,v)
%G the graph G
%m colours
%colour the colours of the vertices which has been coloured
if(all(colour))
    bool = 1;
    return
else
    while colour(v)<m
        colour(v) = colour(v)+1;
        if Can(G,v,colour)
            [bool,colour] = backtracking(G,m,colour,v+1);
            if bool
                return
            end
        end
    end
    colour(v) = 0;
    bool = 0;
    return
end
end