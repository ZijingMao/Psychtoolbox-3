% MelanopsinFundamentalTest
%
% Compare melanopsin fundamental generated by PTB's DefaultPhotoreceptors/FillInPhotoreceptors
% machinery to the tabulated function provided by Lucas.
%
% 11/11/13  ms   Wrote it with DHB.
% 11/15/13  dhb  Comment and clean up for insertion into PTB.

%% Clear
clear; close all;

%% Get the rod fundamental using PTB machinery
photoreceptors = DefaultPhotoreceptors('LivingHumanMelanopsin');
photoreceptors = FillInPhotoreceptors(photoreceptors);

%% Load in Lucas' melanopic efficiency function
load('T_melanopsin');

%% Make a plot
figure; clf;
set(gcf,'Position',[100 100 800 400]);
subplot(1,2,1); hold on
plot(SToWls(S_melanopsin), T_melanopsin', '-k', 'LineWidth', 2); hold on;
plot(SToWls(photoreceptors.nomogram.S),photoreceptors.energyFundamentals','r','LineWidth',1); hold on;
xlabel('Wavelength (nm)');
ylabel('Energy Sensitivity');
legend({'CIE' 'PTB'});
pbaspect([1 1 1]);
subplot(1,2,2); hold on
plot(SToWls(S_melanopsin), log10(T_melanopsin'), '-k', 'LineWidth', 2); hold on;
plot(SToWls(photoreceptors.nomogram.S),log10(photoreceptors.energyFundamentals'),'r','LineWidth',1); hold on;
xlabel('Wavelength (nm)');
ylabel('Log 10 Energy Sensitivity');
legend({'CIE' 'PTB'});
pbaspect([1 1 1]);
set(gcf, 'Color', [1 1 1]);
set(gcf, 'InvertHardCopy', 'off');
set(gcf, 'PaperPosition', [0 0 7 7]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [7 7]); %Set the paper to have width 5 and height 5.
