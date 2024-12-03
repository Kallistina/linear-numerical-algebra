%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      Method: PSD                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc; clear; format long;
max_iterations = 100;
A=[];

fprintf('Please, choose one of the following options: \n');
fprintf('Enter 1 to create a pentadiagonal matrix with parameters of your choice \n');
fprintf('Enter 2 to create a pentadiagonal matrix with specific parameters \n');
fprintf('Enter 3 to import a matrix from a file \n');
fprintf('Enter 4 to create a random strict diagonally dominant matrix \n\n');
option = input(' Your Option: ');

if(option == 1)
    A = option1; 
elseif (option == 2)
    A = option2; 
elseif(option == 3)
    A = option3;
elseif(option == 4)
    A = option4;
end

n = size(A, 1);
x = ones(n,1);
b = A*x;

min_radius = +Inf;
fprintf("Calculating solution of linear system Ax=b with ESOR method and using x0=b ...\n");
for t=0.1:0.1:1.9
    for w=0.1:0.1:1.9
        radius = find_radius(A, n, t, w, 1);
        if((radius<min_radius) || ((t==0.1) && (w==0.1)))
            min_radius = radius;
            t_opt = t;
            w_opt = w;
        end
    end
end

starttime = tic;
e =  0.5*(10^(-6));
itcount=0;
solution = b;
Ux = zeros(n,1);
while(itcount< max_iterations)
    temp = zeros(n,1);
    temp2 = zeros(n,1);%to proto for loop einai idio me tin esor
    for i = 1:n % epanaliptiki methodos akolouthontas to sxima tou Niehthammer
        if i > 2 && i <= n-2
            Ux(i) = dot(-A(i,i+1:i+2)/A(i,i),solution(i+1:i+2)'); 
            temp2(i) = (1-t_opt)*solution(i) + w_opt*dot(-A(i,i-2:i-1)/A(i,i), temp2(i-2:i-1)') + (t_opt-w_opt)*dot(-A(i,i-2:i-1)/A(i,i),solution(i-2:i-1)') + t_opt*Ux(i) + (t_opt*b(i)/A(i,i));                    
        elseif i <=2
            Ux(i) = dot(-A(i,i+1:i+2)/A(i,i),solution(i+1:i+2)'); 
            temp2(i) = (1-t_opt)*solution(i) + w_opt*dot(-A(i,1:i-1)/A(i,i), temp2(1:i-1)') + (t_opt-w_opt)*dot(-A(i,1:i-1)/A(i,i),solution(1:i-1)') + t_opt*Ux(i) + (t_opt*b(i)/A(i,i));
        elseif i == n-1
            Ux(i) = dot(-A(i,n)/A(i,i),solution(n)); 
            temp2(i) = (1-t_opt)*solution(i) + w_opt*dot(-A(i,i-2:i-1)/A(i,i), temp2(i-2:i-1)') + (t_opt-w_opt)*dot(-A(i,i-2:i-1)/A(i,i),solution(i-2:i-1)') + t_opt*Ux(i) + (t_opt*b(i)/A(i,i));
        else
            Ux(i) = 0; 
            temp2(i) = (1-t_opt)*solution(i) + w_opt*dot(-A(i,i-2:i-1)/A(i,i), temp2(i-2:i-1)') + (t_opt-w_opt)*dot(-A(i,i-2:i-1)/A(i,i),solution(i-2:i-1)') + (t_opt*b(i)/A(i,i));
        end
     end
               
     for i = n:-1:1
        if i > 2 && i <= n-2
            temp(i) = temp2(i) + w_opt*(dot(-A(i,i+1:i+2)/A(i,i),temp(i+1:i+2)') - Ux(i));
        elseif i <=2
            temp(i) = temp2(i) + w_opt*(dot(-A(i,i+1:i+2)/A(i,i),temp(i+1:i+2)') - Ux(i));
        elseif i == n-1
            temp(i) = temp2(i) + w_opt*(dot(-A(i,n)/A(i,i),temp(n)) - Ux(i));
        elseif i == n
            temp(i) = temp2(i);
        end
     end 
     itcount = itcount+1;
     if norm(temp-solution, +Inf) < e
        break;
     else
        solution = temp;
     end
end  
x= solution;
endtime = toc(starttime);

fprintf("Optimal value of t:"); disp(t_opt);
fprintf("Optimal value of w:"); disp(w_opt);
fprintf("itcount:"); disp(itcount);
fprintf("radius of iterative matrix:"); disp(min_radius);

if(itcount < max_iterations)
    fprintf("Approximate solution for the given linear system was found with the aforementioned optimal values for t and w\n");
else
    fprintf("Approximate solution for the given linear system was not found. \n\n");
end

fprintf("PSD Execution Time: "); disp(endtime);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      End of File                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%