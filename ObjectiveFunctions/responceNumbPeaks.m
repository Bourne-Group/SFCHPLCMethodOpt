%% Function returns the number of peaks detected in the chromatogram
function numbPeaks = responceNumbPeaks(peaks, voidTime, skew)
    
    % if no peaks were detected then set the number of peaks = to 0.
    if isempty(peaks)
        numbPeaks = 0;
    else
        % If peaks have been detected, this code removes peaks that are too
        % close to the solvent front. Any peaks that are before the solvent peak
        % time + a skew will be ignored in analysis as it is bad HPLC practise.
        peaks = peaks(peaks(:,2)>(voidTime*skew),:);
        
        % Want to maximise the number of peaks so take the negative value
        % of this as the algorithm will try to minimise.
        numbPeaks = -log(size(peaks,1));
    end
end

