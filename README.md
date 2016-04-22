# NeuralNetworks_QLearning
##### Holding my CA scripts.

The task 1 consists of 4 main parts, as implemented in task1_mian.m, Q_Learning.m, Plot_trajectory.m and Dynamic_programming.m respectively.
For Q_Learning.m, this function is to do the Q-learning process. 
- 1) initialize the parameters.
- 2) For each trial: select action, apply action and then update Q-value matrix.
- 3) Continue training until the terminates condition is fulfilled.

For Plot_trajectory.m, this function is to extract optimal policy and then plot trajectory of the optimal policy. <br />
For task1_mian.m, this script is the main script for above-mentioned two functions, and it calls them to execute and receive some values from them, such as the Q- value matix Qo and the total execution time. All output trajectories will be saved to the folder called ‘/result’ and each figure will be named by the information such as its execution time, total reward etc. For example, ‘Tpye2~870ms~54256r.png’. <br />
For Dynamic_programming.m, this function is to verify the results given by Q- Learning algorithm using dynamic programming method, the result of this function will also be shown in RESULTS & ANALYSIS part. <br />
The main script for task 2 is named as RL_main.m, you can run it for testing the performance of my code. The plot figure will be shown to you after running, and it will also be saved to ‘/result’ folder named with the information about execution time and total reward. For example, ‘qevaltest2~17246ms~54256reward.png’.

