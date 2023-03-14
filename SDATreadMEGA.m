function A = SDATreadMEGA(filename, da_xres, da_yres)

% Open file to read reference scan data.
fid = fopen(filename, 'rb', 'ieee-le');
if fid == -1
    fclose(fid);
    error('Unable to locate file %s', filename);
end

% Set up a structure to take the data:
totalframes = 1;
totalpoints = totalframes * da_xres * da_yres * 2;

raw_data = freadVAXG(fid, totalpoints, 'float');

TempData = reshape(raw_data, [2 da_xres da_yres]);
A = squeeze(complex(TempData(1,:,:), TempData(2,:,:)));
fclose(fid);

end