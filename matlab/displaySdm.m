function displaySdm()

    hFigureHandle = generateFigure(15,8);
 
    if(exist('ComputeFeature') ~=2)
        error('Please add the ACA scripts (https://github.com/alexanderlerch/ACA-Code) to your path!');
    end
    
    [cPath, cName]  = fileparts(mfilename('fullpath'));
    cOutputFilePath = [cPath '/../graph/' strrep(cName, 'display', '')];
 
     
    % generate sample data
    [tx,x,t,pcd,mfcc,pc,acf,parts,labels] = generateStructureData([cPath '/../audio/structure-example.mp3']);

    pcd = (pdist2(pcd',pcd'));
    pc = (pdist2(pc',pc'));
    mfcc = (pdist2(mfcc',mfcc'));
    acf = (pdist2(acf',acf'));

    pcdn = pcd/max(max(pcd));
    pcn = pc/max(max(pc));
    mfccn = mfcc/max(max(mfcc));
    acfn = acf/max(max(acf));

    fi(1)=subplot(221);
    imagesc(t,t,pcn)
    title('PC')
    ylabel('t [s]')
    colormap(jet)
    hold on;
    
    fi(2)=subplot(222);
    imagesc(t,t,mfccn)
    title('MFCCs')
    colormap(jet)
    hold on;
    
    fi(3)=subplot(223);
    imagesc(t,t,pcdn)
    title('$\Delta$PC')
    xlabel('t [s]')
    ylabel('t [s]')
    colormap(jet)
    hold on;
    
    fi(4)=subplot(224);
    imagesc(t,t,acfn)
    title('ACF')
    xlabel('t [s]')
    colormap(jet)
    hold on;
    
    printFigure(hFigureHandle, [cOutputFilePath '_0'])
 
    fi(1)=subplot(221);
    imagesc(t,t,pcn.^2)
    title('PC (square)')
    ylabel('t [s]')
    colormap(jet)
    hold on;
    
    fi(2)=subplot(222);
    imagesc(t,t,mfccn.^2)
    title('MFCCs (square)')
    colormap(jet)
    hold on;
    
    fi(3)=subplot(223);
    imagesc(t,t,pcdn.^2)
    title('$\Delta$PC (square)')
    xlabel('t [s]')
    ylabel('t [s]')
    hold on;
    
    fi(4)=subplot(224);
    imagesc(t,t,acfn.^2)
    title('ACF (square)')
    xlabel('t [s]')
    colormap(jet)
    hold on;
    
    printFigure(hFigureHandle, [cOutputFilePath '_1'])

    fi(1)=subplot(221);
    imagesc(t,t,sqrt(pcn))
    title('PC (sqrt)')
    ylabel('t [s]')
    colormap(jet)
    hold on;
    
    fi(2)=subplot(222);
    imagesc(t,t,sqrt(mfccn))
    title('MFCCs (sqrt)')
    colormap(jet)
    hold on;
    
    fi(3)=subplot(223);
    imagesc(t,t,sqrt(pcdn))
    title('$\Delta$PC (sqrt)')
    xlabel('t [s]')
    ylabel('t [s]')
    colormap(jet)
    hold on;
    
    fi(4)=subplot(224);
    imagesc(t,t,sqrt(acfn))
    title('ACF (sqrt)')
    xlabel('t [s]')
    colormap(jet)
    hold on;
    
    printFigure(hFigureHandle, [cOutputFilePath '_2'])

    fi(1)=subplot(221);
    imagesc(t,t,atan((pcn-.5)*10)/pi+.5)
    title('PC (atan)')
    ylabel('t [s]')
    colormap(jet)
    hold on;
    
    fi(2)=subplot(222);
    imagesc(t,t,atan((mfccn-.5)*10)/pi+.5)
    title('MFCCs (atan)')
    colormap(jet)
    hold on;
    
    fi(3)=subplot(223);
    imagesc(t,t,atan((pcdn-.5)*10)/pi+.5)
    title('$\Delta$PC (atan)')
    xlabel('t [s]')
    ylabel('t [s]')
    colormap(jet)
    hold on;
    
    fi(4)=subplot(224);
    imagesc(t,t,atan((acfn-.5)*10)/pi+.5)
    title('ACF (atan)')
    xlabel('t [s]')
    colormap(jet)
    hold on;
    
    printFigure(hFigureHandle, [cOutputFilePath '_3'])

    fi(1)=subplot(221);
    imagesc(t,t,pcn)
    title('PC')
    ylabel('t [s]')
    colormap(jet)
    hold on;
    
    fi(2)=subplot(222);
    imagesc(t,t,mfccn)
    title('MFCCs')
    colormap(jet)
    hold on;
    
    fi(3)=subplot(223);
    imagesc(t,t,pcdn)
    title('$\Delta$PC')
    xlabel('t [s]')
    ylabel('t [s]')
    colormap(jet)
    hold on;
    
    fi(4)=subplot(224);
    imagesc(t,t,acfn)
    title('ACF')
    xlabel('t [s]')
    colormap(jet)
    hold on;

            myColorMap  = [
%                             0                         0                         0
                          0.75                      0.75                         0
                             234/256                    170/256                 0
                             0                         0                         1
                             1                         0                         0
                             0                       0.5                         0
                             0                      0.75                      0.75
                          0.75                         0                      0.75
                          0.25                      0.25                      0.25];
 


    for (i = 1: size(parts,1))
        mycolor = myColorMap(mod(parts(i,1),size(myColorMap,1)),:);
        for (f = 1:4)
            plot(fi(f),[parts(i,2) parts(i,3)], [parts(i,2) parts(i,3)],'color',mycolor);
            for (k=1:size(parts,1))
                if (parts(i,1)~= parts(k,1)||i==k)
                    continue;
                end
                plot(fi(f),[parts(i,2) parts(i,3)], [parts(k,2) parts(k,3)],'color',mycolor);
            end
        end
        for (f = 1:4)
            plot(fi(f),[parts(i,2) parts(i,3)], [parts(i,2) parts(i,3)],'color',mycolor);
        end
        
    end
    printFigure(hFigureHandle, [cOutputFilePath '_4'])

end
