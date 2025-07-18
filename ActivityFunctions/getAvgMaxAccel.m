function [avgAccel, maxAccel] = getAvgMaxAccel(filename)
    load(filename);  % loads Acceleration

    X = Acceleration.X;
    Y = Acceleration.Y;
    Z = Acceleration.Z;

    accMag = sqrt(X.^2 + Y.^2 + Z.^2);
    accMag = accMag - mean(accMag);  % remove gravity

    avgAccel = mean(abs(accMag));
    maxAccel = max(abs(accMag));
end