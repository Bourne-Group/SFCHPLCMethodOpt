function indexs = rscritConstraint(x, val)
    indexs = exp(-x) >= val;
end