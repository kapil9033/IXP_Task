clear all
clc
%%
%This part will import data from TXT file, create 2 array name Xdata, Ydata
%in Double datatypes.
txtData=importdata('mousePos.txt');
[rw,clm]=size(txtData);
Xdata(rw)=0;
Ydata(rw)=0;
Time(rw)=0;
for count=1:rw
    Data=char(txtData(count));
    Xdata(count)=str2double (Data(( (strfind(Data,'x:'))+2 : strfind(Data,'y:')-1 ) ) ) ;
    Ydata(count)=str2double (Data(( (strfind(Data,'y:'))+2 :  strfind(Data,'screen:')-1 )  ) );
    Time(count)=str2double (Data(( (strfind(Data,'Timestamp:'))+10 :  strfind(Data,', Mouse')-1 )  ) ); 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%Read and show image
 Img=imread('Desktop.png');
 H=imshow(Img);
 hold on
 %%
 %Start marking point by point.
for count=1:21:rw
    if ((count+20)>rw && (count+20)>rw)
            [mark,mark2]=mark21_points(count,Xdata,Ydata,count,rw);
    else
           [mark,mark2]=mark21_points(count,Xdata,Ydata,count,count+20);
    end
              
            F(count)=getframe(gca);
            drawnow;
            delete(mark);
            delete(mark2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% % %This part create Video fom saved Frame.
% % %In video 'P' represent previous points
% % %In video 'C' represent current points.
  writerObj = VideoWriter('myVideo.avi');
  writerObj.FrameRate = 10;
% % %set the seconds per image
% % %open the video writer
open(writerObj);
% % % %write the frames to the video
for i=1:length(F)
% % %   convert the image to a frame
    if isempty(F(i).cdata)
    else
        frame = F(i) ;    
        writeVideo(writerObj, frame);
    end
end
% % %close the writer object
close(writerObj);




