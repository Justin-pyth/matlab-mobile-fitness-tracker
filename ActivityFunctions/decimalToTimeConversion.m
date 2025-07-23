function timeConvert = decimalToTimeConversion(num)
    numFloored = floor(num);
    sec = floor((num-numFloored) * 60);
    
    if sec < 10
        timeConvert = string(numFloored) + ":0" + string(sec);
    else
        timeConvert = string(numFloored) + ":" + string(sec);
    end
end