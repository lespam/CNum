clear all;   close all;   clc;
%ejercicio_37

mySvd = @(A)  mSvdEco(A);


RGB = imread('small.jpg');

figure(1);
imshow(RGB);



figure(2);
A = [RGB(:,:,1); RGB(:,:,2); RGB(:,:,3)];
[m,n] = size(A);
fprintf('max-rank %g\n', min(m,n));

m = m/3;
A = double(A); % for svd routine
[U,S,V] = mySvd(A);

rmax = numel(diag(S));
fprintf('numerical-rank %g\n', rmax);
%for r = 1
for r = [1,10,ceil(0.1*rmax), ceil(0.25*rmax)]
	fprintf('current-rank %g\n', r);
	% reconstruct image
	B = U(:,1:r)*S(1:r,1:r)*V(:,1:r)';

	% convert image for display
	B = uint8(B);
	C = cat(3, B(1:m,:), B(m+1:2*m,:), B(2*m+1:3*m,:));
	h = imshow(C);
    
	pause
end

