%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                 %
%               Linear Numerical Algebra: Project 3               %
%                                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Householder QR Decomposition

clc; clear; format long;
A=[];
rng(1);

%Entering which option the user wants
fprintf('1. To give the elements of matrix row by row, please press 1.\n');
fprintf('2. To create a specific matrix, please press 2.\n');
fprintf('3. To insert a matrix from a file, please press 3.\n');
fprintf('4. To create a random matrix, please press 4.\n');
option = input('\n> Your Option: ');

%Fill A matrix based on the data the user wants
if(option == 1)
    m = input('\n> Dimension m: ');
    n = input('\n> Dimension n: ');
    for i=1:m
        for j=1:n
            A(i,j) = input('Enter element: ');
        end
    end
elseif (option == 2)
    m = 3;
    n = 3;
    A = [0 1 1; 1 2 3; 1 1 1]; %Matrix from course's notes 
elseif(option == 3)
    filename = 'ask3_my_efarmogh.txt'; % Please insert here the FILE NAME
    file = fopen(filename, 'r');
    if file == -1
        error('Error: File could not be opened. Please check the file name and path.');
    end
    B = fscanf(file, '%d');
    fclose(file);
    if length(B) < 2
        error('Error: File does not contain enough data.');
    end
    m = B(1);
    n = B(2);
    if length(B) ~= 2 + m * n
        error('Error: The number of elements in the file does not match the specified dimensions.');
    end
    A = reshape(B(3:end), [n, m])';
 elseif(option == 4)
    m = input('\n> Dimension m: ');
    n = input('\n> Dimension n: ');
    for i=1:m
        for j=1:n
            A(i,j) = randi([0 100]);
        end
    end
end

%disp(A); %If you want to see the inserted matrix

fprintf("\nCalculating Householder QR Decomposition ... \n\n");

% Calculate Q, R
tic;
Q = eye(m);
R = A;
for i = 1:min(m - 1, n)
    % Calculate Householder vector
    x = R(i:end, i);
    e1 = zeros(size(x));
    e1(1) = 1;
    v = x - sign(x(1)) * norm(x) * e1;
    v = v / norm(v);
    
    % Calculate Householder matrix
    H = eye(m);
    I = eye(length(v));
    H(i:end, i:end) = I - 2 * (v * v');
    
    % Apply Householder transformation
    R = H * R;
    Q = Q * H;
end
toc;

% Display the matrices Q and R
% fprintf("\n\nMatrix Q is:\n"); disp(Q);
% fprintf("Matrix R is:\n"); disp(R);

fprintf("Calculating Errors ... \n");

% Calculate errors
QT = Q';
QR = Q * R;
QTQ = QT * Q;
R1 = inv(R);
AR1 = A * R1;
condition = cond(R);
fprintf('\nCondR = '); disp(condition);

I = eye(n, n);
error1 = norm(A - QR, 'inf');
error2 = norm(QTQ - I, 'inf');
error3 = norm(AR1 - Q, 'inf');

fprintf('\n||A - QR|| = '); disp(error1);
fprintf('\n||Q^(T)Q - I|| = '); disp(error2);
fprintf('\n||AR^(-1) - Q|| = '); disp(error3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                 %
%                          END OF FILE                            %
%                                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%