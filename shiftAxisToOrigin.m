function newFigHandle = shiftAxisToOrigin(axHandle)
% SHIFTAXISTOORIGIN Shifts the x-axis and y-axis of a plot so that they intersect at the origin (0,0)
% and extends the axis limits by 10%.

% Validate input
if ~ishandle(axHandle) || ~strcmp(get(axHandle,'type'),'axes')
    error('Input must be an axes handle.');
end

% Create a new figure and copy the axes to it
newFigHandle = figure('Name', 'Shifted Axis to Origin', 'NumberTitle', 'off');
newAxesHandle = copyobj(axHandle, newFigHandle);
% Set the 'NextPlot' property to 'add' to retain the plot after adjusting axes
set(newFigHandle, 'NextPlot', 'add');

% Get tick values and labels from the original axes
xTicks = get(axHandle, 'XTick');
yTicks = get(axHandle, 'YTick');
xTickLabels = get(axHandle, 'XTickLabel');
yTickLabels = get(axHandle, 'YTickLabel');
xLimOriginal = get(axHandle, 'XLim');
yLimOriginal = get(axHandle, 'YLim');
xLabel = get(axHandle, 'XLabel');
yLabel = get(axHandle, 'YLabel');
titleText = get(get(axHandle, 'Title'), 'String');
fontSize = get(axHandle, 'FontSize');

% Extend the axis limits by 10%
xLimNew = extendLimits(xLimOriginal);
yLimNew = extendLimits(yLimOriginal);

% Set ticks, labels, and limits on the new axes
set(newAxesHandle, 'XTick', xTicks, 'YTick', yTicks);
set(newAxesHandle, 'XTickLabel', xTickLabels, 'YTickLabel', yTickLabels);
set(newAxesHandle, 'XLim', xLimNew, 'YLim', yLimNew);
set(newAxesHandle, 'XLabel', xLabel, 'YLabel', yLabel);
set(newAxesHandle, 'FontSize', fontSize);
set(newAxesHandle, 'Box', 'off', 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');

% Set title
title(newAxesHandle, titleText);

    function lims = extendLimits(lims)
        % Extend the limits by 10%
        delta = diff(lims) * 0.1;
        lims = [lims(1) - delta, lims(2) + delta];
    end
end
