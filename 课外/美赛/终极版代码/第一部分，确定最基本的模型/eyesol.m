function y = eyesol(param,xdata)
%param(1) is Env
%param(2) is constant C
%param(3) is rate Rate
%known(1) is alpha
%known(2) is input t
    y=(0.462).*param(1)./(param(2).*exp(-param(3).*xdata)+1);
end