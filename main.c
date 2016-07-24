#include "EM78P372N.h"

#define DISI()                _asm{disi}
#define WDTC()                _asm{wdtc}
#define NOP()                 _asm{nop}
#define ENI()                 _asm{eni}
#define SLEP()                _asm{slep}
//R4/(R3+R4) = 10/(10+10) = 0.5
#define OPEN_LOW_BAT_VOLT     0x019                                 //(0.0366V/2)/3V*4096=25
#define SHORT_LOW_BAT_VOLT    0x044                                 //(0.1V/2)/3V*4096=68
#define VERY2_LOW_BAT_VOLT    0x555                                 //(2V/2)/3V*4096=1365
#define LOW_BAT_VOLT_TH       0x955                                 //(3.5V/2)/3V*4096=2389
#define MID_BAT_VOLT_TH       0xA22                                 //(3.8V/2)/3V*4096=2594
#define LOW_BAT_VOLT          0x8CD                                 //(3.3V/2)/3V*4096=2253
#define VERY_LOW_BAT_VOLT     0x800                                 //(3.0V/2)/3V*4096=2048
#define CHARGE_BAT_VOLT_TH    0xB11                                 //(4.15V/2)/3V*4096=2833
#define CHARGE_BAT_VOLT_TL    0xAEF                                 //(4.10V/2)/3V*4096=2799
#define MOS_ON                1                                     //打开MOS
#define MOS_OFF               156                                   //关闭MOS
#define VBAT37                0x9DD                                 //(3.7V/2)/3V*4096=2525  --100
#define VBAT38                0xA22                                 //(3.8V/2)/3V*4096=2594  --94
#define VBAT39                0xA66                                 //(3.9V/2)/3V*4096=2662  --90
#define VBAT40                0xAAB                                 //(4.0V/2)/3V*4096=2731  --85
#define VBAT41                0xAEF                                 //(4.1V/2)/3V*4096=2799  --81
#define VBAT42                0xB33                                 //(4.2V/2)/3V*4096=2867  --77
#define MOS_37_38             5                                     //3%*156 = 5            
#define MOS_38_39             13                                    //8%*156 = 13  
#define MOS_39_40             19                                    //12%*156 = 19  
#define MOS_40_41             27                                    //17%*156 = 27 
#define MOS_41_42             33                                    //21%*156 = 33

#define uchar unsigned char 
#define ushort unsigned short 
#define uint unsigned int 

uchar g_fault_state              @0X20:bank 0;  //故障状态字
ushort g_loadp_volt              @0X21:bank 0;
uchar g_loadp_volt_l             @0X21:bank 0;
uchar g_loadp_volt_h             @0X22:bank 0;

ushort g_loadn_volt              @0X23:bank 0;
uchar g_loadn_volt_l             @0X23:bank 0;
uchar g_loadn_volt_h             @0X24:bank 0;

ushort g_battery_volt            @0X25:bank 0;
uchar g_battery_volt_l           @0X25:bank 0;
uchar g_battery_volt_h           @0X26:bank 0;
uchar g_keyval                   @0X27:bank 0;
uchar g_time1ms_cnt              @0X28:bank 0;
uchar g_time50ms_cnt             @0X29:bank 0;
uchar g_time50ms_flag            @0X2A:bank 0;
uchar g_time200ms_cnt            @0X2B:bank 0;
uchar g_time200ms_flag           @0X2C:bank 0;
uchar g_time2s_flag              @0X2D:bank 0;
bit g_led_r                      @0X2E @0:bank 0;
bit g_led_g                      @0X2E @1:bank 0;
bit g_led_b                      @0X2E @2:bank 0;
bit g_led_onoff_status           @0X2E @3:bank 0;
bit g_led_occupied               @0X2E @7:bank 0;
    
uchar g_led_light_times          @0X2F:bank 0;
uchar g_keypress_times           @0X30:bank 0;
uchar g_keypress_maxtime         @0X31:bank 0;
uchar g_led_onoff                @0X32:bank 0;

uchar g_cur_state                @0X33:bank 0;
uchar g_next_state               @0X34:bank 0;

uchar g_lock_flag                @0X35:bank 0;
uchar g_adc_flag                 @0X36:bank 0;  
uchar g_time2s_start             @0X37:bank 0;
ushort g_load_r                  @0X38:bank 0;
uchar g_time5min_start           @0X3A:bank 0;
uchar g_time2s_cnt               @0X3B:bank 0;
uchar g_time5min_flag            @0X3C:bank 0;
uchar temp_keyval                @0X3D:bank 0;

ushort g_load_n_p                @0X20:bank 1;
ushort g_load_n                  @0X22:bank 1;
uchar  g_charge_flag             @0X24:bank 1;

extern int IntVecIdx; //occupied 0x10:rpage 0
//---------
void delay_us(uchar count)
{
    uchar i,j; 
    
    for (i = 0; i < count; i++)
    {
        NOP(); 
        NOP(); 
        NOP(); 
        NOP();           
    }
}
//---------
//将RAM区通用寄存器清零
void clr_ram(void)        
{
    RSR = 0x10;               //BANK 0 的0x10寄存器
    do
    {  
        R0 = 0;         
        RSR++;
        if (RSR == 0x40)
        {    
           RSR = 0x60;
        }
     }while(RSR < 0x80);

}

//---------
void battery_volt_sample(void)     //电池电源采样,P50/ADC0,10K,10K  Vbat = 1/2*Vcaiji  
{        
    ADE0 = 1;           //P50/ADC0引脚作为ADC0输入口   
    
    ADIS2 = 0;          //选择ADC0输入口
    ADIS1 = 0;
    ADIS0 = 0;

    ADPD = 1;          //打开ADC电源
    
    ADRUN = 1;
    while(ADRUN == 1); 
    
    delay_us(3);
    
    ADRUN = 1;
    while(ADRUN == 1);
    
    g_battery_volt_h = ADDATA1H;  
    g_battery_volt_l = ADDATA1L;  
}  

//---------
void loadp_volt_sample(void)   //负载电压采样,P51/ADC1/PWM2,10k,10k  Vload=1/2*Vcaiji
{
    //连续采集两次才能采准电压
    ADE1 = 1;           //P51/ADC1引脚作为ADC1输入口
        
    ADIS2 = 0;          //选择ADIN1/P51输入口
    ADIS1 = 0;
    ADIS0 = 1; 

    ADPD = 1;          //打开ADC电源

    ADRUN = 1;
    while(ADRUN == 1);  
      
    delay_us(3);
    
    ADRUN = 1;
    while(ADRUN == 1);  

    g_loadp_volt_h = ADDATA1H;
    g_loadp_volt_l = ADDATA1L;    
}

//---------
void loadn_volt_sample(void)   //负载电压采样,P52/ADC2,10k,10k  Vload=1/2*Vcaiji
{
    //连续采集两次才能采准电压
    ADE2 = 1;           //P52/ADC2引脚作为ADC2输入口
        
    ADIS2 = 0;          //选择ADIN2/P52输入口
    ADIS1 = 1;
    ADIS0 = 0; 

    ADPD = 1;          //打开ADC电源

    ADRUN = 1;
    while(ADRUN == 1);  
      
    delay_us(3);
    
    ADRUN = 1;
    while(ADRUN == 1);  

    g_loadn_volt_h = ADDATA1H;
    g_loadn_volt_l = ADDATA1L;    
}

//---------
void _intcall ALLInt(void) @ int 
{     
    switch(IntVecIdx)
    {
        case 0x16:
            if (PWM2IF == 1)
            {
                PWM2IF = 0;                 //清PWM2中断标志位
                g_time1ms_cnt++;
                if(g_time1ms_cnt == 50)
                {
                    g_time1ms_cnt = 0;
                    g_time50ms_flag = 1;
                    g_time50ms_cnt++;
                    if(g_time50ms_cnt == 4)
                    {
                        g_time50ms_cnt = 0;
                        g_time200ms_flag = 1;

                        if(g_time2s_start==1)
                        {
                            g_time2s_start = 0;
                            g_time200ms_cnt = 0;
                            g_time2s_flag = 0;
                        }
                        else
                        {
                            g_time200ms_cnt++;
                        }
                        
                        if(g_time200ms_cnt == 10)
                        {
                            g_time200ms_cnt = 0;
                            g_time2s_flag = 1;
                            
                            if(g_time5min_start==1)
                            {
                                g_time5min_start = 0;
                                g_time2s_cnt=0;
                                g_time5min_flag = 0;
                            }
                            else
                            {
                                g_time2s_cnt++;
                            }
                            
                            if(g_time2s_cnt == 150)//10 调试用
                            {
                                g_time2s_cnt = 0;
                                g_time5min_flag = 1;
                            }
                        }
                    }
                }
            }
        break;

        case 0x19:
            if (DT1IF == 1)
            {
                delay_us(10);
                if(g_keypress_maxtime < 200)
                {
                    loadp_volt_sample();
                    NOP();
                    NOP();
                    loadn_volt_sample();
                }
                
                DT1IF = 0;                         //清PWM1中断标志位
                
                g_adc_flag = 1;
            }
        break;
    }     
}

//---------
void _intcall PWM2P_l(void) @0x15:low_int 6
{
    _asm{MOV A,0x2};
}

void _intcall PWM1D_l(void) @0x18:low_int 7
{
    _asm{MOV A,0x2};
}

void led_disp(void)                    //LED控制
{
    if(g_led_light_times >= 1) 
    {
        if(g_led_onoff_status)   
        {
            if(g_led_light_times != 0xff)
            {
                g_led_onoff_status = 0;
            }
            
            g_led_onoff = 0;          //灯亮
        }
        else
        {
            g_led_onoff_status = 1;
            g_led_onoff = 1;         //灯灭            
            g_led_light_times--;
        }
    }
    else
    {
        g_led_onoff = 1;             //灯灭
    }        
        
    if(g_led_r)
    {
        P70 = g_led_onoff;           //红灯
    }
    else
    {
        P70 = 1;                     //没被控制就灭灯
    }
                  
    if(g_led_g)
    {
        P71 = g_led_onoff;          //绿灯
    }
    else
    {
        P71 = 1;                  //没被控制就灭灯
    }
}

void led_ctrl_by_voltage(ushort volt_sample)        //不同电压区间灯闪亮
{
    if(volt_sample < LOW_BAT_VOLT_TH)      
    {
        g_led_r = 1;                  //红灯亮
        g_led_g = 0;                        
    }
    else if(volt_sample < MID_BAT_VOLT_TH)    
    {
        g_led_r = 1;                  //红灯亮
        g_led_g = 1;                  //绿灯亮 
    }
    else
    {
        g_led_r = 0;                  
        g_led_g = 1;                  //绿灯亮
    }        
    
    g_led_onoff_status = 1;           //灯亮
    g_led_light_times = 0xff;   
}

void calc_load_r(ushort load_n_volt, ushort load_p_volt)    //计算负载阻值
{
    if((load_n_volt > VERY2_LOW_BAT_VOLT) && (load_p_volt > VERY2_LOW_BAT_VOLT))
    {
        if (load_n_volt > load_p_volt)
        {
            g_load_n_p = load_n_volt - load_p_volt;        //修正误差
        }
        else 
        {
            g_load_n_p = load_p_volt - load_n_volt;
        }
        
        g_load_n = load_n_volt * 10;                        //g_loadn_volt放大10倍,g_load_n为ushort  0-65536 最大40960 (g_loadn_volt*6/4096)*10000=g_load_n
        g_load_r = g_load_n / g_load_n_p;                   //g_load_r = g_loadn_volt / (g_load_n_p * 50)  相当于 (g_load_n/g_load_n_p)*500 放大了500倍                
        ///////////////////////运行完上面那条语句之后 有时候会有时候不会  g_loadp_volt/g_loadn_volt的值就乱了;
    }
}

void pwm_timer_init(void)
{
    P6CR = 0;           //P67设为输出
    TMRCON = 0X27;      //PWM1预分频比设为1：256,PWM2预分频比设为1：16
    PWMCON = 0X01;      //使能PWM1输出口
    PRD1 = 155;         //周期=1/4*(155+1)*256=10ms
    PRD2 = 249;         //周期=1/4*(249+1)*16=1ms
    IMR = 0X30;         //使能PWM1占空比，PWM2周期中断

    T2EN = 1;           //PWM2定时开始
    ENI();  
}

void pwm_set(uchar duty)
{
    DT1 = duty;
    T1EN = 1;
}

void led_blink(uchar times)
{
    if(g_led_occupied == 0)
    {
        g_led_onoff_status = 1;
        g_led_occupied = 1;
        g_led_light_times = times;
    } 
    
    do
    {
        if(g_time200ms_flag == 1)
        {
            g_time200ms_flag = 0;
            led_disp();
        }  
    }while(g_led_light_times != 0);
    
    if(g_led_light_times == 0)
    {
        g_led_occupied = 0;
    }
}

void gpio_init()        //输入为1  输出为0
{
    P5CR = 0X2F;        //P50,P51,P52,P53,P55设为输入 0010 1111
    P5PHCR = 0XD0;      //P50,P51,P52,P53,P55上拉  1101 0000
    P7CR = 0;           //P70,P71为输出
    P70 = 1;            //默认红灯、绿灯都是关闭
    P71 = 1;
}

void adc_init()
{   
    ADOC = 0x4;         //内部参考电压3V
}

void led_status(uchar red, uchar green)
{
    g_led_r = red;
    g_led_g = green;
}

void mcu_init(void)   //MCU初始化
{

    WDTC();
    DISI();
    SCR = 0X7F;       //选择4MHz,TIMER 选择主频
    
    clr_ram();
    gpio_init();
    adc_init();

    pwm_timer_init();  
    pwm_set(MOS_OFF);
    g_led_occupied = 0;
    led_status(1,1);
    led_blink(3);

    if(P53 == 0)
    {
        g_next_state = 0x01;
    }
    else
    {
        g_next_state = 0x08;
    }
    
    g_fault_state = 0x00;
}

void main(void)
{    
    mcu_init();
    g_time2s_flag=0;
    g_time5min_flag=0;
    temp_keyval = 1;
    g_lock_flag = 0x00;
    g_charge_flag = 0;
  
    while(1)
    {
        g_cur_state = g_next_state;

        switch(g_cur_state)
        {
            case 0x01:                                     //正常模式           
                if((g_keypress_maxtime > 0) && (g_lock_flag == 0x00))
                {
                    if(g_keypress_maxtime >= 200)          //判断吸烟超过10s情况
                    {
                        if (g_keypress_maxtime == 200)
                        {
                            pwm_set(MOS_OFF);                           
                            led_blink(9);                  //闪烁8次，避免初始状态灯亮时少一次状态
                        }
                        
                        break;                                                   
                    } 
                                        
                    calc_load_r(g_loadn_volt, g_loadp_volt);
                   
                    if((g_load_r < 100)  || (g_loadn_volt < SHORT_LOW_BAT_VOLT))                     //检测雾化器短路故障，放大了500倍
                    {
                        pwm_set(MOS_OFF);
                        g_fault_state = 0x40;
                        g_next_state = 0x02;
                        
                        break;
                    }
                    
                    if(g_load_n_p < OPEN_LOW_BAT_VOLT)              //认为是空载状态            
                    {
                        pwm_set(MOS_OFF);                    
                        g_fault_state = 0x08;
                        g_next_state = 0x02;
                    }
                    else
                    {   
                        if(g_battery_volt <= VBAT37)
                        {   
                            pwm_set(MOS_ON);
                        } 
                        else if (g_battery_volt <= VBAT38)
                        {
                            pwm_set(MOS_37_38);
                        }
                        else if(g_battery_volt <= VBAT39)
                        {
                            pwm_set(MOS_38_39);
                        }
                        else if(g_battery_volt <= VBAT40)
                        {
                            pwm_set(MOS_39_40);
                        }
                        else if(g_battery_volt <= VBAT41)
                        {
                            pwm_set(MOS_40_41);
                        } 
                        else
                        {
                            pwm_set(MOS_41_42);
                        }
                    }              
                }
                else
                {                        
                    if(g_time5min_flag == 1)
                    {
                        g_time5min_flag = 0;
                        g_lock_flag = 0x01;
                        g_next_state = 0x08;                        
                    }
                    else
                    {                  
                        g_next_state = 0x01;
                        
                        if(g_battery_volt > VERY2_LOW_BAT_VOLT)
                        {
                            if((P53 == 0) && (g_battery_volt < CHARGE_BAT_VOLT_TL))                          //由充电器唤醒，充电器正常
                            {
                                if(g_charge_flag == 0)
                                {
                                    g_fault_state = 0x20;
                                    g_next_state = 0x02;
                                    g_lock_flag = 0x00;
                                }
                                else 
                                {
                                    g_next_state = 0x04;
                                }
                                
                                break;
                            }
                        } 
                    }
                    //释放按键灭灯
                    g_led_r = 0;
                    g_led_g = 0;
                }
                     
            break;
                
            case 0x02:                             //故障模式
                if(g_fault_state == 0x02)          //过充保护
                {
                    led_status(0,1);
                    led_blink(10);
                    g_next_state = 0x08;
                }
                else if(g_fault_state == 0x04)     //低压保护
                {
                    led_status(1,0);
                    led_blink(10);
                    g_next_state = 0x08;     
                }
                else if(g_fault_state == 0x08)    //负载开路或者空载保护
                {
                    led_status(1,0);
                    led_blink(5);
                    g_next_state = 0x08;
                }   
                else if(g_fault_state==0x20)      //过渡进入充电状态        
                {
                    led_status(1,1);
                    led_blink(3);
                    g_next_state = 0x04;
                }
                else if(g_fault_state == 0x40)    //电阻小于0.2的时候，发热丝短路 雾化器短路
                {
                    led_status(1,0);
                    led_blink(3);
                    g_next_state = 0x08;
                }
                else
                {
                    g_next_state = 0x01;
                } 
           
            break;
 
            case 0x04:                          //充电模式 
                pwm_set(MOS_OFF);
                
                if(g_time200ms_flag == 1)       //采集电池电压
                {
                    g_time200ms_flag = 0;
                    battery_volt_sample();
                }                    
                
                if(g_battery_volt > VERY2_LOW_BAT_VOLT)
                {
                    if(P53 == 0)             
                    {
                        g_charge_flag = 1;
                        led_ctrl_by_voltage(g_battery_volt);                       //正在充电的时候，根据电池电压值进行亮灯
                    }
                    else
                    {
                        if(g_battery_volt >= CHARGE_BAT_VOLT_TH)    //过充保护
                        {
                            g_charge_flag = 1;
                            g_fault_state = 0x02;
                            g_next_state = 0x02;
                        }
                        else  //充电过程中充电器被拔掉
                        {
                            //关mos 灭灯 待机
                            P70 = 1;
                            P71 = 1;
                            g_charge_flag = 0;
                            g_next_state = 0x08;
                        }
                    }
                }
                                
            break;
    
            case 0x08:                                  //睡眠模式
                pwm_set(MOS_OFF);
                g_led_r = 0;
                g_led_g = 0;
                P70 = 1;
                P71 = 1;
                ISR1 = 0X02;                            //使能PORT5状态改变唤醒功能
                PORT5 = PORT5;                          //读取PORT5状态
                IDLE = 0;
                delay_us(2);
                SLEP();                                 //进入睡眠
                delay_us(20);
                
                g_time1ms_cnt = 0;
                g_time50ms_cnt = 0;
                g_time200ms_cnt = 0;
                g_led_light_times = 0;
                g_keypress_maxtime = 0;   
                
                battery_volt_sample();
                delay_us(20);   

                if(P55 == 0)                            //由按键唤醒，进入吸烟状态 
                {
                    g_next_state = 0x01;
                }
                
                if((P53 == 0) && (g_battery_volt < CHARGE_BAT_VOLT_TL))                            //由充电唤醒，进入充电状态
                {
                    if(g_charge_flag == 0)
                    {   
                        g_fault_state = 0x20;
                        g_next_state = 0x02;
                        g_lock_flag = 0x00;
                    }
                    else 
                    {
                        g_next_state = 0x04;
                    }
                }
              break;
    
            default:
                g_next_state = 0x08;
            break;                
        }
            
        if(((g_time50ms_flag == 1)||(g_cur_state == 0x08))&&(g_next_state != 0x04)&&(g_next_state != 0x02))           //key处理
        {
            g_time50ms_flag = 0;
            g_keyval = P55;
            
            if(((temp_keyval == g_keyval)&&(g_keyval == 0))||(g_cur_state == 0x08)) 
            {
                if(g_keypress_maxtime == 255)
                {
                    g_keypress_maxtime = 255;
                }
                else
                {
                    //持续按键时，记录按键时间，通过时间判定10s吸烟
                    g_keypress_maxtime++;
                }
                
                //采集第一次按键按下时的电池电压，并且只有当前为正常状态或唤醒状态才采集，先检测电池电压，再检测负载电压
                if ((g_lock_flag == 0x00) && (g_keypress_maxtime == 1))
                {
                    if ((g_cur_state == 0x08)||(g_cur_state == 0x01))
                    {   
                        battery_volt_sample();
                                                
                        if(g_battery_volt < VERY_LOW_BAT_VOLT)        //检测电池超低压故障,小于3V时
                        {
                            pwm_set(MOS_OFF);
                            g_lock_flag = 0x01;                       //进入到lock状态
                            g_charge_flag = 0x00;
                            g_next_state = 0x08;
                        } 
                        else if(g_battery_volt < LOW_BAT_VOLT)        //检测电池低压故障 
                        {
                            pwm_set(MOS_OFF);
                            g_charge_flag = 0x00;
                            g_fault_state = 0x04;
                            g_next_state = 0x02;
                        } 
                        else
                        {
                            led_ctrl_by_voltage(g_battery_volt);     
                        }
                        
                        pwm_set(MOS_ON);
                        delay_us(20);
                        
                        g_adc_flag = 0;
                        while(g_adc_flag == 0);
                    }
                }
                
                //按键按下就开始启动2s计时
                if(g_keypress_times == 0)
                {
                    g_time2s_start = 1;
                    g_time5min_start = 1;
                }
            }           
            else if((temp_keyval == 0) && (g_keyval == 1))
            {     
                if( g_keypress_maxtime < 40)
                {
                    g_keypress_times++;
                }
                
                //按键松开时，关掉MOS管
                pwm_set(MOS_OFF);
                g_keypress_maxtime = 0;
            }
            
            temp_keyval = g_keyval;
        }
        
        if(g_time200ms_flag == 1)           //指示灯处理
        {
            g_time200ms_flag = 0;
            led_disp();           
        }   

        if((g_time2s_flag == 1)&&(g_next_state != 0x04)&&(g_next_state != 0x02))
        {
            g_time2s_flag = 0;
            if(g_keypress_times >= 5)
            {                 
                pwm_set(MOS_OFF);
                  
                if(g_lock_flag == 0x00)
                {
                    led_status(1,1);
                    led_blink(3);
                    g_lock_flag = 0x01;
                    g_charge_flag = 0x00;
                }
                else
                {
                    led_status(1,1);
                    led_blink(3);
                    g_lock_flag = 0x00;
                    g_next_state = 0x01;
                }
            }
            g_keypress_times  =  0;
        }  
    }
}