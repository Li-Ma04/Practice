%% Reverting to pre 2018b figure exploration
try 
    if ~verLessThan('matlab','9.5')
        % Hide Ax Toolbar:
        set(groot,'defaultAxesCreateFcn',@(ax,~)set(ax.Toolbar,'Visible','off'))
        
        % Preparing the PlotTools icons:
        icon_PT_show = double(imread(fullfile(matlabroot,'toolbox','matlab','icons','tool_plottools_show.png')))/2^16;
        icon_PT_show(icon_PT_show==0)=NaN; %Adjust Transparency in icon
        icon_PT_hide= double(imread(fullfile(matlabroot,'toolbox','matlab','icons','tool_plottools_hide.png')))/2^16;
        icon_PT_hide(icon_PT_hide==0)=NaN;%Adjust Transparency in icon
        
        % Reverting the 
        %1. 'Hide Plot Tools' icon; 
        %2. 'Show Plot Tools' icon; 
        %3. Icons of the pre 2018b toolbar
        set(groot,'defaultFigureCreateFcn',@(h,e)(cellfun(@(x)feval(x,h,e), ...
          {...
          @(h,e) uipushtool(findall(gcf, 'type', 'uitoolbar'),'TooltipString','Hide Plot Tools','ClickedCallback',...
                    @(x,y) plottools('off'),'CData',icon_PT_hide), ...
          @(h,e)uipushtool(findall(gcf, 'type', 'uitoolbar'),'TooltipString','Show Plot Tools','ClickedCallback',...
                    @(x,y) plottools('on'),'CData',icon_PT_show), ...
          @(h,e)addToolbarExplorationButtons(h)...
          })))
    end
    
catch
    warning('Something went wrong.');

end
clearvars('icon_PT_show', 'icon_PT_hide');

disp('figure config loaded')