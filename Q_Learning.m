function [Qo,t,Delta_Q,trials] = Q_Learning(gamma,max_trials,reward,type)

tic

Qo = zeros(size(reward));                          % Initial Q value matirx
threshold = 0;                % i.e. Trial terminates condition for Delta_Q
trials = 0;

for loop = 1:max_trials
    k = 1;
    Sk = 1;
    alpha = 1;                               % Set to be any value (>0.005)
    Q_old = Qo;
    trials = trials + 1;
    while ((Sk-100)&&(alpha >= 0.005)) 
        
%% Update parameters & Select ak

        switch type
            case 1
                epsilon = 1/k;
            case 2
                epsilon = 100/(100+k);
            case 3
                epsilon = (1+log(k))/k;
            case 4
                epsilon = (1+5*log(k))/k;
        end
        if epsilon > 1
            epsilon = 1;
        end

        alpha = epsilon;
        %% Action_selection
        actions = find(reward(Sk,:)~=-1);   
        
        % Find ak = argmax(Qk(Sk,a'))
        a_index = find(Qo(Sk,actions)==max(Qo(Sk,actions)));
        ak = actions (a_index(1));
%         clear a_index;
        
        %% Choose ak using the exploration probability
        if rand < epsilon
           ak_temp = actions(find(actions~=ak));
           t = ak_temp(randperm(length(ak_temp)));
           ak = t(1,1);
%            clear ak_temp;
%            clear t;
        end
        %% Apply action
        r_next = reward(Sk,ak);                % Find the rk+1 and the Sk+1
        switch ak                                       % Update the new Sk
            case 1
                Sk_next = Sk - 1;
            case 2
                Sk_next = Sk + 10;
            case 3
                Sk_next = Sk + 1;
            case 4
                Sk_next = Sk - 10;
        end
        
        %% Udpate Q-value and find Sk+1
        max_Q = max(Qo(Sk_next,:));
        Q_E = r_next + gamma * max_Q;
        Q_temp = Qo(Sk,ak);
        Qo(Sk,ak) = Q_temp + alpha*(Q_E-Q_temp);
        % Next loop
        Sk = Sk_next;
        k = k+1;
        
%         clear actions;
        
    end
    
    Delta_Q = sum(sum(abs(Qo-Q_old)));
    if Delta_Q <= threshold
        break;
    end
%                                                         toc% For test only
end

t = toc;

end




