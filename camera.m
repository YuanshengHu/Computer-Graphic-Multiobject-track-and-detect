

function [numFrames] = camera(videofilename)
%clear all; clc
%vid = videoinput('winvideo', 1, 'YUY2_640x480');%����IDΪ1������ͷ����Ƶ������Ƶ��ʽ�� YUY2_640x480�����ʾ��Ƶ�ķֱ���Ϊ640x480��
%set(vid,'ReturnedColorSpace','rgb');
%vidRes=get(vid,'VideoResolution');
%width=vidRes(1);
%height=vidRes(2);
%nBands=get(vid,'NumberOfBands');
%figure('Name', 'Matlab��������ͷ By Gougou', 'NumberTitle', 'Off', 'ToolBar', 'None', 'MenuBar', 'None');
%hImage=image(zeros(vidRes(2),vidRes(1),nBands));

%nframe = 210;            %��Ƶ��֡��
%preview(vid);            
%set(1,'visible','off');
 
%figure;
%for ii = 1: nframe
%    frame = getsnapshot(vid);
%    imwrite(frame,strcat(strcat('result',num2str(ii)), '.jpg'));
%end
%closepreview

global status;
status = 4;
global cutting_cur;
%videofilename='test.mp4'; %where you put the video file
delete('./Sequences/source/*.png');
video=VideoReader(videofilename);
numFrames=video.NumberOfFrames;
disp('Cutting images');
for i=1:numFrames
    cutting_cur = i;
    image_name=strcat('./Sequences/source/',num2str(i,'%04d'),'.png');
    frame=read(video, i);
    imwrite(frame,image_name,'png');
    frame=[];
end
