#!/bin/sh

JOBS="-j 5"

set -x
set -e

git clone git://git.pengutronix.de/git/barebox.git

cd barebox

# Fake binary images
# see also Documentation/boards/imx/nxp-imx8m*-evk.rst
touch arch/arm/boards/globalscale-mirabox/binary.0
touch arch/arm/boards/lenovo-ix4-300d/binary.0
touch arch/arm/boards/marvell-armada-xp-db/binary.0
touch arch/arm/boards/marvell-armada-xp-gp/binary.0
touch arch/arm/boards/netgear-rn104/binary.0
touch arch/arm/boards/netgear-rn2120/binary.0
touch arch/arm/boards/pine64-quartz64/sdram-init.bin
touch arch/arm/boards/plathome-openblocks-ax3/binary.0
touch arch/arm/boards/radxa-rock3/sdram-init.bin
touch arch/arm/boards/rockchip-rk3568-bpi-r2pro/sdram-init.bin
touch arch/arm/boards/rockchip-rk3568-evb/sdram-init.bin
touch arch/arm/boards/turris-omnia/binary.0
touch firmware/ddr4_dmem_1d.bin
touch firmware/ddr4_dmem_2d.bin
touch firmware/ddr4_imem_1d.bin
touch firmware/ddr4_imem_2d.bin
touch firmware/fsl_fman_ucode_ls1046_r1.0_106_4_18.bin
touch firmware/imx8mm-bl31.bin
touch firmware/imx8mn-bl31.bin
touch firmware/imx8mp-bl31.bin
touch firmware/imx8mq-bl31.bin
touch firmware/lpddr4_pmu_train_1d_dmem.bin
touch firmware/lpddr4_pmu_train_1d_imem.bin
touch firmware/lpddr4_pmu_train_2d_dmem.bin
touch firmware/lpddr4_pmu_train_2d_imem.bin
touch firmware/ppa-ls1046a.bin
touch firmware/rk3568-bl31.bin

CROSS_COMPILE=arm-linux-gnueabi- \
	CROSS_COMPILE_imx_v8_defconfig=aarch64-linux-gnu- \
	CROSS_COMPILE_layerscape_defconfig=aarch64-linux-gnu- \
	CROSS_COMPILE_qemu_virt64_defconfig=aarch64-linux-gnu- \
	CROSS_COMPILE_rockchip_v8_defconfig=aarch64-linux-gnu- \
	CROSS_COMPILE_rpi_v8a_defconfig=aarch64-linux-gnu- \
	CROSS_COMPILE_zynqmp_defconfig=aarch64-linux-gnu- \
	./MAKEALL -a arm $JOBS

CROSS_COMPILE=mips-linux-gnu- ./MAKEALL -a mips $JOBS

CROSS_COMPILE=riscv64-linux-gnu- ./MAKEALL -a riscv $JOBS

CROSS_COMPILE=x86_64-linux-gnu- ./MAKEALL -a x86 $JOBS

CROSS_COMPILE="" ./MAKEALL -a sandbox $JOBS
