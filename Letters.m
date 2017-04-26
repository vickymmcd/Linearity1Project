A = [-1 -1 -1 -1 -1; 
    -1 1 1 1 -1;
    -1 1 -1 1 -1;
    -1 1 1 1 -1;
    -1 1 -1 1 -1;
    -1 1 -1 1 -1; 
    -1 -1 -1 -1 -1];
% UA -> matrix of V vectors
% VA -> matrix of W vectors
% SA -> diagonal matrix of sigma values
[UA,SA,VA] = svd(A,0);

%SA1 = diag(SA(1,1) 0 0 0 0);
% A1 is V1*W1transpose
A1 = UA*diag([1 0 0 0 0])*VA';
A2 = UA*diag([0 1 0 0 0])*VA';
A3 = UA*diag([0 0 1 0 0])*VA';
 
figure(1)
colormap('gray')
subplot(2,3,1)
imagesc(A1)
subplot(2,3,2)
imagesc(A2)
subplot(2,3,3) 
imagesc(A3)
subplot(2,3,4)
imagesc(SA(1,1)*A1)
subplot(2,3,5)
imagesc(SA(1,1)*A1 + SA(2,2)*A2)
subplot(2,3,6)
imagesc(SA(1,1)*A1 + SA(2,2)*A2+SA(3,3)*A3)
 
G = [-1 1 1 1 -1; -1 1 -1 -1 -1; -1 1 -1 1 1; -1 1 -1 -1 1; -1 1 1 1 1];
[UG,SG,VG] = svd(G,0);
 
G1 = UG*diag([1 0 0 0 0])*VG';
G2 = UG*diag([0 1 0 0 0])*VG';
G3 = UG*diag([0 0 1 0 0])*VG';
G4 = UG*diag([0 0 0 1 0])*VG';
 
figure(2)
colormap('gray')
subplot(2,4,1)
imagesc(G1)
subplot(2,4,2)
imagesc(G2)
subplot(2,4,3) 
imagesc(G3)
subplot(2,4,4) 
imagesc(G4)
 
subplot(2,4,5)
imagesc(SG(1,1)*G1)
subplot(2,4,6)
imagesc(SG(1,1)*G1 + SG(2,2)*G2)
subplot(2,4,7)
imagesc(SG(1,1)*G1 + SG(2,2)*G2+SG(3,3)*G3)
subplot(2,4,8)
imagesc(SG(1,1)*G1 + SG(2,2)*G2+SG(3,3)*G3+SG(4,4)*G4)
