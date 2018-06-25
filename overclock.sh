#!/bin/bash
nvidia-settings -a '[gpu:0]/GPUMemoryTransferRateOffset[1]=200'
nvidia-settings -a '[gpu:0]/GPUGraphicsClockOffset[1]=400'
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=50"
