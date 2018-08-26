function [mark,mark2]=mark21_points(count,Xdata,Ydata,startP,lastP)
                     hold on 
                     mark(startP:lastP-1)=0;
    for count1=startP:lastP-1
                     mark(count1)=text(Xdata(count1),Ydata(count1),"P");                     
        
    end
                     mark2=text(Xdata(lastP),Ydata(lastP),"C");
                     %saveas(gcf,sprintf('%d%s',count,'.png'));
                     hold off
%                      F(count)=getframe(gca);
%                      delete(mark);
%                      drawnow;
%                      delete(mark2);
%                 
                 
end