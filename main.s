.autoimport
EM78P372N EQU 1
_SIMPLE_RSR_ EQU 1
.include "sysdefii.inc"
ccounter equ pr1
.stabs "icc_compiled.",60,0,0,0
.stabs "D:\Program Files (x86)\ELAN\eUIDE\V2_Plus\main.c",100,0,3,0
.stabs "int:t1=r1;-128;127;",128,0,0,0
.stabs "char:t2=r2;-128;127;",128,0,0,0
.stabs "double:t3=r1;3;0;",128,0,0,0
.stabs "float:t4=r1;3;0;",128,0,0,0
.stabs "long double:t5=r1;3;0;",128,0,0,0
.stabs "long:t6=r1;-2147483648;2147483647;",128,0,0,0
.stabs "long long:t7=r1;-2147483648;2147483647;",128,0,0,0
.stabs "short:t8=r1;-32768;32767;",128,0,0,0
.stabs "signed char:t9=r1;-128;127;",128,0,0,0
.stabs "unsigned char:t10=r1;0;255;",128,0,0,0
.stabs "unsigned long:t11=r1;0;4294967295;",128,0,0,0
.stabs "unsigned long long:t12=r1;0;4294967295;",128,0,0,0
.stabs "unsigned short:t13=r1;0;65535;",128,0,0,0
.stabs "unsigned int:t14=r1;0;255;",128,0,0,0
.stabs "void:t15=15",128,0,0,0
.stabs "bit:t16=r16;0;1;",128,0,0,0
public _delay_us
public delay_us_bp
.section ".code"
.stabs "delay_us:F15",36,0,0,_delay_us
.section ".S0",C_CODE
.SYMDEF ".S0" 
_delay_us:
.SYMDEF "_delay_us" 
mov a,ecx
mov delay_us_bp-4,a
mov a,ecx+1
mov delay_us_bp-3,a
mov a,ecx+2
mov delay_us_bp-2,a
mov a,ecx+3
mov delay_us_bp-1,a
.stabs "count:10",160,0,0,delay_us_bp+0
.stabs "i:10",128,0,0,delay_us_bp-5
.stabs "j:10",128,0,0,delay_us_bp-6
.stabn 192,0,0,L6
L6:
.stabn 68,0,69,L8
L8:
.stabn 68,0,72,L9
L9:
clr delay_us_bp-5
jmp @L$5
L$2:
.stabn 192,0,1,L10
L10:
.stabn 68,0,73,L11
L11:
.stabn 68,0,74,L12
L12:
.cfile "D:\Program Files (x86)\ELAN\eUIDE\V2_Plus\main.c(74):"
nop
.stabn 68,0,74,L13
L13:
.stabn 68,0,75,L14
L14:
.cfile "D:\Program Files (x86)\ELAN\eUIDE\V2_Plus\main.c(75):"
nop
.stabn 68,0,75,L15
L15:
.stabn 68,0,76,L16
L16:
.cfile "D:\Program Files (x86)\ELAN\eUIDE\V2_Plus\main.c(76):"
nop
.stabn 68,0,76,L17
L17:
.stabn 68,0,77,L18
L18:
.cfile "D:\Program Files (x86)\ELAN\eUIDE\V2_Plus\main.c(77):"
nop
.stabn 68,0,77,L19
L19:
.stabn 68,0,78,L20
L20:
.stabn 224,0,1,L21
L21:
L$3:
.stabn 68,0,72,L22
L22:
LDA delay_us_bp-5,0,0
add a,@1
STA delay_us_bp-5,0,0
L$5:
.stabn 68,0,72,L23
L23:
ULTRRB delay_us_bp-5,delay_us_bp+0
jbs STATUS,cf
EXTJMP @L$2
.stabn 68,0,79,L24
L24:
.stabn 224,0,0,L25
L25:
L$1:
mov a,delay_us_bp-4
mov ecx,a
mov a,delay_us_bp-3
mov ecx+1,a
mov a,delay_us_bp-2
mov ecx+2,a
mov a,delay_us_bp-1
mov ecx+3,a
ret
.STACK delay_us_bp,local,6
public _clr_ram
public clr_ram_bp
.stabs "clr_ram:F15",36,0,0,_clr_ram
.section ".S1",C_CODE
.SYMDEF ".S1" 
_clr_ram:
.SYMDEF "_clr_ram" 
mov a,ecx
mov clr_ram_bp-4,a
mov a,ecx+1
mov clr_ram_bp-3,a
mov a,ecx+2
mov clr_ram_bp-2,a
mov a,ecx+3
mov clr_ram_bp-1,a
.stabn 192,0,0,L32
L32:
.stabn 68,0,83,L33
L33:
.stabn 68,0,84,L34
L34:
mov a,@16
STA _RSR,0,0
L$27:
.stabn 192,0,1,L35
L35:
.stabn 68,0,86,L36
L36:
.stabn 68,0,87,L37
L37:
clr _R0
.stabn 68,0,88,L38
L38:
LDA _RSR,0,0
add a,@1
STA _RSR,0,0
.stabn 68,0,89,L39
L39:
EQNEPRIB _RSR,64
jbs STATUS,zf
EXTJMP @L$30
.stabn 192,0,2,L40
L40:
.stabn 68,0,90,L41
L41:
.stabn 68,0,91,L42
L42:
mov a,@96
STA _RSR,0,0
.stabn 68,0,92,L43
L43:
.stabn 224,0,2,L44
L44:
L$30:
.stabn 68,0,93,L45
L45:
.stabn 224,0,1,L46
L46:
L$28:
.stabn 68,0,93,L47
L47:
ULTRIB _RSR,0x80
jbs STATUS, cf
EXTJMP L$27
.stabn 68,0,95,L48
L48:
.stabn 224,0,0,L49
L49:
L$26:
mov a,clr_ram_bp-4
mov ecx,a
mov a,clr_ram_bp-3
mov ecx+1,a
mov a,clr_ram_bp-2
mov ecx+2,a
mov a,clr_ram_bp-1
mov ecx+3,a
ret
.STACK clr_ram_bp,local,4
public _battery_volt_sample
public battery_volt_sample_bp
.stabs "battery_volt_sample:F15",36,0,0,_battery_volt_sample
.section ".S2",C_CODE
.SYMDEF ".S2" 
_battery_volt_sample:
.SYMDEF "_battery_volt_sample" 
mov a,ecx
mov battery_volt_sample_bp-4,a
mov a,ecx+1
mov battery_volt_sample_bp-3,a
mov a,ecx+2
mov battery_volt_sample_bp-2,a
mov a,ecx+3
mov battery_volt_sample_bp-1,a
.stabn 192,0,0,L54
L54:
.stabn 68,0,98,L55
L55:
.stabn 68,0,99,L56
L56:
mov a,@1
STA _P7CR,0,2
.stabn 68,0,101,L57
L57:
bs _ADIS2,2
.stabn 68,0,102,L58
L58:
bc _ADIS1,1
.stabn 68,0,103,L59
L59:
bs _ADIS0,0
.stabn 68,0,105,L60
L60:
bs _ADRUN,4
L$51:
.stabn 68,0,106,L61
L61:
L$52:
.stabn 68,0,106,L62
L62:
jbc _ADRUN,4
EXTJMP @L$51
.stabn 68,0,107,L63
L63:
LDA _ADDATA1H,0,0
STA _g_battery_volt_h,0,0
.stabn 68,0,108,L64
L64:
LDA _ADDATA1L,0,0
STA _g_battery_volt_l,0,0
.stabn 68,0,109,L65
L65:
mov a,@0
STA _P7CR,0,2
.stabn 68,0,110,L66
L66:
.stabn 224,0,0,L67
L67:
L$50:
mov a,battery_volt_sample_bp-4
mov ecx,a
mov a,battery_volt_sample_bp-3
mov ecx+1,a
mov a,battery_volt_sample_bp-2
mov ecx+2,a
mov a,battery_volt_sample_bp-1
mov ecx+3,a
ret
.STACK battery_volt_sample_bp,local,4
public _battery_load_volt_sample
public battery_load_volt_sample_bp
.stabs "battery_load_volt_sample:F15",36,0,0,_battery_load_volt_sample
.section ".S3",C_CODE
.SYMDEF ".S3" 
_battery_load_volt_sample:
.SYMDEF "_battery_load_volt_sample" 
mov a,ecx
mov battery_load_volt_sample_bp-4,a
mov a,ecx+1
mov battery_load_volt_sample_bp-3,a
mov a,ecx+2
mov battery_load_volt_sample_bp-2,a
mov a,ecx+3
mov battery_load_volt_sample_bp-1,a
.stabn 192,0,0,L75
L75:
.stabn 68,0,114,L76
L76:
.stabn 68,0,116,L77
L77:
bs _ADIS2,2
.stabn 68,0,117,L78
L78:
bs _ADIS1,1
.stabn 68,0,118,L79
L79:
bc _ADIS0,0
.stabn 68,0,120,L80
L80:
bs _ADRUN,4
L$69:
.stabn 68,0,121,L81
L81:
L$70:
.stabn 68,0,121,L82
L82:
jbc _ADRUN,4
EXTJMP @L$69
.stabn 68,0,123,L83
L83:
mov a,@3
mov delay_us_bp+0,a
.STACK delay_us_bp,parameter,1
call _delay_us
.stabn 68,0,125,L84
L84:
bs _ADRUN,4
L$72:
.stabn 68,0,126,L85
L85:
L$73:
.stabn 68,0,126,L86
L86:
jbc _ADRUN,4
EXTJMP @L$72
.stabn 68,0,128,L87
L87:
LDA _ADDATA1H,0,0
STA _g_load_volt_h,0,0
.stabn 68,0,129,L88
L88:
LDA _ADDATA1L,0,0
STA _g_load_volt_l,0,0
.stabn 68,0,130,L89
L89:
.stabn 224,0,0,L90
L90:
L$68:
mov a,battery_load_volt_sample_bp-4
mov ecx,a
mov a,battery_load_volt_sample_bp-3
mov ecx+1,a
mov a,battery_load_volt_sample_bp-2
mov ecx+2,a
mov a,battery_load_volt_sample_bp-1
mov ecx+3,a
ret
.STACK battery_load_volt_sample_bp,local,4
public _ALLInt
public ALLInt_bp
.stabs "ALLInt:F15",36,0,0,_ALLInt
.section ".S4",C_CODE
.SYMDEF ".S4" INT:-1
_ALLInt:
.SYMDEF "_ALLInt" INT:-1
.stabn 192,0,0,L110
L110:
.stabn 68,0,133,L111
L111:
.stabn 68,0,134,L112
L112:
LDA _IntVecIdx,0,0
mov ecx,a
EQNEPRIB ecx,22
jbc STATUS,zf
EXTJMP @L$94
EQNEPRIB ecx,25
jbc STATUS,zf
EXTJMP @L$105
jmp @L$92
.stabn 192,0,1,L113
L113:
.stabn 68,0,135,L114
L114:
L$94:
.stabn 68,0,137,L115
L115:
jbs _PWM2IF,4
EXTJMP @L$93
.stabn 192,0,2,L116
L116:
.stabn 68,0,138,L117
L117:
.stabn 68,0,139,L118
L118:
bc _PWM2IF,4
.stabn 68,0,140,L119
L119:
LDA _g_time1ms_cnt,0,0
add a,@1
STA _g_time1ms_cnt,0,0
.stabn 68,0,141,L120
L120:
EQNEPRIB _g_time1ms_cnt,50
jbs STATUS,zf
EXTJMP @L$93
.stabn 192,0,3,L121
L121:
.stabn 68,0,142,L122
L122:
.stabn 68,0,143,L123
L123:
clr _g_time1ms_cnt
.stabn 68,0,144,L124
L124:
mov a,@1
STA _g_time50ms_flag,0,0
.stabn 68,0,145,L125
L125:
LDA _g_time50ms_cnt,0,0
add a,@1
STA _g_time50ms_cnt,0,0
.stabn 68,0,146,L126
L126:
EQNEPRIB _g_time50ms_cnt,4
jbs STATUS,zf
EXTJMP @L$93
.stabn 192,0,4,L127
L127:
.stabn 68,0,147,L128
L128:
.stabn 68,0,148,L129
L129:
clr _g_time50ms_cnt
.stabn 68,0,149,L130
L130:
mov a,@1
STA _g_time200ms_flag,0,0
.stabn 68,0,151,L131
L131:
EQNEPRIB _g_time2s_start,1
jbs STATUS,zf
EXTJMP @L$101
.stabn 192,0,5,L132
L132:
.stabn 68,0,152,L133
L133:
.stabn 68,0,153,L134
L134:
clr _g_time2s_start
.stabn 68,0,154,L135
L135:
clr _g_time200ms_cnt
.stabn 68,0,155,L136
L136:
clr _g_time2s_flag
.stabn 68,0,156,L137
L137:
.stabn 224,0,5,L138
L138:
jmp @L$102
L$101:
.stabn 192,0,5,L139
L139:
.stabn 68,0,158,L140
L140:
.stabn 68,0,159,L141
L141:
LDA _g_time200ms_cnt,0,0
add a,@1
STA _g_time200ms_cnt,0,0
.stabn 68,0,160,L142
L142:
.stabn 224,0,5,L143
L143:
L$102:
.stabn 68,0,162,L144
L144:
EQNEPRIB _g_time200ms_cnt,10
jbs STATUS,zf
EXTJMP @L$93
.stabn 192,0,5,L145
L145:
.stabn 68,0,163,L146
L146:
.stabn 68,0,164,L147
L147:
clr _g_time200ms_cnt
.stabn 68,0,165,L148
L148:
mov a,@1
STA _g_time2s_flag,0,0
.stabn 68,0,166,L149
L149:
.stabn 224,0,5,L150
L150:
.stabn 68,0,167,L151
L151:
.stabn 224,0,4,L152
L152:
.stabn 68,0,168,L153
L153:
.stabn 224,0,3,L154
L154:
.stabn 68,0,169,L155
L155:
.stabn 224,0,2,L156
L156:
.stabn 68,0,170,L157
L157:
jmp @L$93
L$105:
.stabn 68,0,173,L158
L158:
jbs _DT1IF,5
EXTJMP @L$93
.stabn 192,0,2,L159
L159:
.stabn 68,0,174,L160
L160:
.stabn 68,0,175,L161
L161:
mov a,@10
mov delay_us_bp+0,a
.STACK delay_us_bp,parameter,1
call _delay_us
.stabn 68,0,176,L162
L162:
ULTRIB _g_keypress_maxtime,0xc8
jbc STATUS, cf
EXTJMP L$108
.stabn 192,0,3,L163
L163:
.stabn 68,0,177,L164
L164:
.stabn 68,0,178,L165
L165:
call _battery_load_volt_sample
.stabn 68,0,179,L166
L166:
.stabn 224,0,3,L167
L167:
L$108:
.stabn 68,0,181,L168
L168:
bc _DT1IF,5
.stabn 68,0,183,L169
L169:
mov a,@1
STA _g_adc_flag,0,0
.stabn 68,0,184,L170
L170:
.stabn 224,0,2,L171
L171:
.stabn 68,0,185,L172
L172:
.stabn 68,0,186,L173
L173:
.stabn 224,0,1,L174
L174:
L$92:
L$93:
.stabn 68,0,187,L175
L175:
.stabn 224,0,0,L176
L176:
L$91:
reti
.STACK ALLInt_bp,local,0
public _PWM2P_l
public PWM2P_l_bp
.stabs "PWM2P_l:F15",36,0,0,_PWM2P_l
.section ".S5",C_CODE
.SYMDEF ".S5" LOWINT:6,21
_PWM2P_l:
.SYMDEF "_PWM2P_l" LOWINT:6,21
.stabn 192,0,0,L178
L178:
.stabn 68,0,190,L179
L179:
.stabn 68,0,191,L180
L180:
.cfile "D:\Program Files (x86)\ELAN\eUIDE\V2_Plus\main.c(191):"
MOV A,0x2
.stabn 68,0,191,L181
L181:
.stabn 68,0,192,L182
L182:
.stabn 224,0,0,L183
L183:
L$177:
reti
.STACK PWM2P_l_bp,local,0
public _PWM1D_l
public PWM1D_l_bp
.stabs "PWM1D_l:F15",36,0,0,_PWM1D_l
.section ".S6",C_CODE
.SYMDEF ".S6" LOWINT:7,24
_PWM1D_l:
.SYMDEF "_PWM1D_l" LOWINT:7,24
.stabn 192,0,0,L185
L185:
.stabn 68,0,195,L186
L186:
.stabn 68,0,196,L187
L187:
.cfile "D:\Program Files (x86)\ELAN\eUIDE\V2_Plus\main.c(196):"
MOV A,0x2
.stabn 68,0,196,L188
L188:
.stabn 68,0,197,L189
L189:
.stabn 224,0,0,L190
L190:
L$184:
reti
.STACK PWM1D_l_bp,local,0
public _led_disp
public led_disp_bp
.stabs "led_disp:F15",36,0,0,_led_disp
.section ".S7",C_CODE
.SYMDEF ".S7" 
_led_disp:
.SYMDEF "_led_disp" 
mov a,ecx
mov led_disp_bp-4,a
mov a,ecx+1
mov led_disp_bp-3,a
mov a,ecx+2
mov led_disp_bp-2,a
mov a,ecx+3
mov led_disp_bp-1,a
.stabn 192,0,0,L204
L204:
.stabn 68,0,200,L205
L205:
.stabn 68,0,201,L206
L206:
ULTRIB _g_led_light_times,0x1
jbs STATUS, cf
EXTJMP L$192
.stabn 192,0,1,L207
L207:
.stabn 68,0,202,L208
L208:
.stabn 68,0,203,L209
L209:
jbs _g_led_onoff_status,3
EXTJMP @L$194
.stabn 192,0,2,L210
L210:
.stabn 68,0,204,L211
L211:
.stabn 68,0,205,L212
L212:
EQNEPRIB _g_led_light_times,255
jbc STATUS,zf
EXTJMP @L$196
.stabn 192,0,3,L213
L213:
.stabn 68,0,206,L214
L214:
.stabn 68,0,207,L215
L215:
bc _g_led_onoff_status,3
.stabn 68,0,208,L216
L216:
.stabn 224,0,3,L217
L217:
L$196:
.stabn 68,0,210,L218
L218:
clr _g_led_onoff
.stabn 68,0,211,L219
L219:
.stabn 224,0,2,L220
L220:
jmp @L$193
L$194:
.stabn 192,0,2,L221
L221:
.stabn 68,0,213,L222
L222:
.stabn 68,0,214,L223
L223:
bs _g_led_onoff_status,3
.stabn 68,0,215,L224
L224:
mov a,@1
STA _g_led_onoff,0,0
.stabn 68,0,216,L225
L225:
DECMB _g_led_light_times,0
.stabn 68,0,217,L226
L226:
.stabn 224,0,2,L227
L227:
.stabn 68,0,218,L228
L228:
.stabn 224,0,1,L229
L229:
jmp @L$193
L$192:
.stabn 192,0,1,L230
L230:
.stabn 68,0,220,L231
L231:
.stabn 68,0,221,L232
L232:
mov a,@1
STA _g_led_onoff,0,0
.stabn 68,0,222,L233
L233:
.stabn 224,0,1,L234
L234:
L$193:
.stabn 68,0,224,L235
L235:
jbs _g_led_r,0
EXTJMP @L$198
.stabn 192,0,1,L236
L236:
.stabn 68,0,225,L237
L237:
.stabn 68,0,226,L238
L238:
LDA _g_led_onoff,0,0
mov ecx,a
bc _P70,0
jbc ecx,0
bs _P70,0
.stabn 68,0,227,L239
L239:
.stabn 224,0,1,L240
L240:
jmp @L$199
L$198:
.stabn 192,0,1,L241
L241:
.stabn 68,0,229,L242
L242:
.stabn 68,0,230,L243
L243:
bs _P70,0
.stabn 68,0,231,L244
L244:
.stabn 224,0,1,L245
L245:
L$199:
.stabn 68,0,233,L246
L246:
jbs _g_led_b,2
EXTJMP @L$200
.stabn 192,0,1,L247
L247:
.stabn 68,0,234,L248
L248:
.stabn 68,0,235,L249
L249:
LDA _g_led_onoff,0,0
mov ecx,a
bc _P71,1
jbc ecx,0
bs _P71,1
.stabn 68,0,236,L250
L250:
.stabn 224,0,1,L251
L251:
jmp @L$201
L$200:
.stabn 192,0,1,L252
L252:
.stabn 68,0,238,L253
L253:
.stabn 68,0,239,L254
L254:
bs _P71,1
.stabn 68,0,240,L255
L255:
.stabn 224,0,1,L256
L256:
L$201:
.stabn 68,0,242,L257
L257:
jbs _g_led_g,1
EXTJMP @L$202
.stabn 192,0,1,L258
L258:
.stabn 68,0,243,L259
L259:
.stabn 68,0,244,L260
L260:
LDA _g_led_onoff,0,0
mov ecx,a
com ecx
bc _P51,1
jbc ecx,0
bs _P51,1
.stabn 68,0,245,L261
L261:
.stabn 224,0,1,L262
L262:
jmp @L$203
L$202:
.stabn 192,0,1,L263
L263:
.stabn 68,0,247,L264
L264:
.stabn 68,0,248,L265
L265:
bc _P51,1
.stabn 68,0,249,L266
L266:
.stabn 224,0,1,L267
L267:
L$203:
.stabn 68,0,250,L268
L268:
.stabn 224,0,0,L269
L269:
L$191:
mov a,led_disp_bp-4
mov ecx,a
mov a,led_disp_bp-3
mov ecx+1,a
mov a,led_disp_bp-2
mov ecx+2,a
mov a,led_disp_bp-1
mov ecx+3,a
ret
.STACK led_disp_bp,local,4
public _led_ctrl_by_voltage
public led_ctrl_by_voltage_bp
.stabs "led_ctrl_by_voltage:F15",36,0,0,_led_ctrl_by_voltage
.section ".S8",C_CODE
.SYMDEF ".S8" 
_led_ctrl_by_voltage:
.SYMDEF "_led_ctrl_by_voltage" 
mov a,ecx
mov led_ctrl_by_voltage_bp-4,a
mov a,ecx+1
mov led_ctrl_by_voltage_bp-3,a
mov a,ecx+2
mov led_ctrl_by_voltage_bp-2,a
mov a,ecx+3
mov led_ctrl_by_voltage_bp-1,a
.stabs "volt_sample:13",160,0,0,led_ctrl_by_voltage_bp+0
.stabn 192,0,0,L275
L275:
.stabn 68,0,253,L276
L276:
.stabn 68,0,254,L277
L277:
ULTRIW led_ctrl_by_voltage_bp+0,0x955
jbc STATUS, cf
EXTJMP L$271
.stabn 192,0,1,L278
L278:
.stabn 68,0,255,L279
L279:
.stabn 68,0,256,L280
L280:
bs _g_led_r,0
.stabn 68,0,257,L281
L281:
bc _g_led_b,2
.stabn 68,0,258,L282
L282:
bs _g_led_g,1
.stabn 68,0,259,L283
L283:
.stabn 224,0,1,L284
L284:
jmp @L$272
L$271:
.stabn 68,0,260,L285
L285:
ULTRIW led_ctrl_by_voltage_bp+0,0xa22
jbc STATUS, cf
EXTJMP L$273
.stabn 192,0,1,L286
L286:
.stabn 68,0,261,L287
L287:
.stabn 68,0,262,L288
L288:
bs _g_led_r,0
.stabn 68,0,263,L289
L289:
bs _g_led_b,2
.stabn 68,0,264,L290
L290:
bs _g_led_g,1
.stabn 68,0,265,L291
L291:
.stabn 224,0,1,L292
L292:
jmp @L$274
L$273:
.stabn 192,0,1,L293
L293:
.stabn 68,0,267,L294
L294:
.stabn 68,0,268,L295
L295:
bc _g_led_r,0
.stabn 68,0,269,L296
L296:
bs _g_led_b,2
.stabn 68,0,270,L297
L297:
bs _g_led_g,1
.stabn 68,0,271,L298
L298:
.stabn 224,0,1,L299
L299:
L$274:
L$272:
.stabn 68,0,273,L300
L300:
bs _g_led_onoff_status,3
.stabn 68,0,274,L301
L301:
mov a,@255
STA _g_led_light_times,0,0
.stabn 68,0,275,L302
L302:
.stabn 224,0,0,L303
L303:
L$270:
mov a,led_ctrl_by_voltage_bp-4
mov ecx,a
mov a,led_ctrl_by_voltage_bp-3
mov ecx+1,a
mov a,led_ctrl_by_voltage_bp-2
mov ecx+2,a
mov a,led_ctrl_by_voltage_bp-1
mov ecx+3,a
ret
.STACK led_ctrl_by_voltage_bp,local,4
public _pwm_timer_init
public pwm_timer_init_bp
.stabs "pwm_timer_init:F15",36,0,0,_pwm_timer_init
.section ".S9",C_CODE
.SYMDEF ".S9" 
_pwm_timer_init:
.SYMDEF "_pwm_timer_init" 
mov a,ecx
mov pwm_timer_init_bp-4,a
mov a,ecx+1
mov pwm_timer_init_bp-3,a
mov a,ecx+2
mov pwm_timer_init_bp-2,a
mov a,ecx+3
mov pwm_timer_init_bp-1,a
.stabn 192,0,0,L305
L305:
.stabn 68,0,278,L306
L306:
.stabn 68,0,279,L307
L307:
mov a,@0
STA _P6CR,0,2
.stabn 68,0,280,L308
L308:
mov a,@39
STA _TMRCON,0,0
.stabn 68,0,281,L309
L309:
mov a,@1
STA _PWMCON,0,0
.stabn 68,0,282,L310
L310:
mov a,@155
STA _PRD1,0,0
.stabn 68,0,283,L311
L311:
mov a,@249
STA _PRD2,0,0
.stabn 68,0,284,L312
L312:
mov a,@48
STA _IMR,0,2
.stabn 68,0,285,L313
L313:
bs _T2EN,7
.stabn 68,0,286,L314
L314:
.cfile "D:\Program Files (x86)\ELAN\eUIDE\V2_Plus\main.c(286):"
eni
.stabn 68,0,286,L315
L315:
.stabn 68,0,287,L316
L316:
.stabn 224,0,0,L317
L317:
L$304:
mov a,pwm_timer_init_bp-4
mov ecx,a
mov a,pwm_timer_init_bp-3
mov ecx+1,a
mov a,pwm_timer_init_bp-2
mov ecx+2,a
mov a,pwm_timer_init_bp-1
mov ecx+3,a
ret
.STACK pwm_timer_init_bp,local,4
public _pwm_set
public pwm_set_bp
.stabs "pwm_set:F15",36,0,0,_pwm_set
.section ".S10",C_CODE
.SYMDEF ".S10" 
_pwm_set:
.SYMDEF "_pwm_set" 
mov a,ecx
mov pwm_set_bp-4,a
mov a,ecx+1
mov pwm_set_bp-3,a
mov a,ecx+2
mov pwm_set_bp-2,a
mov a,ecx+3
mov pwm_set_bp-1,a
.stabs "duty:10",160,0,0,pwm_set_bp+0
.stabn 192,0,0,L319
L319:
.stabn 68,0,290,L320
L320:
.stabn 68,0,291,L321
L321:
LDA pwm_set_bp+0,0,0
STA _DT1,0,0
.stabn 68,0,292,L322
L322:
bs _T1EN,6
.stabn 68,0,293,L323
L323:
.stabn 224,0,0,L324
L324:
L$318:
mov a,pwm_set_bp-4
mov ecx,a
mov a,pwm_set_bp-3
mov ecx+1,a
mov a,pwm_set_bp-2
mov ecx+2,a
mov a,pwm_set_bp-1
mov ecx+3,a
ret
.STACK pwm_set_bp,local,4
public _led_blink
public led_blink_bp
.stabs "led_blink:F15",36,0,0,_led_blink
.section ".S11",C_CODE
.SYMDEF ".S11" 
_led_blink:
.SYMDEF "_led_blink" 
mov a,ecx
mov led_blink_bp-4,a
mov a,ecx+1
mov led_blink_bp-3,a
mov a,ecx+2
mov led_blink_bp-2,a
mov a,ecx+3
mov led_blink_bp-1,a
.stabs "times:10",160,0,0,led_blink_bp+0
.stabn 192,0,0,L335
L335:
.stabn 68,0,296,L336
L336:
.stabn 68,0,297,L337
L337:
jbc _g_led_occupied,7
EXTJMP @L$326
.stabn 192,0,1,L338
L338:
.stabn 68,0,298,L339
L339:
.stabn 68,0,299,L340
L340:
bs _g_led_onoff_status,3
.stabn 68,0,300,L341
L341:
bs _g_led_occupied,7
.stabn 68,0,301,L342
L342:
LDA led_blink_bp+0,0,0
STA _g_led_light_times,0,0
.stabn 68,0,302,L343
L343:
.stabn 224,0,1,L344
L344:
L$326:
L$328:
.stabn 192,0,1,L345
L345:
.stabn 68,0,305,L346
L346:
.stabn 68,0,306,L347
L347:
EQNEPRIB _g_time200ms_flag,1
jbs STATUS,zf
EXTJMP @L$331
.stabn 192,0,2,L348
L348:
.stabn 68,0,307,L349
L349:
.stabn 68,0,308,L350
L350:
clr _g_time200ms_flag
.stabn 68,0,309,L351
L351:
call _led_disp
.stabn 68,0,310,L352
L352:
.stabn 224,0,2,L353
L353:
L$331:
.stabn 68,0,311,L354
L354:
.stabn 224,0,1,L355
L355:
L$329:
.stabn 68,0,311,L356
L356:
EQNEPRIB _g_led_light_times,0
jbs STATUS,zf
EXTJMP @L$328
.stabn 68,0,313,L357
L357:
EQNEPRIB _g_led_light_times,0
jbs STATUS,zf
EXTJMP @L$333
.stabn 192,0,1,L358
L358:
.stabn 68,0,314,L359
L359:
.stabn 68,0,315,L360
L360:
bc _g_led_occupied,7
.stabn 68,0,316,L361
L361:
.stabn 224,0,1,L362
L362:
L$333:
.stabn 68,0,317,L363
L363:
.stabn 224,0,0,L364
L364:
L$325:
mov a,led_blink_bp-4
mov ecx,a
mov a,led_blink_bp-3
mov ecx+1,a
mov a,led_blink_bp-2
mov ecx+2,a
mov a,led_blink_bp-1
mov ecx+3,a
ret
.STACK led_blink_bp,local,4
public _gpio_init
public gpio_init_bp
.stabs "gpio_init:F15",36,0,0,_gpio_init
.section ".S12",C_CODE
.SYMDEF ".S12" 
_gpio_init:
.SYMDEF "_gpio_init" 
mov a,ecx
mov gpio_init_bp-4,a
mov a,ecx+1
mov gpio_init_bp-3,a
mov a,ecx+2
mov gpio_init_bp-2,a
mov a,ecx+3
mov gpio_init_bp-1,a
.stabn 192,0,0,L366
L366:
.stabn 68,0,320,L367
L367:
.stabn 68,0,321,L368
L368:
mov a,@33
STA _P5CR,0,2
.stabn 68,0,322,L369
L369:
mov a,@252
STA _P5PHCR,0,2
.stabn 68,0,323,L370
L370:
bc _P51,1
.stabn 68,0,324,L371
L371:
mov a,@0
STA _P7CR,0,2
.stabn 68,0,325,L372
L372:
.stabn 224,0,0,L373
L373:
L$365:
mov a,gpio_init_bp-4
mov ecx,a
mov a,gpio_init_bp-3
mov ecx+1,a
mov a,gpio_init_bp-2
mov ecx+2,a
mov a,gpio_init_bp-1
mov ecx+3,a
ret
.STACK gpio_init_bp,local,4
public _adc_init
public adc_init_bp
.stabs "adc_init:F15",36,0,0,_adc_init
.section ".S13",C_CODE
.SYMDEF ".S13" 
_adc_init:
.SYMDEF "_adc_init" 
mov a,ecx
mov adc_init_bp-4,a
mov a,ecx+1
mov adc_init_bp-3,a
mov a,ecx+2
mov adc_init_bp-2,a
mov a,ecx+3
mov adc_init_bp-1,a
.stabn 192,0,0,L375
L375:
.stabn 68,0,328,L376
L376:
.stabn 68,0,329,L377
L377:
bs _ADE5,5
.stabn 68,0,330,L378
L378:
bs _ADE6,6
.stabn 68,0,332,L379
L379:
bs _ADPD,3
.stabn 68,0,334,L380
L380:
mov a,@4
STA _ADOC,0,0
.stabn 68,0,335,L381
L381:
.stabn 224,0,0,L382
L382:
L$374:
mov a,adc_init_bp-4
mov ecx,a
mov a,adc_init_bp-3
mov ecx+1,a
mov a,adc_init_bp-2
mov ecx+2,a
mov a,adc_init_bp-1
mov ecx+3,a
ret
.STACK adc_init_bp,local,4
public _led_status
public led_status_bp
.stabs "led_status:F15",36,0,0,_led_status
.section ".S14",C_CODE
.SYMDEF ".S14" 
_led_status:
.SYMDEF "_led_status" 
mov a,ecx
mov led_status_bp-4,a
mov a,ecx+1
mov led_status_bp-3,a
mov a,ecx+2
mov led_status_bp-2,a
mov a,ecx+3
mov led_status_bp-1,a
.stabs "red:10",160,0,0,led_status_bp+0
.stabs "green:10",160,0,0,led_status_bp+1
.stabs "blue:10",160,0,0,led_status_bp+2
.stabn 192,0,0,L384
L384:
.stabn 68,0,338,L385
L385:
.stabn 68,0,339,L386
L386:
LDA led_status_bp+0,0,0
mov ecx,a
bc _g_led_r,0
jbc ecx,0
bs _g_led_r,0
.stabn 68,0,340,L387
L387:
LDA led_status_bp+1,0,0
mov ecx,a
bc _g_led_g,1
jbc ecx,0
bs _g_led_g,1
.stabn 68,0,341,L388
L388:
LDA led_status_bp+2,0,0
mov ecx,a
bc _g_led_b,2
jbc ecx,0
bs _g_led_b,2
.stabn 68,0,342,L389
L389:
.stabn 224,0,0,L390
L390:
L$383:
mov a,led_status_bp-4
mov ecx,a
mov a,led_status_bp-3
mov ecx+1,a
mov a,led_status_bp-2
mov ecx+2,a
mov a,led_status_bp-1
mov ecx+3,a
ret
.STACK led_status_bp,local,4
public _mcu_init
public mcu_init_bp
.stabs "mcu_init:F15",36,0,0,_mcu_init
.section ".S15",C_CODE
.SYMDEF ".S15" 
_mcu_init:
.SYMDEF "_mcu_init" 
mov a,ecx
mov mcu_init_bp-4,a
mov a,ecx+1
mov mcu_init_bp-3,a
mov a,ecx+2
mov mcu_init_bp-2,a
mov a,ecx+3
mov mcu_init_bp-1,a
.stabn 192,0,0,L394
L394:
.stabn 68,0,345,L395
L395:
.stabn 68,0,347,L396
L396:
.cfile "D:\Program Files (x86)\ELAN\eUIDE\V2_Plus\main.c(347):"
wdtc
.stabn 68,0,347,L397
L397:
.stabn 68,0,348,L398
L398:
.cfile "D:\Program Files (x86)\ELAN\eUIDE\V2_Plus\main.c(348):"
disi
.stabn 68,0,348,L399
L399:
.stabn 68,0,349,L400
L400:
mov a,@127
STA _SCR,0,0
.stabn 68,0,351,L401
L401:
call _clr_ram
.stabn 68,0,352,L402
L402:
call _gpio_init
.stabn 68,0,353,L403
L403:
call _adc_init
.stabn 68,0,355,L404
L404:
call _pwm_timer_init
.stabn 68,0,356,L405
L405:
mov a,@156
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,358,L406
L406:
bc _g_led_occupied,7
.stabn 68,0,359,L407
L407:
mov a,@1
mov led_status_bp+2,a
mov a,@1
mov led_status_bp+1,a
mov a,@1
mov led_status_bp+0,a
.STACK led_status_bp,parameter,3
call _led_status
.stabn 68,0,360,L408
L408:
mov a,@3
mov led_blink_bp+0,a
.STACK led_blink_bp,parameter,1
call _led_blink
.stabn 68,0,362,L409
L409:
mov a,@0
jbc _P50,0
add a,@1
mov ecx,a
mov a,ecx
STA _g_keyval,0,0
.stabn 68,0,364,L410
L410:
EQNEPRIB _g_keyval,0
jbs STATUS,zf
EXTJMP @L$392
.stabn 192,0,1,L411
L411:
.stabn 68,0,365,L412
L412:
.stabn 68,0,366,L413
L413:
mov a,@1
STA _g_next_state,0,0
.stabn 68,0,367,L414
L414:
.stabn 224,0,1,L415
L415:
jmp @L$393
L$392:
.stabn 192,0,1,L416
L416:
.stabn 68,0,369,L417
L417:
.stabn 68,0,370,L418
L418:
mov a,@8
STA _g_next_state,0,0
.stabn 68,0,371,L419
L419:
.stabn 224,0,1,L420
L420:
L$393:
.stabn 68,0,373,L421
L421:
clr _g_fault_state
.stabn 68,0,374,L422
L422:
.stabn 224,0,0,L423
L423:
L$391:
mov a,mcu_init_bp-4
mov ecx,a
mov a,mcu_init_bp-3
mov ecx+1,a
mov a,mcu_init_bp-2
mov ecx+2,a
mov a,mcu_init_bp-1
mov ecx+3,a
ret
.STACK mcu_init_bp,local,4
public _main
public main_bp
.stabs "main:F15",36,0,0,_main
.section ".S16",C_CODE
.SYMDEF ".S16" 
_main:
.SYMDEF "_main" 
.stabs "temp_keyval:10",128,0,0,main_bp-1
.stabn 192,0,0,L509
L509:
.stabn 68,0,377,L510
L510:
.stabn 68,0,380,L511
L511:
call _mcu_init
.stabn 68,0,381,L512
L512:
mov a,@1
STA _g_time2s_flag,0,0
.stabn 68,0,382,L513
L513:
mov a,@1
STA main_bp-1,0,0
.stabn 68,0,383,L514
L514:
clr _g_lock_flag
jmp @L$426
L$425:
.stabn 192,0,1,L515
L515:
.stabn 68,0,386,L516
L516:
.stabn 68,0,387,L517
L517:
LDA _g_next_state,0,0
STA _g_cur_state,0,0
.stabn 68,0,389,L518
L518:
LDA _g_cur_state,0,0
mov ecx,a
EQNEPRIB ecx,1
jbc STATUS,zf
EXTJMP @L$430
EQNEPRIB ecx,2
jbc STATUS,zf
EXTJMP @L$454
EQNEPRIB ecx,4
jbc STATUS,zf
EXTJMP @L$465
EQNEPRIB ecx,8
jbc STATUS,zf
EXTJMP @L$473
jmp @L$428
.stabn 192,0,2,L519
L519:
.stabn 68,0,390,L520
L520:
L$430:
.stabn 68,0,392,L521
L521:
EQNEPRIB _g_keypress_maxtime,0
jbc STATUS, zf
EXTJMP L$431
EQNEPRIB _g_lock_flag,0
jbs STATUS,zf
EXTJMP @L$431
.stabn 192,0,3,L522
L522:
.stabn 68,0,393,L523
L523:
.stabn 68,0,394,L524
L524:
ULTRIB _g_keypress_maxtime,0xc8
jbs STATUS, cf
EXTJMP L$433
.stabn 192,0,4,L525
L525:
.stabn 68,0,395,L526
L526:
.stabn 68,0,396,L527
L527:
EQNEPRIB _g_keypress_maxtime,200
jbs STATUS,zf
EXTJMP @L$429
.stabn 192,0,5,L528
L528:
.stabn 68,0,397,L529
L529:
.stabn 68,0,398,L530
L530:
mov a,@156
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,399,L531
L531:
mov a,@9
mov led_blink_bp+0,a
.STACK led_blink_bp,parameter,1
call _led_blink
.stabn 68,0,400,L532
L532:
.stabn 224,0,5,L533
L533:
.stabn 68,0,402,L534
L534:
jmp @L$429
.stabn 68,0,403,L535
L535:
.stabn 224,0,4,L536
L536:
L$433:
.stabn 68,0,405,L537
L537:
clr _g_adc_flag
L$437:
.stabn 68,0,406,L538
L538:
L$438:
.stabn 68,0,406,L539
L539:
EQNEPRIB _g_adc_flag,0
jbc STATUS,zf
EXTJMP @L$437
.stabn 68,0,408,L540
L540:
ULTRIW _g_load_volt,0x400
jbc STATUS, cf
EXTJMP L$440
.stabn 192,0,4,L541
L541:
.stabn 68,0,409,L542
L542:
.stabn 68,0,410,L543
L543:
mov a,@156
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,411,L544
L544:
mov a,@8
STA _g_fault_state,0,0
.stabn 68,0,412,L545
L545:
mov a,@2
STA _g_next_state,0,0
.stabn 68,0,413,L546
L546:
.stabn 224,0,4,L547
L547:
jmp @L$429
L$440:
.stabn 192,0,4,L548
L548:
.stabn 68,0,415,L549
L549:
.stabn 68,0,416,L550
L550:
UGTRIW _g_battery_volt,0x9dd
jbs STATUS, cf
EXTJMP L$442
.stabn 192,0,5,L551
L551:
.stabn 68,0,417,L552
L552:
.stabn 68,0,418,L553
L553:
mov a,@1
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,419,L554
L554:
.stabn 224,0,5,L555
L555:
jmp @L$429
L$442:
.stabn 68,0,420,L556
L556:
UGTRIW _g_battery_volt,0xa22
jbs STATUS, cf
EXTJMP L$444
.stabn 192,0,5,L557
L557:
.stabn 68,0,421,L558
L558:
.stabn 68,0,422,L559
L559:
mov a,@5
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,423,L560
L560:
.stabn 224,0,5,L561
L561:
jmp @L$429
L$444:
.stabn 68,0,424,L562
L562:
UGTRIW _g_battery_volt,0xa66
jbs STATUS, cf
EXTJMP L$446
.stabn 192,0,5,L563
L563:
.stabn 68,0,425,L564
L564:
.stabn 68,0,426,L565
L565:
mov a,@13
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,427,L566
L566:
.stabn 224,0,5,L567
L567:
jmp @L$429
L$446:
.stabn 68,0,428,L568
L568:
UGTRIW _g_battery_volt,0xaab
jbs STATUS, cf
EXTJMP L$448
.stabn 192,0,5,L569
L569:
.stabn 68,0,429,L570
L570:
.stabn 68,0,430,L571
L571:
mov a,@19
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,431,L572
L572:
.stabn 224,0,5,L573
L573:
jmp @L$429
L$448:
.stabn 68,0,432,L574
L574:
UGTRIW _g_battery_volt,0xaef
jbs STATUS, cf
EXTJMP L$450
.stabn 192,0,5,L575
L575:
.stabn 68,0,433,L576
L576:
.stabn 68,0,434,L577
L577:
mov a,@27
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,435,L578
L578:
.stabn 224,0,5,L579
L579:
jmp @L$429
L$450:
.stabn 192,0,5,L580
L580:
.stabn 68,0,437,L581
L581:
.stabn 68,0,438,L582
L582:
mov a,@33
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,439,L583
L583:
.stabn 224,0,5,L584
L584:
.stabn 68,0,440,L585
L585:
.stabn 224,0,4,L586
L586:
.stabn 68,0,441,L587
L587:
.stabn 224,0,3,L588
L588:
jmp @L$429
L$431:
.stabn 192,0,3,L589
L589:
.stabn 68,0,443,L590
L590:
.stabn 68,0,444,L591
L591:
EQNEPRIB _g_time2s_flag,1
jbs STATUS,zf
EXTJMP @L$452
.stabn 192,0,4,L592
L592:
.stabn 68,0,445,L593
L593:
.stabn 68,0,446,L594
L594:
mov a,@8
STA _g_next_state,0,0
.stabn 68,0,447,L595
L595:
.stabn 224,0,4,L596
L596:
jmp @L$453
L$452:
.stabn 192,0,4,L597
L597:
.stabn 68,0,449,L598
L598:
.stabn 68,0,450,L599
L599:
mov a,@1
STA _g_next_state,0,0
.stabn 68,0,451,L600
L600:
.stabn 224,0,4,L601
L601:
L$453:
.stabn 68,0,454,L602
L602:
bc _g_led_r,0
.stabn 68,0,455,L603
L603:
bc _g_led_g,1
.stabn 68,0,456,L604
L604:
bc _g_led_b,2
.stabn 68,0,457,L605
L605:
.stabn 224,0,3,L606
L606:
.stabn 68,0,459,L607
L607:
jmp @L$429
L$454:
.stabn 68,0,462,L608
L608:
EQNEPRIB _g_fault_state,2
jbs STATUS,zf
EXTJMP @L$455
.stabn 192,0,3,L609
L609:
.stabn 68,0,463,L610
L610:
.stabn 68,0,464,L611
L611:
mov a,@1
mov led_status_bp+2,a
mov a,@0
mov led_status_bp+1,a
mov a,@0
mov led_status_bp+0,a
.STACK led_status_bp,parameter,3
call _led_status
.stabn 68,0,465,L612
L612:
mov a,@20
mov led_blink_bp+0,a
.STACK led_blink_bp,parameter,1
call _led_blink
.stabn 68,0,466,L613
L613:
mov a,@8
STA _g_next_state,0,0
.stabn 68,0,467,L614
L614:
.stabn 224,0,3,L615
L615:
jmp @L$429
L$455:
.stabn 68,0,468,L616
L616:
EQNEPRIB _g_fault_state,4
jbs STATUS,zf
EXTJMP @L$457
.stabn 192,0,3,L617
L617:
.stabn 68,0,469,L618
L618:
.stabn 68,0,470,L619
L619:
mov a,@0
mov led_status_bp+2,a
mov a,@0
mov led_status_bp+1,a
mov a,@1
mov led_status_bp+0,a
.STACK led_status_bp,parameter,3
call _led_status
.stabn 68,0,471,L620
L620:
mov a,@10
mov led_blink_bp+0,a
.STACK led_blink_bp,parameter,1
call _led_blink
.stabn 68,0,472,L621
L621:
mov a,@8
STA _g_next_state,0,0
.stabn 68,0,473,L622
L622:
.stabn 224,0,3,L623
L623:
jmp @L$429
L$457:
.stabn 68,0,474,L624
L624:
EQNEPRIB _g_fault_state,8
jbs STATUS,zf
EXTJMP @L$459
.stabn 192,0,3,L625
L625:
.stabn 68,0,475,L626
L626:
.stabn 68,0,476,L627
L627:
mov a,@1
mov led_status_bp+2,a
mov a,@1
mov led_status_bp+1,a
mov a,@1
mov led_status_bp+0,a
.STACK led_status_bp,parameter,3
call _led_status
.stabn 68,0,477,L628
L628:
mov a,@3
mov led_blink_bp+0,a
.STACK led_blink_bp,parameter,1
call _led_blink
.stabn 68,0,478,L629
L629:
mov a,@8
STA _g_next_state,0,0
.stabn 68,0,479,L630
L630:
.stabn 224,0,3,L631
L631:
jmp @L$429
L$459:
.stabn 68,0,480,L632
L632:
EQNEPRIB _g_fault_state,16
jbs STATUS,zf
EXTJMP @L$461
.stabn 192,0,3,L633
L633:
.stabn 68,0,481,L634
L634:
.stabn 68,0,482,L635
L635:
mov a,@1
mov led_status_bp+2,a
mov a,@1
mov led_status_bp+1,a
mov a,@1
mov led_status_bp+0,a
.STACK led_status_bp,parameter,3
call _led_status
.stabn 68,0,483,L636
L636:
mov a,@6
mov led_blink_bp+0,a
.STACK led_blink_bp,parameter,1
call _led_blink
.stabn 68,0,484,L637
L637:
mov a,@8
STA _g_next_state,0,0
.stabn 68,0,485,L638
L638:
.stabn 224,0,3,L639
L639:
jmp @L$429
L$461:
.stabn 68,0,486,L640
L640:
EQNEPRIB _g_fault_state,32
jbs STATUS,zf
EXTJMP @L$463
.stabn 192,0,3,L641
L641:
.stabn 68,0,487,L642
L642:
.stabn 68,0,488,L643
L643:
mov a,@1
mov led_status_bp+2,a
mov a,@0
mov led_status_bp+1,a
mov a,@1
mov led_status_bp+0,a
.STACK led_status_bp,parameter,3
call _led_status
.stabn 68,0,489,L644
L644:
mov a,@3
mov led_blink_bp+0,a
.STACK led_blink_bp,parameter,1
call _led_blink
.stabn 68,0,490,L645
L645:
mov a,@4
STA _g_next_state,0,0
.stabn 68,0,491,L646
L646:
.stabn 224,0,3,L647
L647:
jmp @L$429
L$463:
.stabn 192,0,3,L648
L648:
.stabn 68,0,493,L649
L649:
.stabn 68,0,494,L650
L650:
mov a,@1
STA _g_next_state,0,0
.stabn 68,0,495,L651
L651:
.stabn 224,0,3,L652
L652:
.stabn 68,0,497,L653
L653:
jmp @L$429
L$465:
.stabn 68,0,500,L654
L654:
clr _g_adc_flag
L$466:
.stabn 68,0,501,L655
L655:
L$467:
.stabn 68,0,501,L656
L656:
EQNEPRIB _g_adc_flag,0
jbc STATUS,zf
EXTJMP @L$466
.stabn 68,0,502,L657
L657:
ULTRIW _g_load_volt,0x400
jbc STATUS, cf
EXTJMP L$469
.stabn 192,0,3,L658
L658:
.stabn 68,0,503,L659
L659:
.stabn 68,0,504,L660
L660:
mov a,@156
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,505,L661
L661:
mov a,@16
STA _g_fault_state,0,0
.stabn 68,0,506,L662
L662:
mov a,@2
STA _g_next_state,0,0
.stabn 68,0,507,L663
L663:
.stabn 224,0,3,L664
L664:
jmp @L$429
L$469:
.stabn 68,0,508,L665
L665:
UGTRIW _g_load_volt,0xb11
jbc STATUS, cf
EXTJMP L$471
.stabn 192,0,3,L666
L666:
.stabn 68,0,509,L667
L667:
.stabn 68,0,510,L668
L668:
mov a,@156
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,511,L669
L669:
mov a,@2
STA _g_fault_state,0,0
.stabn 68,0,512,L670
L670:
mov a,@2
STA _g_next_state,0,0
.stabn 68,0,513,L671
L671:
.stabn 224,0,3,L672
L672:
jmp @L$429
L$471:
.stabn 192,0,3,L673
L673:
.stabn 68,0,515,L674
L674:
.stabn 68,0,516,L675
L675:
mov a,@1
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,518,L676
L676:
LDA _g_load_volt,0,0
mov led_ctrl_by_voltage_bp+0,a
LDA _g_load_volt,1,0
mov led_ctrl_by_voltage_bp+0+1,a
.STACK led_ctrl_by_voltage_bp,parameter,2
call _led_ctrl_by_voltage
.stabn 68,0,519,L677
L677:
.stabn 224,0,3,L678
L678:
.stabn 68,0,520,L679
L679:
jmp @L$429
L$473:
.stabn 68,0,523,L680
L680:
mov a,@156
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,524,L681
L681:
bc _g_led_r,0
.stabn 68,0,525,L682
L682:
bc _g_led_g,1
.stabn 68,0,526,L683
L683:
bc _g_led_b,2
.stabn 68,0,527,L684
L684:
bs _P70,0
.stabn 68,0,528,L685
L685:
bs _P71,1
.stabn 68,0,529,L686
L686:
bc _P51,1
.stabn 68,0,530,L687
L687:
mov a,@2
STA _ISR1,0,0
.stabn 68,0,531,L688
L688:
LDA _PORT5,0,0
STA _PORT5,0,0
.stabn 68,0,532,L689
L689:
bc _IDLE,4
.stabn 68,0,533,L690
L690:
mov a,@2
mov delay_us_bp+0,a
.STACK delay_us_bp,parameter,1
call _delay_us
.stabn 68,0,534,L691
L691:
.cfile "D:\Program Files (x86)\ELAN\eUIDE\V2_Plus\main.c(534):"
slep
.stabn 68,0,534,L692
L692:
.stabn 68,0,535,L693
L693:
mov a,@20
mov delay_us_bp+0,a
.STACK delay_us_bp,parameter,1
call _delay_us
.stabn 68,0,537,L694
L694:
clr _g_time1ms_cnt
.stabn 68,0,538,L695
L695:
clr _g_time50ms_cnt
.stabn 68,0,539,L696
L696:
clr _g_time200ms_cnt
.stabn 68,0,540,L697
L697:
clr _g_led_light_times
.stabn 68,0,541,L698
L698:
clr _g_keypress_maxtime
.stabn 68,0,543,L699
L699:
clr _g_adc_flag
L$474:
.stabn 68,0,544,L700
L700:
L$475:
.stabn 68,0,544,L701
L701:
EQNEPRIB _g_adc_flag,0
jbc STATUS,zf
EXTJMP @L$474
.stabn 68,0,546,L702
L702:
ULTRIW _g_load_volt,0x155
jbc STATUS, cf
EXTJMP L$477
.stabn 192,0,3,L703
L703:
.stabn 68,0,547,L704
L704:
.stabn 68,0,548,L705
L705:
mov a,@1
STA _g_next_state,0,0
.stabn 68,0,549,L706
L706:
.stabn 224,0,3,L707
L707:
jmp @L$429
L$477:
.stabn 192,0,3,L708
L708:
.stabn 68,0,551,L709
L709:
.stabn 68,0,552,L710
L710:
mov a,@32
STA _g_fault_state,0,0
.stabn 68,0,553,L711
L711:
mov a,@2
STA _g_next_state,0,0
.stabn 68,0,554,L712
L712:
clr _g_lock_flag
.stabn 68,0,555,L713
L713:
.stabn 224,0,3,L714
L714:
.stabn 68,0,556,L715
L715:
jmp @L$429
L$428:
.stabn 68,0,559,L716
L716:
mov a,@8
STA _g_next_state,0,0
.stabn 68,0,560,L717
L717:
.stabn 68,0,561,L718
L718:
.stabn 224,0,2,L719
L719:
L$429:
.stabn 68,0,563,L720
L720:
EQNEPRIB _g_time50ms_flag,1
jbc STATUS,zf
EXTJMP @L$481
EQNEPRIB _g_cur_state,8
jbs STATUS,zf
EXTJMP @L$479
L$481:
.stabn 192,0,2,L721
L721:
.stabn 68,0,564,L722
L722:
.stabn 68,0,565,L723
L723:
clr _g_time50ms_flag
.stabn 68,0,566,L724
L724:
mov a,@0
jbc _P50,0
add a,@1
mov ecx,a
mov a,ecx
STA _g_keyval,0,0
.stabn 68,0,568,L725
L725:
LDA _g_keyval,0,0
mov ecx,a
LDA main_bp-1,0,0
mov eax,a
EQNEPRRB eax,ecx
jbs STATUS,zf
EXTJMP @L$485
EQNEPRIB ecx,0
jbc STATUS,zf
EXTJMP @L$484
L$485:
EQNEPRIB _g_cur_state,8
jbs STATUS,zf
EXTJMP @L$482
L$484:
.stabn 192,0,3,L726
L726:
.stabn 68,0,569,L727
L727:
.stabn 68,0,570,L728
L728:
EQNEPRIB _g_keypress_maxtime,255
jbs STATUS,zf
EXTJMP @L$486
.stabn 192,0,4,L729
L729:
.stabn 68,0,571,L730
L730:
.stabn 68,0,572,L731
L731:
mov a,@255
STA _g_keypress_maxtime,0,0
.stabn 68,0,573,L732
L732:
.stabn 224,0,4,L733
L733:
jmp @L$487
L$486:
.stabn 192,0,4,L734
L734:
.stabn 68,0,575,L735
L735:
.stabn 68,0,577,L736
L736:
LDA _g_keypress_maxtime,0,0
add a,@1
STA _g_keypress_maxtime,0,0
.stabn 68,0,578,L737
L737:
.stabn 224,0,4,L738
L738:
L$487:
.stabn 68,0,581,L739
L739:
EQNEPRIB _g_lock_flag,0
jbs STATUS,zf
EXTJMP @L$488
EQNEPRIB _g_keypress_maxtime,1
jbs STATUS,zf
EXTJMP @L$488
.stabn 192,0,4,L740
L740:
.stabn 68,0,582,L741
L741:
.stabn 68,0,583,L742
L742:
LDA _g_cur_state,0,0
mov ecx,a
EQNEPRIB ecx,8
jbc STATUS,zf
EXTJMP @L$492
EQNEPRIB ecx,1
jbs STATUS,zf
EXTJMP @L$490
L$492:
.stabn 192,0,5,L743
L743:
.stabn 68,0,584,L744
L744:
.stabn 68,0,585,L745
L745:
mov a,@1
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,587,L746
L746:
call _battery_volt_sample
.stabn 68,0,589,L747
L747:
ULTRIW _g_battery_volt,0x888
jbc STATUS, cf
EXTJMP L$493
.stabn 192,0,6,L748
L748:
.stabn 68,0,590,L749
L749:
.stabn 68,0,591,L750
L750:
mov a,@156
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,592,L751
L751:
mov a,@4
STA _g_fault_state,0,0
.stabn 68,0,593,L752
L752:
mov a,@2
STA _g_next_state,0,0
.stabn 68,0,594,L753
L753:
.stabn 224,0,6,L754
L754:
jmp @L$494
L$493:
.stabn 192,0,6,L755
L755:
.stabn 68,0,596,L756
L756:
.stabn 68,0,597,L757
L757:
LDA _g_battery_volt,0,0
mov led_ctrl_by_voltage_bp+0,a
LDA _g_battery_volt,1,0
mov led_ctrl_by_voltage_bp+0+1,a
.STACK led_ctrl_by_voltage_bp,parameter,2
call _led_ctrl_by_voltage
.stabn 68,0,598,L758
L758:
.stabn 224,0,6,L759
L759:
L$494:
.stabn 68,0,599,L760
L760:
.stabn 224,0,5,L761
L761:
L$490:
.stabn 68,0,600,L762
L762:
.stabn 224,0,4,L763
L763:
L$488:
.stabn 68,0,603,L764
L764:
EQNEPRIB _g_keypress_times,0
jbs STATUS,zf
EXTJMP @L$483
.stabn 192,0,4,L765
L765:
.stabn 68,0,604,L766
L766:
.stabn 68,0,605,L767
L767:
mov a,@1
STA _g_time2s_start,0,0
.stabn 68,0,606,L768
L768:
.stabn 224,0,4,L769
L769:
.stabn 68,0,607,L770
L770:
.stabn 224,0,3,L771
L771:
jmp @L$483
L$482:
.stabn 68,0,608,L772
L772:
EQNEPRIB main_bp-1,0
jbs STATUS,zf
EXTJMP @L$497
EQNEPRIB _g_keyval,1
jbs STATUS,zf
EXTJMP @L$497
.stabn 192,0,3,L773
L773:
.stabn 68,0,609,L774
L774:
.stabn 68,0,610,L775
L775:
ULTRIB _g_keypress_maxtime,0x28
jbc STATUS, cf
EXTJMP L$499
.stabn 192,0,4,L776
L776:
.stabn 68,0,611,L777
L777:
.stabn 68,0,612,L778
L778:
LDA _g_keypress_times,0,0
add a,@1
STA _g_keypress_times,0,0
.stabn 68,0,613,L779
L779:
.stabn 224,0,4,L780
L780:
L$499:
.stabn 68,0,616,L781
L781:
mov a,@156
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,618,L782
L782:
clr _g_keypress_maxtime
.stabn 68,0,619,L783
L783:
.stabn 224,0,3,L784
L784:
L$497:
L$483:
.stabn 68,0,621,L785
L785:
LDA _g_keyval,0,0
STA main_bp-1,0,0
.stabn 68,0,622,L786
L786:
.stabn 224,0,2,L787
L787:
L$479:
.stabn 68,0,624,L788
L788:
EQNEPRIB _g_time200ms_flag,1
jbs STATUS,zf
EXTJMP @L$501
.stabn 192,0,2,L789
L789:
.stabn 68,0,625,L790
L790:
.stabn 68,0,626,L791
L791:
clr _g_time200ms_flag
.stabn 68,0,627,L792
L792:
call _led_disp
.stabn 68,0,628,L793
L793:
.stabn 224,0,2,L794
L794:
L$501:
.stabn 68,0,630,L795
L795:
EQNEPRIB _g_time2s_flag,1
jbs STATUS,zf
EXTJMP @L$503
.stabn 192,0,2,L796
L796:
.stabn 68,0,631,L797
L797:
.stabn 68,0,632,L798
L798:
clr _g_time2s_flag
.stabn 68,0,633,L799
L799:
ULTRIB _g_keypress_times,0x5
jbs STATUS, cf
EXTJMP L$505
.stabn 192,0,3,L800
L800:
.stabn 68,0,634,L801
L801:
.stabn 68,0,635,L802
L802:
mov a,@156
mov pwm_set_bp+0,a
.STACK pwm_set_bp,parameter,1
call _pwm_set
.stabn 68,0,637,L803
L803:
EQNEPRIB _g_lock_flag,0
jbs STATUS,zf
EXTJMP @L$507
.stabn 192,0,4,L804
L804:
.stabn 68,0,638,L805
L805:
.stabn 68,0,639,L806
L806:
mov a,@1
mov led_status_bp+2,a
mov a,@1
mov led_status_bp+1,a
mov a,@1
mov led_status_bp+0,a
.STACK led_status_bp,parameter,3
call _led_status
.stabn 68,0,640,L807
L807:
mov a,@3
mov led_blink_bp+0,a
.STACK led_blink_bp,parameter,1
call _led_blink
.stabn 68,0,641,L808
L808:
mov a,@1
STA _g_lock_flag,0,0
.stabn 68,0,642,L809
L809:
.stabn 224,0,4,L810
L810:
jmp @L$508
L$507:
.stabn 192,0,4,L811
L811:
.stabn 68,0,644,L812
L812:
.stabn 68,0,645,L813
L813:
mov a,@1
mov led_status_bp+2,a
mov a,@1
mov led_status_bp+1,a
mov a,@1
mov led_status_bp+0,a
.STACK led_status_bp,parameter,3
call _led_status
.stabn 68,0,646,L814
L814:
mov a,@5
mov led_blink_bp+0,a
.STACK led_blink_bp,parameter,1
call _led_blink
.stabn 68,0,647,L815
L815:
clr _g_lock_flag
.stabn 68,0,648,L816
L816:
.stabn 224,0,4,L817
L817:
L$508:
.stabn 68,0,649,L818
L818:
.stabn 224,0,3,L819
L819:
L$505:
.stabn 68,0,650,L820
L820:
clr _g_keypress_times
.stabn 68,0,651,L821
L821:
.stabn 224,0,2,L822
L822:
L$503:
.stabn 68,0,652,L823
L823:
.stabn 224,0,1,L824
L824:
L$426:
.stabn 68,0,385,L825
L825:
jmp @L$425
.stabn 68,0,653,L826
L826:
.stabn 224,0,0,L827
L827:
L$424:
ret
.STACK main_bp,local,1
extrn _IntVecIdx
.section ".code"
.section ".bss"
public _g_time2s_start
.align 1
_g_time2s_start:
.SYMDEF "_g_time2s_start" BANK:0,53,LEN:1
ds 1
.stabs "g_time2s_start:G10",32,0,0,_g_time2s_start
public _g_adc_flag
.align 1
_g_adc_flag:
.SYMDEF "_g_adc_flag" BANK:0,52,LEN:1
ds 1
.stabs "g_adc_flag:G10",32,0,0,_g_adc_flag
public _g_lock_flag
.align 1
_g_lock_flag:
.SYMDEF "_g_lock_flag" BANK:0,51,LEN:1
ds 1
.stabs "g_lock_flag:G10",32,0,0,_g_lock_flag
public _g_next_state
.align 1
_g_next_state:
.SYMDEF "_g_next_state" BANK:0,50,LEN:1
ds 1
.stabs "g_next_state:G10",32,0,0,_g_next_state
public _g_cur_state
.align 1
_g_cur_state:
.SYMDEF "_g_cur_state" BANK:0,49,LEN:1
ds 1
.stabs "g_cur_state:G10",32,0,0,_g_cur_state
public _g_led_onoff
.align 1
_g_led_onoff:
.SYMDEF "_g_led_onoff" BANK:0,48,LEN:1
ds 1
.stabs "g_led_onoff:G10",32,0,0,_g_led_onoff
public _g_keypress_maxtime
.align 1
_g_keypress_maxtime:
.SYMDEF "_g_keypress_maxtime" BANK:0,47,LEN:1
ds 1
.stabs "g_keypress_maxtime:G10",32,0,0,_g_keypress_maxtime
public _g_keypress_times
.align 1
_g_keypress_times:
.SYMDEF "_g_keypress_times" BANK:0,46,LEN:1
ds 1
.stabs "g_keypress_times:G10",32,0,0,_g_keypress_times
public _g_led_light_times
.align 1
_g_led_light_times:
.SYMDEF "_g_led_light_times" BANK:0,45,LEN:1
ds 1
.stabs "g_led_light_times:G10",32,0,0,_g_led_light_times
public _g_led_occupied
.align 1
_g_led_occupied:
.SYMDEF "_g_led_occupied" BANK:0,BIT:7,44,LEN:1
ds 1
.stabs "g_led_occupied:G16",32,0,0,_g_led_occupied@7
public _g_led_onoff_status
.align 1
_g_led_onoff_status:
.SYMDEF "_g_led_onoff_status" BANK:0,BIT:3,44,LEN:1
ds 1
.stabs "g_led_onoff_status:G16",32,0,0,_g_led_onoff_status@3
public _g_led_b
.align 1
_g_led_b:
.SYMDEF "_g_led_b" BANK:0,BIT:2,44,LEN:1
ds 1
.stabs "g_led_b:G16",32,0,0,_g_led_b@2
public _g_led_g
.align 1
_g_led_g:
.SYMDEF "_g_led_g" BANK:0,BIT:1,44,LEN:1
ds 1
.stabs "g_led_g:G16",32,0,0,_g_led_g@1
public _g_led_r
.align 1
_g_led_r:
.SYMDEF "_g_led_r" BANK:0,BIT:0,44,LEN:1
ds 1
.stabs "g_led_r:G16",32,0,0,_g_led_r@0
public _g_time2s_flag
.align 1
_g_time2s_flag:
.SYMDEF "_g_time2s_flag" BANK:0,43,LEN:1
ds 1
.stabs "g_time2s_flag:G10",32,0,0,_g_time2s_flag
public _g_time200ms_flag
.align 1
_g_time200ms_flag:
.SYMDEF "_g_time200ms_flag" BANK:0,42,LEN:1
ds 1
.stabs "g_time200ms_flag:G10",32,0,0,_g_time200ms_flag
public _g_time200ms_cnt
.align 1
_g_time200ms_cnt:
.SYMDEF "_g_time200ms_cnt" BANK:0,41,LEN:1
ds 1
.stabs "g_time200ms_cnt:G10",32,0,0,_g_time200ms_cnt
public _g_time50ms_flag
.align 1
_g_time50ms_flag:
.SYMDEF "_g_time50ms_flag" BANK:0,40,LEN:1
ds 1
.stabs "g_time50ms_flag:G10",32,0,0,_g_time50ms_flag
public _g_time50ms_cnt
.align 1
_g_time50ms_cnt:
.SYMDEF "_g_time50ms_cnt" BANK:0,39,LEN:1
ds 1
.stabs "g_time50ms_cnt:G10",32,0,0,_g_time50ms_cnt
public _g_time1ms_cnt
.align 1
_g_time1ms_cnt:
.SYMDEF "_g_time1ms_cnt" BANK:0,38,LEN:1
ds 1
.stabs "g_time1ms_cnt:G10",32,0,0,_g_time1ms_cnt
public _g_keyval
.align 1
_g_keyval:
.SYMDEF "_g_keyval" BANK:0,37,LEN:1
ds 1
.stabs "g_keyval:G10",32,0,0,_g_keyval
public _g_battery_volt_h
.align 1
_g_battery_volt_h:
.SYMDEF "_g_battery_volt_h" BANK:0,36,LEN:1
ds 1
.stabs "g_battery_volt_h:G10",32,0,0,_g_battery_volt_h
public _g_battery_volt_l
.align 1
_g_battery_volt_l:
.SYMDEF "_g_battery_volt_l" BANK:0,35,LEN:1
ds 1
.stabs "g_battery_volt_l:G10",32,0,0,_g_battery_volt_l
public _g_battery_volt
.align 1
_g_battery_volt:
.SYMDEF "_g_battery_volt" BANK:0,35,LEN:2
ds 2
.stabs "g_battery_volt:G13",32,0,0,_g_battery_volt
public _g_load_volt_h
.align 1
_g_load_volt_h:
.SYMDEF "_g_load_volt_h" BANK:0,34,LEN:1
ds 1
.stabs "g_load_volt_h:G10",32,0,0,_g_load_volt_h
public _g_load_volt_l
.align 1
_g_load_volt_l:
.SYMDEF "_g_load_volt_l" BANK:0,33,LEN:1
ds 1
.stabs "g_load_volt_l:G10",32,0,0,_g_load_volt_l
public _g_load_volt
.align 1
_g_load_volt:
.SYMDEF "_g_load_volt" BANK:0,33,LEN:2
ds 2
.stabs "g_load_volt:G13",32,0,0,_g_load_volt
public _g_fault_state
.align 1
_g_fault_state:
.SYMDEF "_g_fault_state" BANK:0,32,LEN:1
ds 1
.stabs "g_fault_state:G10",32,0,0,_g_fault_state
.align 1
_RCM0:
.SYMDEF "_RCM0" REG:1,BIT:0,15,LEN:1
ds 1
.stabs "RCM0:S16",40,0,0,_RCM0
.align 1
_RCM1:
.SYMDEF "_RCM1" REG:1,BIT:1,15,LEN:1
ds 1
.stabs "RCM1:S16",40,0,0,_RCM1
.align 1
_SHS0:
.SYMDEF "_SHS0" REG:1,BIT:2,15,LEN:1
ds 1
.stabs "SHS0:S16",40,0,0,_SHS0
.align 1
_SHS1:
.SYMDEF "_SHS1" REG:1,BIT:3,15,LEN:1
ds 1
.stabs "SHS1:S16",40,0,0,_SHS1
.align 1
_IDLE:
.SYMDEF "_IDLE" REG:1,BIT:4,15,LEN:1
ds 1
.stabs "IDLE:S16",40,0,0,_IDLE
.align 1
_CPUS:
.SYMDEF "_CPUS" REG:1,BIT:5,15,LEN:1
ds 1
.stabs "CPUS:S16",40,0,0,_CPUS
.align 1
_TIMERSC:
.SYMDEF "_TIMERSC" REG:1,BIT:6,15,LEN:1
ds 1
.stabs "TIMERSC:S16",40,0,0,_TIMERSC
.align 1
_EXWE:
.SYMDEF "_EXWE" REG:1,BIT:0,14,LEN:1
ds 1
.stabs "EXWE:S16",40,0,0,_EXWE
.align 1
_LVD0:
.SYMDEF "_LVD0" REG:1,BIT:4,14,LEN:1
ds 1
.stabs "LVD0:S16",40,0,0,_LVD0
.align 1
_LVD1:
.SYMDEF "_LVD1" REG:1,BIT:5,14,LEN:1
ds 1
.stabs "LVD1:S16",40,0,0,_LVD1
.align 1
_LVDEN:
.SYMDEF "_LVDEN" REG:1,BIT:6,14,LEN:1
ds 1
.stabs "LVDEN:S16",40,0,0,_LVDEN
.align 1
_LVDIE:
.SYMDEF "_LVDIE" REG:1,BIT:7,14,LEN:1
ds 1
.stabs "LVDIE:S16",40,0,0,_LVDIE
.align 1
_T1P0:
.SYMDEF "_T1P0" REG:1,BIT:0,8,LEN:1
ds 1
.stabs "T1P0:S16",40,0,0,_T1P0
.align 1
_T1P1:
.SYMDEF "_T1P1" REG:1,BIT:1,8,LEN:1
ds 1
.stabs "T1P1:S16",40,0,0,_T1P1
.align 1
_T1P2:
.SYMDEF "_T1P2" REG:1,BIT:2,8,LEN:1
ds 1
.stabs "T1P2:S16",40,0,0,_T1P2
.align 1
_T2P0:
.SYMDEF "_T2P0" REG:1,BIT:3,8,LEN:1
ds 1
.stabs "T2P0:S16",40,0,0,_T2P0
.align 1
_T2P1:
.SYMDEF "_T2P1" REG:1,BIT:4,8,LEN:1
ds 1
.stabs "T2P1:S16",40,0,0,_T2P1
.align 1
_T2P2:
.SYMDEF "_T2P2" REG:1,BIT:5,8,LEN:1
ds 1
.stabs "T2P2:S16",40,0,0,_T2P2
.align 1
_T1EN:
.SYMDEF "_T1EN" REG:1,BIT:6,8,LEN:1
ds 1
.stabs "T1EN:S16",40,0,0,_T1EN
.align 1
_T2EN:
.SYMDEF "_T2EN" REG:1,BIT:7,8,LEN:1
ds 1
.stabs "T2EN:S16",40,0,0,_T2EN
.align 1
_PWM1E:
.SYMDEF "_PWM1E" REG:1,BIT:0,7,LEN:1
ds 1
.stabs "PWM1E:S16",40,0,0,_PWM1E
.align 1
_PWM2E:
.SYMDEF "_PWM2E" REG:1,BIT:1,7,LEN:1
ds 1
.stabs "PWM2E:S16",40,0,0,_PWM2E
.align 1
_PWMCAS:
.SYMDEF "_PWMCAS" REG:1,BIT:2,7,LEN:1
ds 1
.stabs "PWMCAS:S16",40,0,0,_PWMCAS
.align 1
_Rbit0:
.SYMDEF "_Rbit0" REG:1,BIT:0,6,LEN:1
ds 1
.stabs "Rbit0:S16",40,0,0,_Rbit0
.align 1
_Rbit1:
.SYMDEF "_Rbit1" REG:1,BIT:1,6,LEN:1
ds 1
.stabs "Rbit1:S16",40,0,0,_Rbit1
.align 1
_Rbit2:
.SYMDEF "_Rbit2" REG:1,BIT:2,6,LEN:1
ds 1
.stabs "Rbit2:S16",40,0,0,_Rbit2
.align 1
_Rbit3:
.SYMDEF "_Rbit3" REG:1,BIT:3,6,LEN:1
ds 1
.stabs "Rbit3:S16",40,0,0,_Rbit3
.align 1
_Rbit4:
.SYMDEF "_Rbit4" REG:1,BIT:4,6,LEN:1
ds 1
.stabs "Rbit4:S16",40,0,0,_Rbit4
.align 1
_Rbit5:
.SYMDEF "_Rbit5" REG:1,BIT:5,6,LEN:1
ds 1
.stabs "Rbit5:S16",40,0,0,_Rbit5
.align 1
_Rbit6:
.SYMDEF "_Rbit6" REG:1,BIT:6,6,LEN:1
ds 1
.stabs "Rbit6:S16",40,0,0,_Rbit6
.align 1
_Rbit7:
.SYMDEF "_Rbit7" REG:1,BIT:7,6,LEN:1
ds 1
.stabs "Rbit7:S16",40,0,0,_Rbit7
.align 1
_Rbit8:
.SYMDEF "_Rbit8" REG:1,BIT:0,5,LEN:1
ds 1
.stabs "Rbit8:S16",40,0,0,_Rbit8
.align 1
_Rbit9:
.SYMDEF "_Rbit9" REG:1,BIT:1,5,LEN:1
ds 1
.stabs "Rbit9:S16",40,0,0,_Rbit9
.align 1
_Rbit10:
.SYMDEF "_Rbit10" REG:1,BIT:2,5,LEN:1
ds 1
.stabs "Rbit10:S16",40,0,0,_Rbit10
.align 1
_MLB:
.SYMDEF "_MLB" REG:1,BIT:7,5,LEN:1
ds 1
.stabs "MLB:S16",40,0,0,_MLB
.align 1
_TCIF:
.SYMDEF "_TCIF" REG:0,BIT:0,15,LEN:1
ds 1
.stabs "TCIF:S16",40,0,0,_TCIF
.align 1
_ICIF:
.SYMDEF "_ICIF" REG:0,BIT:1,15,LEN:1
ds 1
.stabs "ICIF:S16",40,0,0,_ICIF
.align 1
_EXIF:
.SYMDEF "_EXIF" REG:0,BIT:2,15,LEN:1
ds 1
.stabs "EXIF:S16",40,0,0,_EXIF
.align 1
_PWM1IF:
.SYMDEF "_PWM1IF" REG:0,BIT:3,15,LEN:1
ds 1
.stabs "PWM1IF:S16",40,0,0,_PWM1IF
.align 1
_PWM2IF:
.SYMDEF "_PWM2IF" REG:0,BIT:4,15,LEN:1
ds 1
.stabs "PWM2IF:S16",40,0,0,_PWM2IF
.align 1
_DT1IF:
.SYMDEF "_DT1IF" REG:0,BIT:5,15,LEN:1
ds 1
.stabs "DT1IF:S16",40,0,0,_DT1IF
.align 1
_DT2IF:
.SYMDEF "_DT2IF" REG:0,BIT:6,15,LEN:1
ds 1
.stabs "DT2IF:S16",40,0,0,_DT2IF
.align 1
_LVDWE:
.SYMDEF "_LVDWE" REG:0,BIT:0,14,LEN:1
ds 1
.stabs "LVDWE:S16",40,0,0,_LVDWE
.align 1
_ICWE:
.SYMDEF "_ICWE" REG:0,BIT:1,14,LEN:1
ds 1
.stabs "ICWE:S16",40,0,0,_ICWE
.align 1
_CMPWE:
.SYMDEF "_CMPWE" REG:0,BIT:2,14,LEN:1
ds 1
.stabs "CMPWE:S16",40,0,0,_CMPWE
.align 1
_ADWE:
.SYMDEF "_ADWE" REG:0,BIT:3,14,LEN:1
ds 1
.stabs "ADWE:S16",40,0,0,_ADWE
.align 1
_CMPIF:
.SYMDEF "_CMPIF" REG:0,BIT:4,14,LEN:1
ds 1
.stabs "CMPIF:S16",40,0,0,_CMPIF
.align 1
_ADIF:
.SYMDEF "_ADIF" REG:0,BIT:5,14,LEN:1
ds 1
.stabs "ADIF:S16",40,0,0,_ADIF
.align 1
_LVDIF:
.SYMDEF "_LVDIF" REG:0,BIT:6,14,LEN:1
ds 1
.stabs "LVDIF:S16",40,0,0,_LVDIF
.align 1
_LVD:
.SYMDEF "_LVD" REG:0,BIT:7,14,LEN:1
ds 1
.stabs "LVD:S16",40,0,0,_LVD
.align 1
_VOF0:
.SYMDEF "_VOF0" REG:0,BIT:3,10,LEN:1
ds 1
.stabs "VOF0:S16",40,0,0,_VOF0
.align 1
_VOF1:
.SYMDEF "_VOF1" REG:0,BIT:4,10,LEN:1
ds 1
.stabs "VOF1:S16",40,0,0,_VOF1
.align 1
_VOF2:
.SYMDEF "_VOF2" REG:0,BIT:5,10,LEN:1
ds 1
.stabs "VOF2:S16",40,0,0,_VOF2
.align 1
_SIGN:
.SYMDEF "_SIGN" REG:0,BIT:6,10,LEN:1
ds 1
.stabs "SIGN:S16",40,0,0,_SIGN
.align 1
_CALI:
.SYMDEF "_CALI" REG:0,BIT:7,10,LEN:1
ds 1
.stabs "CALI:S16",40,0,0,_CALI
.align 1
_ADIS0:
.SYMDEF "_ADIS0" REG:0,BIT:0,9,LEN:1
ds 1
.stabs "ADIS0:S16",40,0,0,_ADIS0
.align 1
_ADIS1:
.SYMDEF "_ADIS1" REG:0,BIT:1,9,LEN:1
ds 1
.stabs "ADIS1:S16",40,0,0,_ADIS1
.align 1
_ADIS2:
.SYMDEF "_ADIS2" REG:0,BIT:2,9,LEN:1
ds 1
.stabs "ADIS2:S16",40,0,0,_ADIS2
.align 1
_ADPD:
.SYMDEF "_ADPD" REG:0,BIT:3,9,LEN:1
ds 1
.stabs "ADPD:S16",40,0,0,_ADPD
.align 1
_ADRUN:
.SYMDEF "_ADRUN" REG:0,BIT:4,9,LEN:1
ds 1
.stabs "ADRUN:S16",40,0,0,_ADRUN
.align 1
_CKR0:
.SYMDEF "_CKR0" REG:0,BIT:5,9,LEN:1
ds 1
.stabs "CKR0:S16",40,0,0,_CKR0
.align 1
_CKR1:
.SYMDEF "_CKR1" REG:0,BIT:6,9,LEN:1
ds 1
.stabs "CKR1:S16",40,0,0,_CKR1
.align 1
_VREFS:
.SYMDEF "_VREFS" REG:0,BIT:7,9,LEN:1
ds 1
.stabs "VREFS:S16",40,0,0,_VREFS
.align 1
_ADE0:
.SYMDEF "_ADE0" REG:0,BIT:0,8,LEN:1
ds 1
.stabs "ADE0:S16",40,0,0,_ADE0
.align 1
_ADE1:
.SYMDEF "_ADE1" REG:0,BIT:1,8,LEN:1
ds 1
.stabs "ADE1:S16",40,0,0,_ADE1
.align 1
_ADE2:
.SYMDEF "_ADE2" REG:0,BIT:2,8,LEN:1
ds 1
.stabs "ADE2:S16",40,0,0,_ADE2
.align 1
_ADE3:
.SYMDEF "_ADE3" REG:0,BIT:3,8,LEN:1
ds 1
.stabs "ADE3:S16",40,0,0,_ADE3
.align 1
_ADE4:
.SYMDEF "_ADE4" REG:0,BIT:4,8,LEN:1
ds 1
.stabs "ADE4:S16",40,0,0,_ADE4
.align 1
_ADE5:
.SYMDEF "_ADE5" REG:0,BIT:5,8,LEN:1
ds 1
.stabs "ADE5:S16",40,0,0,_ADE5
.align 1
_ADE6:
.SYMDEF "_ADE6" REG:0,BIT:6,8,LEN:1
ds 1
.stabs "ADE6:S16",40,0,0,_ADE6
.align 1
_ADE7:
.SYMDEF "_ADE7" REG:0,BIT:7,8,LEN:1
ds 1
.stabs "ADE7:S16",40,0,0,_ADE7
.align 1
_P70:
.SYMDEF "_P70" REG:0,BIT:0,7,LEN:1
ds 1
.stabs "P70:S16",40,0,0,_P70
.align 1
_P71:
.SYMDEF "_P71" REG:0,BIT:1,7,LEN:1
ds 1
.stabs "P71:S16",40,0,0,_P71
.align 1
_P72:
.SYMDEF "_P72" REG:0,BIT:2,7,LEN:1
ds 1
.stabs "P72:S16",40,0,0,_P72
.align 1
_P73:
.SYMDEF "_P73" REG:0,BIT:3,7,LEN:1
ds 1
.stabs "P73:S16",40,0,0,_P73
.align 1
_P74:
.SYMDEF "_P74" REG:0,BIT:4,7,LEN:1
ds 1
.stabs "P74:S16",40,0,0,_P74
.align 1
_P75:
.SYMDEF "_P75" REG:0,BIT:5,7,LEN:1
ds 1
.stabs "P75:S16",40,0,0,_P75
.align 1
_P76:
.SYMDEF "_P76" REG:0,BIT:6,7,LEN:1
ds 1
.stabs "P76:S16",40,0,0,_P76
.align 1
_P77:
.SYMDEF "_P77" REG:0,BIT:7,7,LEN:1
ds 1
.stabs "P77:S16",40,0,0,_P77
.align 1
_P60:
.SYMDEF "_P60" REG:0,BIT:0,6,LEN:1
ds 1
.stabs "P60:S16",40,0,0,_P60
.align 1
_P61:
.SYMDEF "_P61" REG:0,BIT:1,6,LEN:1
ds 1
.stabs "P61:S16",40,0,0,_P61
.align 1
_P62:
.SYMDEF "_P62" REG:0,BIT:2,6,LEN:1
ds 1
.stabs "P62:S16",40,0,0,_P62
.align 1
_P63:
.SYMDEF "_P63" REG:0,BIT:3,6,LEN:1
ds 1
.stabs "P63:S16",40,0,0,_P63
.align 1
_P64:
.SYMDEF "_P64" REG:0,BIT:4,6,LEN:1
ds 1
.stabs "P64:S16",40,0,0,_P64
.align 1
_P65:
.SYMDEF "_P65" REG:0,BIT:5,6,LEN:1
ds 1
.stabs "P65:S16",40,0,0,_P65
.align 1
_P66:
.SYMDEF "_P66" REG:0,BIT:6,6,LEN:1
ds 1
.stabs "P66:S16",40,0,0,_P66
.align 1
_P67:
.SYMDEF "_P67" REG:0,BIT:7,6,LEN:1
ds 1
.stabs "P67:S16",40,0,0,_P67
.align 1
_P50:
.SYMDEF "_P50" REG:0,BIT:0,5,LEN:1
ds 1
.stabs "P50:S16",40,0,0,_P50
.align 1
_P51:
.SYMDEF "_P51" REG:0,BIT:1,5,LEN:1
ds 1
.stabs "P51:S16",40,0,0,_P51
.align 1
_P52:
.SYMDEF "_P52" REG:0,BIT:2,5,LEN:1
ds 1
.stabs "P52:S16",40,0,0,_P52
.align 1
_P53:
.SYMDEF "_P53" REG:0,BIT:3,5,LEN:1
ds 1
.stabs "P53:S16",40,0,0,_P53
.align 1
_P54:
.SYMDEF "_P54" REG:0,BIT:4,5,LEN:1
ds 1
.stabs "P54:S16",40,0,0,_P54
.align 1
_P55:
.SYMDEF "_P55" REG:0,BIT:5,5,LEN:1
ds 1
.stabs "P55:S16",40,0,0,_P55
.align 1
_P56:
.SYMDEF "_P56" REG:0,BIT:6,5,LEN:1
ds 1
.stabs "P56:S16",40,0,0,_P56
.align 1
_P57:
.SYMDEF "_P57" REG:0,BIT:7,5,LEN:1
ds 1
.stabs "P57:S16",40,0,0,_P57
.align 1
_SBANk:
.SYMDEF "_SBANk" REG:0,BIT:7,4,LEN:1
ds 1
.stabs "SBANk:S16",40,0,0,_SBANk
.align 1
_C:
.SYMDEF "_C" REG:0,BIT:0,3,LEN:1
ds 1
.stabs "C:S16",40,0,0,_C
.align 1
_DC:
.SYMDEF "_DC" REG:0,BIT:1,3,LEN:1
ds 1
.stabs "DC:S16",40,0,0,_DC
.align 1
_Z:
.SYMDEF "_Z" REG:0,BIT:2,3,LEN:1
ds 1
.stabs "Z:S16",40,0,0,_Z
.align 1
_P:
.SYMDEF "_P" REG:0,BIT:3,3,LEN:1
ds 1
.stabs "P:S16",40,0,0,_P
.align 1
_T:
.SYMDEF "_T" REG:0,BIT:4,3,LEN:1
ds 1
.stabs "T:S16",40,0,0,_T
.align 1
_IOCS:
.SYMDEF "_IOCS" REG:0,BIT:6,3,LEN:1
ds 1
.stabs "IOCS:S16",40,0,0,_IOCS
.align 1
_RST:
.SYMDEF "_RST" REG:0,BIT:7,3,LEN:1
ds 1
.stabs "RST:S16",40,0,0,_RST
.align 1
_P6PHCR:
.SYMDEF "_P6PHCR" IO:1,15,LEN:1
ds 1
.stabs "P6PHCR:S14",40,0,0,_P6PHCR
.align 1
_PHCR2:
.SYMDEF "_PHCR2" IO:1,15,LEN:1
ds 1
.stabs "PHCR2:S14",40,0,0,_PHCR2
.align 1
_HDCR2:
.SYMDEF "_HDCR2" IO:1,8,LEN:1
ds 1
.stabs "HDCR2:S14",40,0,0,_HDCR2
.align 1
_HDCR1:
.SYMDEF "_HDCR1" IO:1,7,LEN:1
ds 1
.stabs "HDCR1:S14",40,0,0,_HDCR1
.align 1
_HSCR2:
.SYMDEF "_HSCR2" IO:1,6,LEN:1
ds 1
.stabs "HSCR2:S14",40,0,0,_HSCR2
.align 1
_HSCR1:
.SYMDEF "_HSCR1" IO:1,5,LEN:1
ds 1
.stabs "HSCR1:S14",40,0,0,_HSCR1
.align 1
_IMR:
.SYMDEF "_IMR" IO:0,15,LEN:1
ds 1
.stabs "IMR:S14",40,0,0,_IMR
.align 1
_WDTCR:
.SYMDEF "_WDTCR" IO:0,14,LEN:1
ds 1
.stabs "WDTCR:S14",40,0,0,_WDTCR
.align 1
_P5PHCR:
.SYMDEF "_P5PHCR" IO:0,13,LEN:1
ds 1
.stabs "P5PHCR:S14",40,0,0,_P5PHCR
.align 1
_PHCR1:
.SYMDEF "_PHCR1" IO:0,13,LEN:1
ds 1
.stabs "PHCR1:S14",40,0,0,_PHCR1
.align 1
_P6ODCR:
.SYMDEF "_P6ODCR" IO:0,12,LEN:1
ds 1
.stabs "P6ODCR:S14",40,0,0,_P6ODCR
.align 1
_ODCR:
.SYMDEF "_ODCR" IO:0,12,LEN:1
ds 1
.stabs "ODCR:S14",40,0,0,_ODCR
.align 1
_P5PDCR:
.SYMDEF "_P5PDCR" IO:0,11,LEN:1
ds 1
.stabs "P5PDCR:S14",40,0,0,_P5PDCR
.align 1
_PDCR:
.SYMDEF "_PDCR" IO:0,11,LEN:1
ds 1
.stabs "PDCR:S14",40,0,0,_PDCR
.align 1
_TMR2:
.SYMDEF "_TMR2" IO:0,10,LEN:1
ds 1
.stabs "TMR2:S14",40,0,0,_TMR2
.align 1
_TMR1:
.SYMDEF "_TMR1" IO:0,9,LEN:1
ds 1
.stabs "TMR1:S14",40,0,0,_TMR1
.align 1
_CCR:
.SYMDEF "_CCR" IO:0,8,LEN:1
ds 1
.stabs "CCR:S14",40,0,0,_CCR
.align 1
_P7CR:
.SYMDEF "_P7CR" IO:0,7,LEN:1
ds 1
.stabs "P7CR:S14",40,0,0,_P7CR
.align 1
_P6CR:
.SYMDEF "_P6CR" IO:0,6,LEN:1
ds 1
.stabs "P6CR:S14",40,0,0,_P6CR
.align 1
_P5CR:
.SYMDEF "_P5CR" IO:0,5,LEN:1
ds 1
.stabs "P5CR:S14",40,0,0,_P5CR
.align 1
_SCR:
.SYMDEF "_SCR" REG:1,15,LEN:1
ds 1
.stabs "SCR:S14",40,0,0,_SCR
.align 1
_LVDIWR:
.SYMDEF "_LVDIWR" REG:1,14,LEN:1
ds 1
.stabs "LVDIWR:S14",40,0,0,_LVDIWR
.align 1
_DT2:
.SYMDEF "_DT2" REG:1,12,LEN:1
ds 1
.stabs "DT2:S14",40,0,0,_DT2
.align 1
_DT1:
.SYMDEF "_DT1" REG:1,11,LEN:1
ds 1
.stabs "DT1:S14",40,0,0,_DT1
.align 1
_PRD2:
.SYMDEF "_PRD2" REG:1,10,LEN:1
ds 1
.stabs "PRD2:S14",40,0,0,_PRD2
.align 1
_PRD1:
.SYMDEF "_PRD1" REG:1,9,LEN:1
ds 1
.stabs "PRD1:S14",40,0,0,_PRD1
.align 1
_TMRCON:
.SYMDEF "_TMRCON" REG:1,8,LEN:1
ds 1
.stabs "TMRCON:S14",40,0,0,_TMRCON
.align 1
_PWMCON:
.SYMDEF "_PWMCON" REG:1,7,LEN:1
ds 1
.stabs "PWMCON:S14",40,0,0,_PWMCON
.align 1
_TBLP:
.SYMDEF "_TBLP" REG:1,6,LEN:1
ds 1
.stabs "TBLP:S14",40,0,0,_TBLP
.align 1
_TBHP:
.SYMDEF "_TBHP" REG:1,5,LEN:1
ds 1
.stabs "TBHP:S14",40,0,0,_TBHP
.align 1
_ISR2:
.SYMDEF "_ISR2" REG:0,15,LEN:1
ds 1
.stabs "ISR2:S14",40,0,0,_ISR2
.align 1
_ISR1:
.SYMDEF "_ISR1" REG:0,14,LEN:1
ds 1
.stabs "ISR1:S14",40,0,0,_ISR1
.align 1
_ADDATA1L:
.SYMDEF "_ADDATA1L" REG:0,13,LEN:1
ds 1
.stabs "ADDATA1L:S14",40,0,0,_ADDATA1L
.align 1
_ADDATA1H:
.SYMDEF "_ADDATA1H" REG:0,12,LEN:1
ds 1
.stabs "ADDATA1H:S14",40,0,0,_ADDATA1H
.align 1
_ADDATA:
.SYMDEF "_ADDATA" REG:0,11,LEN:1
ds 1
.stabs "ADDATA:S14",40,0,0,_ADDATA
.align 1
_ADOC:
.SYMDEF "_ADOC" REG:0,10,LEN:1
ds 1
.stabs "ADOC:S14",40,0,0,_ADOC
.align 1
_ADCON:
.SYMDEF "_ADCON" REG:0,9,LEN:1
ds 1
.stabs "ADCON:S14",40,0,0,_ADCON
.align 1
_AISR:
.SYMDEF "_AISR" REG:0,8,LEN:1
ds 1
.stabs "AISR:S14",40,0,0,_AISR
.align 1
_PORT7:
.SYMDEF "_PORT7" REG:0,7,LEN:1
ds 1
.stabs "PORT7:S14",40,0,0,_PORT7
.align 1
_PORT6:
.SYMDEF "_PORT6" REG:0,6,LEN:1
ds 1
.stabs "PORT6:S14",40,0,0,_PORT6
.align 1
_PORT5:
.SYMDEF "_PORT5" REG:0,5,LEN:1
ds 1
.stabs "PORT5:S14",40,0,0,_PORT5
.align 1
_RSR:
.SYMDEF "_RSR" REG:0,4,LEN:1
ds 1
.stabs "RSR:S14",40,0,0,_RSR
.align 1
_STATUS:
.SYMDEF "_STATUS" REG:0,3,LEN:1
ds 1
.stabs "STATUS:S14",40,0,0,_STATUS
.align 1
_PC:
.SYMDEF "_PC" REG:0,2,LEN:1
ds 1
.stabs "PC:S14",40,0,0,_PC
.align 1
_TCC:
.SYMDEF "_TCC" REG:0,1,LEN:1
ds 1
.stabs "TCC:S14",40,0,0,_TCC
.align 1
_IAR:
.SYMDEF "_IAR" REG:0,0,LEN:1
ds 1
.stabs "IAR:S14",40,0,0,_IAR
.align 1
_R0:
.SYMDEF "_R0" REG:0,0,LEN:1
ds 1
.stabs "R0:S14",40,0,0,_R0
.section ".code"
end
