function SetBypassMode(awgSlot, awgChannel)

if (nargin < 1)
    awgSlot = 2;
end

if nargin < 2
    awgChannel = 1;
end

chassisNum = 1;

magicEnumToPlayWaveformWithoutFlatnessCorr = 7;

% Load Visual Studio Library
NET.addAssembly('C:/Program Files (x86)/Keysight/SD1/Libraries/VisualStudio.NET/KeysightSD1.dll');

 
%Open the AWG
myAWG = KeysightSD1.SD_AOU();
myAWG.open('M3202', chassisNum, awgSlot);  % chassis, slot

myAWG.channelWaveShape(awgChannel, magicEnumToPlayWaveformWithoutFlatnessCorr); % channel, waveshape 
 
myAWG.close();
