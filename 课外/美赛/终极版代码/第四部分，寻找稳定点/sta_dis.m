function stdis = sta_dis(answer,Env)
    %输入需要计算的n*6稳定点矩阵，env是环境最大容量，计算差距
    Env = repmat(Env,length(answer),1);
    logic = answer>0;
    now_env = logic.*Env;
    diff = now_env - answer;%这是距离的向量表示
    idea_num = sum(abs(diff).^2,2).^(1/2);%理想距离
    fm = sum(abs(now_env).^2,2).^(1/2);

    stdis = stand(idea_num,sum(logic,2),fm);%归一化

end
function out = stand(x,n,fm)
%归一化
    out = n.*(x.^(1./n))./fm;
end