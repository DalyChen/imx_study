#include "MCIMX6Y2.h"
#include "fsl_iomuxc.h"



/*LED GPIO端口、引脚号及IOMUXC复用宏定义*/
#define LED_GPIO            GPIO1
#define LED_GPIO_PIN        (3U)
#define LED_IOMUXC         IOMUXC_GPIO1_IO03_GPIO1_IO03



#define LED0                0

#define LED_ON              1
#define LED_OFF             0


/*简单延时函数*/
void delay(uint32_t count)
{
    volatile uint32_t i = 0;
    for (i = 0; i < count; ++i)
    {
        __asm("NOP"); /* 调用nop空指令 */
    }
}

void led_switch(int led, int status)
{ 
    switch(led)
    {
        case LED0:
            if(status == LED_ON)
                GPIO1->DR &= ~(1<<3);
            else if(status == LED_OFF)
                GPIO1->DR |= (1<<3);
        break;
    }
}


int main()
{
    CCM->CCGR0 = 0XFFFFFFFF;
    CCM->CCGR1 = 0XFFFFFFFF;
    CCM->CCGR2 = 0XFFFFFFFF;
    CCM->CCGR3 = 0XFFFFFFFF;
    CCM->CCGR4 = 0XFFFFFFFF;
    CCM->CCGR5 = 0XFFFFFFFF;
    CCM->CCGR6 = 0XFFFFFFFF;

    IOMUXC_SetPinMux(LED_IOMUXC,0); 
    IOMUXC_SetPinConfig(LED_IOMUXC,0X10B0);

    GPIO1->GDIR |= (1 << 3);
    GPIO1->DR &= ~(1 << 3);

    while (1) {
        led_switch(LED0, LED_ON); 
        delay(500);

        led_switch(LED0, LED_OFF); 
        delay(500);
    }

    return 0;    
}
