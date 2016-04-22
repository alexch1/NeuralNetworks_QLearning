function value = Parameters_updating_task2(k, type)
% This function is to update parameters (i.e. epsilon & alpha) given the k. 

% When k = 0, we assign that value = 1; 
% Otherwise:
%   type1: 1/k;
%   type2: 100/(100+k);
%   type3: (1+log(k))/k;
%   type4: (1+5*log(k))/k;
     
    switch type
        case 1
            value = 1/k;
        case 2
            value = 100/(100+k);
        case 3 
            value = (1+log(k))/k;
        case 4
            value = (1+5*log(k))/k;
        case 5
            value = 200/(200+k);
    end
    if value > 1
        value = 1;
    end
end

