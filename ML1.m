x = load('ex2x.dat');
y = load('ex2y.dat');
plot(x,y,'o');
x = [ones(50,1), x];

%procedure 1
theta = zeros(2,1);
theta = theta - (0.07/50)*x'*(x*theta -y)
theta
%procedure 2
theta = zeros(2,1);
for i = 1:1500
theta = theta - (0.07/50)*x'*(x*theta -y);
end
theta



hold on
plot(x(:,2), x*theta, '-');
legend('Training data', 'Linear regression');

%procedure 3
z = 3.5*theta(2) - theta(1);
zz = 7*theta(2) - theta(1);

%3d plot
jvals = zeros(100, 100);
theta1 = linspace(-3,3,100);
theta2 = linspace(-1,1,100);
for i = 1:length(theta1)
	for j = 1:length(theta2)
	t = [theta1, theta2];
	jvals(i,j) = (1/100) * sum((x *t' -y).^2);
	end
end
jvals = jvals';
figure;
surf(theta1, theta2, jvals);
xlabel('theta1');
ylabel('theta2');

%own data lab 1
%time = [0.2 4 3.1 2.1 5 3.4 1.2 3.6 4.2 5 2 0.6 1 3 1 3 1 2 3 4 1 4.2 1.1 4.2];
%time = [time,2 4.5 3.5 2.5 2 1.5 2.4 4 2 3.1 2.4 0.6 1.1 3.2 1.4 3.5 1.2 2 3 4 1 4.2 1.1 4.2];
%time = [time,0.2 0.1];
%speed = [3.2 2.18 4.34 2.22 1.3 2.21 3.4 2.3 3.26 3.77 4.65];
%speed = [speed, 5.34 5 2.2 3.32 4.91 4.89 2.4 3.75 2.6 3.1 1.35 2.14];
%speed = [speed, 2.33 3.78 2.69 2.45 4.92 3.56 4 1.97 0.98 3.1 4.1 3.18];
%speed = [speed, 5.33 3.5 2 4.45 4.91 5.11 4.33 1.97 0.98 3.1 1.4 6.2];
%speed = [speed, 2.01 0.03 8];
