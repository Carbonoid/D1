; bed.g
; called to perform automatic delta calibration via G32
;
; generated by RepRapFirmware Configuration Tool on Sun Aug 12 2018 17:15:50 GMT+0200 (CEST)
M561 ; clear any bed transform
G28  ; home all towers
; Probe the bed at 12 peripheral and 3 halfway points, and perform 4-factor auto compensation
; Before running this, you should have set up your Z-probe trigger height to suit your build, in the G31 command in config.g.
G30 P0 X0 Y144.9 H0 Z-99999
G30 P1 X72.45 Y125.49 H0 Z-99999
G30 P2 X125.49 Y72.45 H0 Z-99999
G30 P3 X144.9 Y0 H0 Z-99999
G30 P4 X125.49 Y-72.45 H0 Z-99999
G30 P5 X72.45 Y-125.49 H0 Z-99999
G30 P6 X0 Y-144.9 H0 Z-99999
G30 P7 X-72.45 Y-125.49 H0 Z-99999
G30 P8 X-125.49 Y-72.45 H0 Z-99999
G30 P9 X-144.9 Y0 H0 Z-99999
G30 P10 X-125.49 Y72.45 H0 Z-99999
G30 P11 X-72.45 Y125.49 H0 Z-99999
G30 P12 X0 Y72.4 H0 Z-99999
G30 P13 X62.7 Y-36.2 H0 Z-99999
G30 P14 X-62.7 Y-36.2 H0 Z-99999
G30 P15 X0 Y0 H0 Z-99999 S4
; Use S-1 for measurements only, without calculations. Use S4 for endstop heights and Z-height only. Use S6 for full 6 factors
; If your Z probe has significantly different trigger heights depending on XY position, adjust the H parameters in the G30 commands accordingly. The value of each H parameter should be (trigger height at that XY position) - (trigger height at centre of bed)