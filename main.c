#include "EM78P372N.h"
#define DISI()                _asm{disi}
#define WDTC()                _asm{wdtc}
#define NOP()                 _asm{nop}
#define ENI()                 _asm{eni}
#define SLEP()                _asm{slep}
//R4/(R3+R4) = 10/(10+10) = 0.5
#define LOW_BAT_VOLT_TH       0x955                                 //(3.5V/2)/3V*4096=2389
#define MID_BAT_VOLT_TH       0xA22                                 //(3.8V/2)/3V*4096=2594
#define LOW_BAT_VOLT          0x8CD                                 //(3.3V/2)/3V*4096=2253
#define VERY_LOW_BAT_VOLT     0x800                                 //(3.0V/2)/3V*4096=2048
#define SHORT_LOAD_VOLT       0x400                                 //(1.5V/2)/3V*4096=1024
#define CHARGE_BAT_VOLT_TH    0xB11                                 //(4.15V/2)/3V*4096=2833
#define WAKEUP_LOAD_VOLT      0x155                                 //(0.5V/2)/3V*4096=341
#define MOS_ON                1                                     //��MOS
#define MOS_OFF               156                                   //�ر�MOS
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
#define LOAD_KAILU_VOTL       0x44                                 //(0.1/2)/3V*4096=68
//#define LOAD_HIGH_TEMP       11                                     //2ŷķ
//#define LOAD_VOLT                                            //�������˵ĵ�ѹֵ

#define uchar unsigned char 
#define ushort unsigned short 
#define uint unsigned int 

uchar g_fault_state              @0X20:bank 0;  //����״̬��
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
uchar g_load_r					 @0X38:bank 0;
uchar g_time5min_start			 @0X39:bank 0;
uchar g_time2s_cnt 				 @0X3A:bank 0;
uchar g_time5min_flag			 @0X3B:bank 0;
uchar temp_keyval                @0X3C:bank 0;
ushort aa  @0X20:bank 1;
ushort bb  @0X22:bank 1;

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
//��RAM��ͨ�üĴ�������
void clr_ram(void)        
{
    RSR = 0x10;               //BANK 0 ��0x10�Ĵ���
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
void battery_volt_sample(void)     //��ص�Դ����,P50/ADC0,10K,15K  Vbat = 5/3*Vcaiji  
{      
    P5CR = 0x01; 
    
    ADE0 = 1;           //P50/ADC0������ΪADC0�����   
    
    ADIS2 = 0;          //ѡ��ADC0�����
    ADIS1 = 0;
    ADIS0 = 0;

    ADPD = 1;          //��ADC��Դ
        
    ADRUN = 1;  
    while(ADRUN == 1);  
    g_battery_volt_h = ADDATA1H;  
    g_battery_volt_l = ADDATA1L;  
    
    P5CR = 0x00; 
    ADE0 = 0; 
}  

//---------
void loadp_volt_sample(void)   //���ص�ѹ����,P51/ADC1/PWM2,10k,15k  Vload=5/3*Vcaiji
{
    //�����ɼ����β��ܲ�׼��ѹ
    ADE1 = 1;           //P51/ADC1������ΪADC1�����
        
    ADIS2 = 0;          //ѡ��ADIN1/P51�����
    ADIS1 = 0;
    ADIS0 = 1; 

    ADPD = 1;          //��ADC��Դ

    ADRUN = 1;
    while(ADRUN == 1);  
      
    delay_us(3);
    
    ADRUN = 1;
    while(ADRUN == 1);  

    g_loadp_volt_h = ADDATA1H;
    g_loadp_volt_l = ADDATA1L;    
}

//---------
void loadn_volt_sample(void)   //���ص�ѹ����,P52/ADC2,10k,15k  Vload=5/3*Vcaiji
{
    //�����ɼ����β��ܲ�׼��ѹ
    ADE2 = 1;           //P52/ADC2������ΪADC2�����
        
    ADIS2 = 0;          //ѡ��ADIN2/P52�����
    ADIS1 = 1;
    ADIS0 = 0; 

    ADPD = 1;          //��ADC��Դ

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
                PWM2IF = 0;                 //��PWM2�жϱ�־λ
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
							
							if(g_time2s_cnt == 10)//150
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
                
                DT1IF = 0;                         //��PWM1�жϱ�־λ
                
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


void led_disp(void)    //LED����
{
    if(g_led_light_times >= 1) 
    {
        if(g_led_onoff_status)   
        {
            if(g_led_light_times != 0xff)
            {
                g_led_onoff_status = 0;
            }
            
            g_led_onoff = 0;          //����
        }
        else
        {
            g_led_onoff_status = 1;
            g_led_onoff = 1;         //����            
            g_led_light_times--;
        }
    }
    else
    {
        g_led_onoff = 1;             //����
    }        
        
    if(g_led_r)
    {
        P70 = g_led_onoff;           //���
    }
    else
    {
        P70 = 1;                    //û�����ƾ����
    }
                  
    if(g_led_g)
    {
        P71 = g_led_onoff;         //�̵�
    }
    else
    {
        P71 = 1;                     //û�����ƾ����
    }
}

void led_ctrl_by_voltage(ushort volt_sample)        //��ͬ��ѹ���������
{
    if(volt_sample < LOW_BAT_VOLT_TH)      
    {
        g_led_r = 1;                  //���       
        g_led_g = 0;                  //�̵�        
    }
    else if(volt_sample < MID_BAT_VOLT_TH)    
    {
        g_led_r = 1;                  //���
        g_led_g = 1;                  //�̵� 
    }
    else
    {
        g_led_r = 0;                  //���
        g_led_g = 1;                  //�̵�
    }        
    
    g_led_onoff_status = 1;           //����
    g_led_light_times = 0xff;   
}

void pwm_timer_init(void)
{
    P6CR = 0;           //P67��Ϊ���
    TMRCON = 0X27;      //PWM1Ԥ��Ƶ����Ϊ1��256,PWM2Ԥ��Ƶ����Ϊ1��16
    PWMCON = 0X01;      //ʹ��PWM1�����
    PRD1 = 155;         //����=1/4*(155+1)*256=10ms
    PRD2 = 249;         //����=1/4*(249+1)*16=1ms
    IMR = 0X30;         //ʹ��PWM1ռ�ձȣ�PWM2�����ж�
    T2EN = 1;           //PWM2��ʱ��ʼ
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

void gpio_init()        //����Ϊ1  ���Ϊ0
{
    P5CR = 0X2F;        //P50,P51,P52,P53,P55��Ϊ���� 0010 1111
    P5PHCR = 0XD0;      //P50,P51,P52,P53,P55����  1101 0000
    P7CR = 0;           //P70,P71Ϊ���
	P70 = 1;            //Ĭ�Ϻ�ơ��̵ƶ��ǹر�
	P71 = 1;
}

void adc_init()
{   
    ADOC = 0x4;         //�ڲ��ο���ѹ3V
}

void led_status(uchar red, uchar green)
{
    g_led_r = red;
    g_led_g = green;
}

void mcu_init(void)   //MCU��ʼ��
{

    WDTC();
    DISI();
    SCR = 0X7F;       //ѡ��4MHz,TIMER ѡ����Ƶ
    
    clr_ram();
    gpio_init();
	adc_init();

    pwm_timer_init();  
    pwm_set(MOS_OFF);
    
    g_led_occupied = 0;
    led_status(1,1);
    led_blink(3);

    g_keyval = P55;
    if(g_keyval == 0)
    {
        g_keypress_maxtime = 1; 
    }
    else
    {
		g_keypress_maxtime = 0; 
    }
    g_next_state = 0x01;
    
    g_fault_state = 0x00;
}

void main(void)
{	
	clr_ram();
 
    mcu_init();
    g_time2s_flag=0;
	g_time5min_flag=0;
    temp_keyval = 0;
    g_lock_flag = 0x00;
  
    while(1)
    {
        g_cur_state = g_next_state;

        switch(g_cur_state)
        {
            case 0x01:                                     //����ģʽ           
                if((g_keypress_maxtime > 0)&&(g_lock_flag == 0x00))
                {
                    if(g_keypress_maxtime >= 200)          //�ж����̳���10s���
                    {
                        if (g_keypress_maxtime == 200)
                        {
                            pwm_set(MOS_OFF);                           
                            led_blink(9);       //��˸8�Σ������ʼ״̬����ʱ��һ��״̬
                        }
                        
                        break;                                                   
                    }                     
                     
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
                else
                {                        
                    if(g_time5min_flag == 1)
                    {
						g_time5min_flag = 0;
                        g_next_state = 0x08;                        
                    }
                    else
                    {                  
                        g_next_state = 0x01;
                    }
                    //�ͷŰ������
                    g_led_r = 0;
                    g_led_g = 0;
                }
                     
            break;
                
            case 0x02:                          //����ģʽ
                if(g_fault_state == 0x02)       //���䱣��
                {
                    led_status(0,0);
                    led_blink(10);
                    g_next_state = 0x08;
                }
                else if(g_fault_state == 0x04)  //��ѹ����
                {
                    led_status(1,0);
                    led_blink(10);
                    g_next_state = 0x08;     
                }
                else if(g_fault_state==0x08)    //���ؿ�·���߿��ر���
                {
                    led_status(1,0);
                    led_blink(5);
                    g_next_state = 0x08;
                }   
                else if(g_fault_state == 0x10)  //�������·����
                {
                    led_status(1,1);
                    led_blink(6);
                    g_next_state = 0x08;     
                } 
				else if(g_fault_state == 0x40)    //���ص������2��ʱ�򣬹��±���
				{
					led_status(1,0);
                    led_blink(5);
                    g_next_state = 0x08;
				}
				else if(g_fault_state == 0x80)   //����С��0.2��ʱ�򣬷���˿��· ������·
				{
					led_status(1,0);
                    led_blink(3);
                    g_next_state = 0x08;
				}
                else if(g_fault_state==0x20)    //���ɽ�����״̬        
                {
                    led_status(1,1);
                    led_blink(3);
                    g_next_state = 0x04;
                }
                else
                {
                    g_next_state = 0x01;
                } 
           
            break;
 
            case 0x04:                                 //���ģʽ 
				battery_volt_sample();
				pwm_set(MOS_OFF);
                if(g_battery_volt < SHORT_LOAD_VOLT){  //�������·����
					g_fault_state = 0x10;
                    g_next_state = 0x02;
				 }
				else if(g_battery_volt > CHARGE_BAT_VOLT_TH && P53 == 1)    //���䱣��
                {
                    g_fault_state = 0x02;
                    g_next_state = 0x02;
                }
                else
                {
					if(g_battery_volt < CHARGE_BAT_VOLT_TH && P53 == 0)
					{
						led_ctrl_by_voltage(g_loadn_volt);      //���ڳ���ʱ�򣬸��ݵ�ص�ѹֵ��������
					}
					else if(g_battery_volt < CHARGE_BAT_VOLT_TH && P53 == 1)   //�������г�������ε�
					{
						//��mos ��� ����
						g_led_b = 0;
						g_led_g = 0;
						g_next_state = 0x08;
					}
                }
            break;
    
            case 0x08:                                  //˯��ģʽ
                pwm_set(MOS_OFF);
                g_led_r = 0;
                g_led_g = 0;
				P5CR = 0X28;							//PORT5��Ϊ���� P53 P55  0���  1���� 0010 1000
				P5PDCR = 0XD7;  						//PORTW5��Ϊ����  1101 0111
                ISR1 = 0X02;                            //ʹ��PORT5״̬�ı份�ѹ���
                PORT5 = PORT5;                          //��ȡPORT5״̬
                IDLE = 0;
				g_lock_flag = 0x01;                     //˯��֮ǰ���뵽����״̬����Ҫ���ѱ���������5�ν��п���
                delay_us(2);
				SLEP();                                 //����˯��
                delay_us(20);
                
                g_time1ms_cnt = 0;
                g_time50ms_cnt = 0;
                g_time200ms_cnt = 0;
                g_led_light_times = 0;
                g_keypress_maxtime = 0;   
                
                //g_adc_flag = 0;
                //while(g_adc_flag == 0);
                
                //if(g_loadn_volt < WAKEUP_LOAD_VOLT)       //�ɰ������ѣ���������״̬
                //{
                  //  g_next_state = 0x01;
                //}
                //else 
				if(P53==0)                          //�ɳ�������ѣ���������� if(P53==0)
                {
                    g_fault_state = 0x20;
                    g_next_state = 0x02;
                    g_lock_flag = 0x00;
                }
				
				if(P55 == 0)
				{
					g_next_state =0x01;
				}
                
              break;
    
            default:
                g_next_state = 0x08;
            break;                
        }
            
        if(((g_time50ms_flag == 1)||(g_cur_state == 0x08)))           //key����
        {
            g_time50ms_flag = 0;
			P5CR = 0X2F;        //P50,P51,P52,P53,P55��Ϊ���� 0010 1111  //����ط����������ʼ��������õ��İ���ֵһֱΪ1������
			P5PHCR = 0XD0;      //P50,P51,P52,P53,P55����  1101 0000
            g_keyval = P55;
            
            if(((temp_keyval == g_keyval)&&(g_keyval == 0))||(g_cur_state == 0x08)) 
            {
                if(g_keypress_maxtime == 255)
                {
                    g_keypress_maxtime = 255;
                }
                else //if((temp_keyval == g_keyval)&&(g_keyval == 0))
                {
                    //��������ʱ����¼����ʱ�䣬ͨ��ʱ���ж�10s����
                    g_keypress_maxtime++;
					//g_next_state = 0x01;
					//�������¾Ϳ�ʼ����2s��ʱ
					if(g_keypress_times == 0)
					{
						g_time2s_start = 1;
						g_time5min_start = 1;
					}
                }
                
                //�ɼ���һ�ΰ�������ʱ�ĵ�ص�ѹ������ֻ�е�ǰΪ����״̬����״̬�Ųɼ�
                if ((g_lock_flag == 0x00) && (g_keypress_maxtime == 1))
                {
                    if ((g_cur_state == 0x08)||(g_cur_state == 0x01))
                    {
                        pwm_set(MOS_ON);

                        battery_volt_sample();
						NOP();NOP();
						if(g_battery_volt < VERY_LOW_BAT_VOLT)        //����س���ѹ����,С��3Vʱ
                        {
                            pwm_set(MOS_OFF);
                            g_lock_flag = 0x01;                     //���뵽lock״̬
							g_next_state = 0x08;
                        } 
                        if(g_battery_volt < LOW_BAT_VOLT)        //����ص�ѹ���� 
                        {
                            pwm_set(MOS_OFF);
                            g_fault_state = 0x04;
                            g_next_state = 0x02;
                        } 
                        else
                        {
                            led_ctrl_by_voltage(g_battery_volt);     
                        }
                    }
                }
                
                /* //�������¾Ϳ�ʼ����2s��ʱ
                if(g_keypress_times == 0)
                {
                    g_time2s_start = 1;
					g_time5min_start = 1;
                }*/
            }
            //else 
			if((temp_keyval == 0)&&(g_keyval == 1) )
            {     
                if( g_keypress_maxtime < 40)
                {
                    g_keypress_times++;
                }
                
                //�����ɿ�ʱ���ص�MOS��
                pwm_set(MOS_OFF);
                g_led_g = 0;
				g_led_b = 0;
                g_keypress_maxtime = 0;
            }
            
            temp_keyval = g_keyval;
        }
        
        if(g_time200ms_flag == 1 ||(g_cur_state == 0x01))           //ָʾ�ƴ���
        {
            g_time200ms_flag = 0;
            led_disp();
			
			//����Ҫ����g_load_volt p/n��ֵ��ȥ���㸺�صĵ���ֵ���Ӷ��õ���Ӧ���¶�ֵ
			// ����˿���裺r = g_loadn_volt / (g_loadp_volt - g_loadn_volt * 50)
			// if (r>2ŷķ){ pwm_set(MOS_41_42);} �������ĳ��ֵʱ���൱���¶ȳ���������¶�
			//��������Ǹ�����  ���費��Ҫ����һ�������ķŴ�
			if((g_cur_state == 0x01) && (g_keypress_maxtime > 0) && (g_lock_flag == 0x00))        //��������δ��룬g_loadn_volt>g_loadp_volt??  �������Ӧ����������ģ�����
			{
				g_adc_flag = 0;
				while(g_adc_flag == 0);
				//battery_volt_sample();
				NOP();
				
				if(g_loadn_volt < SHORT_LOAD_VOLT)         //���������·����
				{
					pwm_set(MOS_OFF);
					g_fault_state = 0x80;
					g_next_state = 0x02;
				}				
				//������˵ĵ�ѹֵС��0.1����Ϊ�ǿ���,����о����ܻ��������⣿
				else if((g_loadp_volt > g_loadn_volt) && (g_loadn_volt >SHORT_LOAD_VOLT) && (g_loadp_volt - g_loadn_volt < LOAD_KAILU_VOTL))
				{
					pwm_set(MOS_OFF);
					g_fault_state = 0x08;
					g_next_state = 0x02;
				}
				
				/*aa = g_loadp_volt - g_loadn_volt;
				
				bb = g_loadn_volt * 15; // g_loadn_volt�Ŵ�10000��,bbΪushort  0-65536 ���42000 (g_loadn_volt*6/4096)*10000=bb
				
				g_load_r = bb / (aa * 7);  //g_load_r�Ŵ�100��   ���ӷŴ�10000��,��ĸ�Ŵ�100��, ����: (aa*6/4096)*100*50(����)
				/////���еķ���
				*/
				
				/*aa = (g_loadp_volt - g_loadn_volt)*100;
				NOP();
				NOP();
				bb = g_loadn_volt * 100; // g_loadn_volt�Ŵ�10000��,bbΪushort  0-65536 ���42000 (g_loadn_volt*6/4096)*10000=bb
				/////////////////bb��ֵ����ȷ���õ���ֵ��Ӧ���ǳ�����65536,���ʱ����������
				g_load_r = bb / (aa * 50);  //g_load_r�Ŵ�100��   ���ӷŴ�10000��,��ĸ�Ŵ�100��, ����: (aa*6/4096)*100*50(����)*/
				
				aa = g_loadp_volt - g_loadn_volt;
				bb = g_loadn_volt * 10; // g_loadn_volt�Ŵ�10��,bbΪushort  0-65536 ���40960 (g_loadn_volt*6/4096)*10000=bb
				g_load_r = bb / aa;   //g_load_r = g_loadn_volt / (aa * 50)  �൱�� (bb/aa)*500 �Ŵ���500��
				///////////////////////�����������������֮�� ��ʱ�����ʱ�򲻻�  g_loadp_volt/g_loadn_volt��ֵ������;
				
				if(g_load_r > 1000)            //���±���  ����2ŷķ���±�������Ϊ1000
				{
					pwm_set(MOS_OFF);
					g_fault_state = 0x40;
					g_next_state = 0x02;
				}
			}
		}   

        if(g_time2s_flag == 1)
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
					//g_next_state = 0x08;
                }
                else
                {
                    led_status(1,1);
                    led_blink(5);
                    g_lock_flag = 0x00;
					g_next_state = 0x01;
                }
            }
            g_keypress_times  =  0;
        }
    }
}