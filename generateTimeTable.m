function timeTable = generateTimeTable(responseArray, finalHoldTime)

    %Response array: [Flow rate, gradient time, init OM,...
    % finalOM

    varNames = ["Time", "Flow", "A", "B"];
    FlowRate = responseArray(4);
    GradTime = responseArray(1);
    OMConc = responseArray(2);
    finalOM = responseArray(6);
    endHoldTime = finalHoldTime;
    
    timeTable = [];
    timeTable = [0, FlowRate, 100-OMConc, OMConc];
    timeTable = [timeTable; GradTime, FlowRate, 100-finalOM, finalOM];
    timeTable = [timeTable; GradTime + endHoldTime, FlowRate, 100-finalOM, finalOM];

    % Convert to table and return
    timeTable = array2table(timeTable, "VariableNames", varNames);

end