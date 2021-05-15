#!/bin/bash
ip route | awk 'FNR==2' | awk '{for(i=1;i<=NF;i++)if($i=="src")print $(i+1) }'
