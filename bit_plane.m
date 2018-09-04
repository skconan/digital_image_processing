A=imread('C:\Users\skconan\Desktop\Workspace\digital_image_processing\images\bill.jpg');
A = rgb2gray(A);
imshow(A);
B=bitget(A,1);
figure,
subplot(4,2,1);imshow(logical(B));title('Bit plane 1');

B=bitget(A,2);
subplot(4,2,2);imshow(logical(B));title('Bit plane 2');

B=bitget(A,3);
subplot(4,2,3);imshow(logical(B));title('Bit plane 3');


B=bitget(A,4);
subplot(4,2,4);imshow(logical(B));title('Bit plane 4');

B=bitget(A,5);
subplot(4,2,5);imshow(logical(B));title('Bit plane 5');

B=bitget(A,6);
subplot(4,2,6);imshow(logical(B));title('Bit plane 6');

B=bitget(A,7);
subplot(4,2,7);imshow(logical(B));title('Bit plane 7');


B=bitget(A,8);
subplot(4,2,8);imshow(logical(B));title('Bit plane 8');
