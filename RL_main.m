clc
clear
load qeval.mat

%% Initial settings
type = 2;                                        % Can be set as 1,2,3 or 4
gamma = 0.9;                                     % Can be set as 0.5 or 0.9
max_trials = 3000;

%% Indicates types of decay function for parameter alpha & epsilon
Types = cell(1,4);
Types{1,1} = '1/k';                 
Types{1,2} = '100/(100+k)';         
Types{1,3} = '(1+log(k))/k';        
Types{1,4} = '(1+5*log(k))/k';      

%% Q-Learning processe
[Qo,time,Delta_Q,trials] = Q_Learning(gamma,max_trials,qevalreward,type);

%% Plot the trajectory and get the optimal policy & total reward
Title = 'Q-learning: trajectory under the optimal policy';
[qevalstates,total_reward,F] = Plot_trajectory(Qo,qevalreward,Title);

%% Display detialed info
fprintf('Q-learning process is done!\n');
fprintf('Gamma is set to be: %.1f\n',gamma);
fprintf('The decay function for alpha & epsilon is: %s\n',Types{1,type});
fprintf('Number of trials: %d\n',trials);
fprintf('The value of Delta_Q: %d\n',Delta_Q);
fprintf('Total execution time: %.2fs\n',time);
fprintf('Total reward using optical policy is: %.f\n',total_reward);

%% You can find the plot figure under /result folder
cd result
saveas(F,['qevaltest',num2str(type),'~',num2str(floor(time*1000)),...
    'ms~',num2str(floor(total_reward)),'reward'],'png');
cd ..