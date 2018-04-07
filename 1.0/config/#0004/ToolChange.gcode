; ====================== Tool Change BEGIN =======================
; all settings optimized for a 60 mm PTFE tube used on hotend side
;
G91             ; Relative Coordinates
G1 E-30 F4800   ; Fast Retract 30mm 50mm/s
G1 Z+1 F2000    ; Lift Z 1mm for Tool Change 33mm/s
G1 Y65 F4800    ; Move X Y for tool change
G90             ; Absolute Coordinates
;
; select current tool
T[old_tool]     ; Select Old Tool
G92 E0          ; Zero Extruder
G91             ; Relative Coordinates
;
; perform extraction & reshaping
G1 E20 F3000    ; Fast Reinsert 20mm 50mm/s
G1 E-10 F1500   ; Reshape 10mm 25mm/s
G4 P3000        ; 3s cooling period
G1 E-120 F1500  ; Long retract 100mm 25mm/s
G90             ; Absolute Coordinates
G92 E0          ; Zero Extruder
;
; select new tool
T[new_tool]     ; Select New tool
G92 E0          ; Zero Extruder
G91             ; Relative Coordinates
;
; perform fast reinsert of new filament and initial short feed
G1 E150 F3000   ; Fast insert 125mm 50mm/s
;G1 E5 F300     ; Feed s5smm 5mm/s
G92 E0          ; Zero Extruder
;
G1 Z-1 F2000 ; Return Z to resume printing
G90; Absolute Coordinates
;
; ====================== Tool Change END =========================
