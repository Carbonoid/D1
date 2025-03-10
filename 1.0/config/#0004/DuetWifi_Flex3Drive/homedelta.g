; homedelta.g
; called to home all towers on a delta printer
;
; generated by RepRapFirmware Configuration Tool on Sat Aug 11 2018 14:16:14 GMT+0200 (CEST)
G91                        ; relative positioning
G1 S1 X475 Y475 Z475 F3600 ; move all towers to the high end stopping at the endstops (first pass)
G1 X-5 Y-5 Z-5 F1800 S2    ; go down a few mm
G1 S1 X50 Y50 Z50 F360     ; move all towers up once more (second pass)
G1 Z-5 F6000               ; move down a few mm so that the nozzle can be centred
G90                        ; absolute positioning
G1 X0 Y0 F6000             ; move X+Y to the centre