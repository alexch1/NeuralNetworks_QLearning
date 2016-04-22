function [ak,max_Q,actions] = Action_selection(Sk,Qo,reward)
% This function is used to choose action given the Sk,Qo and reward.
% Possible actions: a=1:up; a=2:right; a=3:down; a=4:left;  

        % Find possible actions
        a_count = 1;
        for i = 1:4
            if reward(Sk,i) ~= -1
                actions(1,a_count) = i;
                a_count = a_count + 1;
            end
        end
        
        % Find ak = argmax(Qk(Sk,a'))
        max_Q = 0;
        for i = 1:size(actions,2)
            a_temp = actions(1,i); %Possible actions
            Qk(1,a_temp) = Qo(Sk,a_temp);
            if Qk(1,a_temp) >= max_Q
                max_Q = Qk(1,a_temp);
                ak = a_temp;
            end
        end
end

