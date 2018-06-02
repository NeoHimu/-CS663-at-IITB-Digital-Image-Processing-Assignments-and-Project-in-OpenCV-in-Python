function Q3

%load image
I = load('../data/image_low_frequency_noise.mat');
im=I.Z;

%perform fast fourier transform on image
imF=fft2(im);
figure, imshow(im,[]), title('Original Image');
pause(2);
%displaying the log magnitude of fourier transform of image. Part a)
figure, imshow(log(abs(fftshift(imF))+1),[]), title('FFT of OrigianlImage');
pause(2);

%two extra peaks which correspond to the frequency of periodic noise.
r1=119+129-1;
c1=124+129-1;
r2=139-129+1;
c2=134-129+1;

%cutoff frequency D0
D0=4;

%setting extra peaks to 0 
for i=-D0+1:D0-1
	for j=-D0+1:D0-1

		imF(r1+i,c1+j)=0;
		imF(r2+i,c2+j)=0;

	end
end
imF(r1-D0,c1)=0;
imF(r1+D0,c1)=0;
imF(r1,c1-D0)=0;
imF(r1,c1+D0)=0;

imF(r2-D0,c2)=0;
imF(r2+D0,c2)=0;
imF(r2,c2-D0)=0;
imF(r2,c2+D0)=0;



%Restored Image
RI=ifft2(imF);
figure, imshow(RI,[]), title('Restored Image');
pause(2);


%Log of Fourier Transform of restored image

figure, imshow(log(abs(fftshift(imF))+1),[]), title('FFT of RestoredImage');

end
