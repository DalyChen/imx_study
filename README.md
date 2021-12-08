# imx_study
学习使用 i.MX芯片，Linux移植。

CPU 型号：MCIMX6Y2CVM08AB

烧写相关：

    dcd.config，NXP 官方有提供，但是 DDR3L 是 1GBx16bit 的
    原子的板子是 256Mx16bit 的，不知道能否直接用
    可以扒拉寄存器的配置，但是感觉不是第一波要做的事情
    第一波还是基于原子的 imxdownload 工具来测试吧