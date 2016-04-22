function [optimal_policy,total_reward,F] = Plot_trajectory(Qo,reward,Title)

% Find optimal policy and total reward
index = 1;
Sk(1,index) = 1;
while ((Sk(1,index)-100)&&(index<100))
    [ak_temp,~,~] = Action_selection(Sk(1,index),Qo,reward);
    a(1,index) = ak_temp;
    switch a(1,index)
        case 1
            Sk(1,index+1) = Sk(1,index) - 1;
        case 2
            Sk(1,index+1) = Sk(1,index) + 10;
        case 3
            Sk(1,index+1) = Sk(1,index) + 1;
        case 4
            Sk(1,index+1) = Sk(1,index) - 10;
    end
    index = index + 1;
end

optimal_policy = Sk';
total_reward = 0;
for i = 1:size(optimal_policy,1)-1
    total_reward = total_reward + Qo(optimal_policy(i,1),a(1,i));
end

% Plot trajectory
F = figure;
% disp(['figure DONE!']);
% set(F,'Numbertitle','off');
    
grid on
axis([0 10 0 10])
set(gca,'xticklabel',[], 'yticklabel',[])
title(Title);
for i = 1:size(Sk,2)-1
    index_x = fix((Sk(1,i)-0.1)/10)+1;
    index_y = mod(Sk(1,i),10);
    if index_y == 0
        index_y = 10;
    end
    switch a(1,i)
        case 1
            text(index_x - 0.6, 10.5 - index_y, '^','FontSize', 20);
            
        case 2
            text(index_x - 0.6, 10.5 - index_y, '>','FontSize', 20);
            
        case 3
            text(index_x - 0.6, 10.5 - index_y, 'v','FontSize', 20);
            
        case 4
            text(index_x - 0.6, 10.5 - index_y, '<','FontSize', 20);
            
    end
end
text(9.4, 0.5, 'o', 'FontSize', 20);

end


