    clc
    clear
    load task1.mat
    
    %% Initial settings
    type = 2;                                        % Can be set as 1,2,3 or 4
    gamma = 0.9;                                     % Can be set as 0.5 or 0.9
    max_trials = 3000;
    
    %% Indicates types of decay function for parameter alpha & epsilon
    Types = cell(1,4);
    Types{1,1} = '1/k';                 % k(f<=0.005)=20,  k(f>=0.5)=2
    Types{1,2} = '100/(100+k)';         % k(f<=0.005)~=2000, k(f>=0.5)=100
    Types{1,3} = '(1+log(k))/k';        % k(f<=0.005)~=1500, k(f>=0.5)=5
    Types{1,4} = '(1+5*log(k))/k';      % k(f<=0.005)~=10000,k(f>=0.5)=38
    
    %% Q-Learning processe
    [Qo,time,Delta_Q,trials] = Q_Learning(gamma,max_trials,reward,type);
    
    %% Plot the trajectory and get the optimal policy & total reward
    Title = 'Q-learning: trajectory under the optimal policy';
    [optimal_policy,total_reward,F] = Plot_trajectory(Qo,reward,Title);
    
    %% Display detialed info
    fprintf('Q-learning process is done!\n');
    fprintf('Gamma is set to be: %.1f\n',gamma);
    fprintf('The decay function for alpha & epsilon is: %s\n',Types{1,type});
    fprintf('Number of trials: %d\n',trials);
    fprintf('The value of Delta_Q: %d\n',Delta_Q);
    fprintf('Total execution time: %.2fs\n',time);
    fprintf('Total reward using optical policy is: %.f\n',total_reward);
    
    cd result
    saveas(F,['Tpye',num2str(type),'~',num2str(floor(time*1000)),...
        'ms~',num2str(floor(total_reward)),'r'],'png');
    cd ..