clc
clear
load task1.mat

%% Initial settings 
gamma = 0.9;                                    % Can be set as 0.5 or 0.9
Delta_Q = 0;

%% Dynamic programming process
tic
trials = 0;
Qo = zeros(size(reward));
while (trials < 1000)
    Q_old = Qo;
    for S = 1:100
        [~,~,actions] = Action_selection(S,Qo,reward);
        for j = 1:size(actions,2)
            r_next = reward(S,actions(1,j));
            switch actions(1,j)
                case 1
                    S_next = S - 1;
                case 2
                    S_next = S + 10;
                case 3
                    S_next = S + 1;
                case 4
                    S_next = S - 10;
            end
            [~,max_Q,~] = Action_selection(S_next,Qo,reward);
            Qo(S,actions(1,j)) = reward(S,actions(1,j)) + gamma*max_Q;
        end
    end
    trials = trials + 1;
    if sum(sum(abs(Qo - Q_old))) <= Delta_Q
        break;
    end
end
time = toc;

%% Plot the trajectory and get the optimal policy & total reward
Title = 'Dynamic programming: trajectory under the optimal policy';
[optimal_policy,total_reward,F] = Plot_trajectory(Qo,reward,Title);

cd ../result/DynamicProgramming
    
    saveas(F,['~',num2str(floor(time*1000)),'ms~',num2str(floor(total_reward)),'r'],'png');%%%%%%%%
    
cd ../../DynamicProgramming

%% Display detialed info
fprintf('Dynamic programming process is done!\n');
fprintf('Gamma is set to be: %.1f\n',gamma);
fprintf('Number of trials: %d\n',trials);
fprintf('Total execution time: %.2fs\n',time);
fprintf('Total reward using optical policy is: %.f\n',total_reward);