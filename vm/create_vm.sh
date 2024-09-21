#!/bin/bash

mkdir -p ~/.vm/win10/
cd ~/.vm/win10/

echo "Creating hard disk image in $(PWD)"
qemu-img create -f raw windows_vm 50G

echo "Creating backup of hard disk image in $(PWD)"
qemu-img create -o backing_file=windows_vm,backing_fmt=raw -f qcow2 windows_vm.cow

echo "Installing ISO on hard disk image"
qemu-system-x86_64 -cdrom ~/Downloads/Win10_22H2_English_x64v1.iso -boot order=d -drive file=windows_vm,format=raw
