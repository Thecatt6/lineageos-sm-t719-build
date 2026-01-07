#!/bin/bash
set -e

DEFCONFIG="kernel/samsung/msm8976/arch/arm64/configs/gts28velte_defconfig"

# 1) Rimuovi righe obsolete / duplicate / inutili
sed -i -e '/CONFIG_ANDROID_INTF_ALARM_DEV/d' \
       -e '/CONFIG_ANDROID_LOW_MEMORY_KILLER/d' \
       -e '/CONFIG_ANDROID_BINDER_IPC/d' \
       -e '/CONFIG_SDFAT_FS/d' \
       -e '/CONFIG_EXFAT_FS/d' \
       -e '/CONFIG_SDCARD_FS/d' \
       -e '/CONFIG_SCHED_HMP/d' \
       -e '/CONFIG_SCHED_TASK_BEHAVIOR/d' \
       -e '/CONFIG_SEC_RESTRICT_ROOTING/d' \
       -e '/CONFIG_SEC_RESTRICT_ROOTING_LOG/d' \
       -e '/CONFIG_KNOX_KAP/d' \
       -e '/CONFIG_SEC_DEBUG/d' \
       -e '/CONFIG_SEC_PM_DEBUG/d' \
       -e '/CONFIG_SEC_BSP/d' \
       -e '/CONFIG_SEC_SSR_DEBUG_LEVEL_CHK/d' \
       -e '/CONFIG_CGROUP_FREEZER/d' \
       -e '/CONFIG_CGROUP_CPUACCT/d' \
       -e '/CONFIG_CGROUP_SCHED/d' \
       -e '/CONFIG_PANIC_TIMEOUT=/d' \
       -e '/CONFIG_DEBUG_INFO/d' \
       -e '/CONFIG_SCHEDSTATS/d' \
       -e '/CONFIG_DEBUG_PREEMPT/d' \
       -e '/CONFIG_DEBUG_NOTIFIERS/d' \
       "$DEFCONFIG"

# 2) Aggiungi/forza le opzioni moderne in coda al file
cat << 'EOCFG' >> "$DEFCONFIG"

# === Android 14/15 modern additions ===
CONFIG_ANDROID_BINDERFS=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
CONFIG_ANDROID_BINDERFS_SECURITY=y

CONFIG_CGROUPS=y
CONFIG_CGROUP2=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG_KMEM=y

CONFIG_UTS_NS=y
CONFIG_IPC_NS=y
CONFIG_PID_NS=y

CONFIG_OVERLAY_FS=y
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y

CONFIG_ZSWAP=y
CONFIG_ZSWAP_COMPACTION=y
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y

CONFIG_SCHED_MC=y
CONFIG_SCHED_AUTOGROUP=y
CONFIG_SCHED_CORE=y

CONFIG_PANIC_TIMEOUT=3
# CONFIG_DEBUG_INFO is not set
# CONFIG_SCHEDSTATS is not set
# CONFIG_DEBUG_PREEMPT is not set
# CONFIG_DEBUG_NOTIFIERS is not set
EOCFG

echo "Defconfig aggiornato: $DEFCONFIG"
