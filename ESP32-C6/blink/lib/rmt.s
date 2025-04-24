.equ RMT_BASE,          0x60006000
.equ RMT_TX_START_CH0,        0x00
.equ RMT_DIV_CNT_CH0,         0x08
.equ RMT_CH0CONF0_REG,        0x10
.equ RMT_MEM_SIZE_CH0,        0x10 #set this to 4 to allow for up to 256 consecutive LED writes
.equ PCR_RMT_SCLK_CONF_REG,   0x30
.equ RMT_SYS_CONF_REG,        0x68
.equ RMT_CLK_EN,              0x00
.equ PCR_RMT_SCLK_SEL,        0x14 #default 80MHz clock
.equ PCR_RMT_SCLK_EN,         0x16

.equ RMT_RAM,    (RMT_BASE + 0x400)

.macro INIT_RMT
    ENABLE_RMT_CLOCK
    CONFIGURE_RMT_CHANNEL
.endm

.macro ENABLE_RMT_CLOCK
#The clock source of RMT can be PLL_F80M_CLK, RC_FAST_CLK, or XTAL_CLK, depending on the
#configuration of PCR_RMT_SCLK_SEL. RMT clock can be enabled by setting PCR_RMT_SCLK_EN. RMT
#working clock (see rmt_sclk in Figure 37-1) is obtained by dividing the selected clock source with a fractional
#divider.
    li t4, PCR_BASE
    li t5, (1 << PCR_RMT_SCLK_EN)  # Enable TG0 peripheral clock
    sw t5, PCR_RMT_SCLK_CONF_REG(t4)
.endm

.macro CONFIGURE_RMT_CHANNEL
    li t0, RMT_BASE
    li t1, (4 << RMT_MEM_SIZE_CH0) | (80 << RMT_DIV_CNT_CH0)
    sw t1, RMT_CH0CONF0_REG(t0)
.endm

.macro START_RMT_TX
    call begin_rmt_transmit
.endm

.macro WRITE_RMT_RAM, src_addr, num_bytes
    li a0, \src_addr
    li a1, \num_bytes
    call write_rmt_tx_ram
.endm


begin_rmt_transmit:
    li t0, RMT_BASE
    li t1, 1
    sw t1, RMT_CH0CONF0_REG(t0)
    ret

write_rmt_tx_ram:
    #Todo: implement this function
    li t0, RMT_BASE
    li t1, RMT_RAM
    li t2, RMT_MEM_SIZE_CH0
    ret