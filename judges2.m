%Mimics analysis of Figure 3 of "Singular Vectors' Subtle Secrets" paper
clear;clc;clf
 
labels=['R1R2R3R4R5'];
a=[ 4 4 4 1 1;
        5 5 5 1 1;
        1 2 1 4 4;
        1 1 1 5 5;
        2 2 2 5 5];
 
%Other matrices to explore and play with
%a=magic(9);
%a=rand(9);
 
%labels=['A1B2C3D4E5F6G7H8I9'];
%a=[1 .9 -.2 -.2;
%   .9  1 -.2 -.2;
%   0  0 1 .9;
%   0 0 .9 1;]
%a=a-.5*ones(size(a))
 
[u,s,v]=svd(a)%get svd; outputs, U, S, V
 
a1=s(1,1)*u(:,1)*v(:,1)';%first single rank matrix
u1v1a1=[u(:,1) v(:,1) a1]%displays u1, v1, and a1
subplot(121);hold on;grid on;
for i=1:length(a),
    labels(2*i-1:2*i);
    text(-u(i,1),-v(i,1),labels(2*i-1:2*i))%vectors are displayed negated
end
axis([0 .5 0 .5])%Change limits if needed
xlabel('others agree with')
ylabel('agrees with others')
 
 
a2=s(2,2)*u(:,2)*v(:,2)';%second single rank matrix
u2v2a2=[u(:,2) v(:,2) a2]%displays u2, v2, and a2
subplot(122);hold on;grid on;
for i=1:length(a),
    text(u(i,2),v(i,2),labels(2*i-1:2*i))
end
axis([-1 1 -1 1])%Change limits if needed
xlabel('others agree with')
ylabel('agrees with others')
 
 
a3=s(3,3)*u(:,3)*v(:,3)';%third single rank matrix
u3v3a3=[u(:,3) v(:,3) a3]%ditto
 
rank3approx=a1+a2+a3%create a rank 3 approximation
%a-approx%difference with original