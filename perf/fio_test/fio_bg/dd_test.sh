#! /bin/bash

cgroup_root="/sys/fs/cgroup/unified/"
blkio_name="bg"

dd if=/dev/zero of=writers1.1.0 bs=1048576 count=1023 conv=fdatasync &
echo $! > /sys/fs/cgroup/unified/fg/cgroup.procs
cat /sys/fs/cgroup/unified/fg/cgroup.procs

dd if=/dev/zero of=writers2.1.0 bs=1048576 count=1024 conv=fdatasync &
echo $! > /sys/fs/cgroup/unified/bg/cgroup.procs
cat /sys/fs/cgroup/unified/bg/cgroup.procs
