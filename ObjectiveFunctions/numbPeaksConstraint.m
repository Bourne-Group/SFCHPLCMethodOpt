function indexs = numbPeaksConstraint(x, val)
    indexs = exp(-x) >= val;
end