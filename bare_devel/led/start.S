.text            //代码段
.align 2         //设置字节对齐
.global _start   //定义全局变量

_start:          //程序的开始
	b reset      //跳转到reset标号处

    reset:
    mrc     p15, 0, r0, c1, c0, 0     /*读取CP15系统控制寄存器   */
    bic     r0,  r0, #(0x1 << 12)     /*  清除第12位（I位）禁用 I Cache  */
    bic     r0,  r0, #(0x1 <<  2)     /*  清除第 2位（C位）禁用 D Cache  */
    bic     r0,  r0, #0x2             /*  清除第 1位（A位）禁止严格对齐   */
    bic     r0,  r0, #(0x1 << 11)     /*  清除第11位（Z位）分支预测   */
    bic     r0,  r0, #0x1             /*  清除第 0位（M位）禁用 MMU   */
    mcr     p15, 0, r0, c1, c0, 0     /*  将修改后的值写回CP15寄存器   */

    ldr sp, =0x80001000   //暂时设置到这个位置
    b main 
    ldr pc, =main   //跳转到main函数执行

    /*进入死循环*/
loop:
    b loop



