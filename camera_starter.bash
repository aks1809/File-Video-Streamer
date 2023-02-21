#!/usr/bin/env bash
pm2 start "python3 transmitor.py t_5 rtsp://admin:Frinks%402020@192.168.1.20:554/Streaming/channels/101?transportmode=unicast 5555 1080 1920 0" --name "t_5" #663BC1
pm2 start "python3 transmitor.py t_6 rtsp://admin:Frinks%402020@192.168.1.19:554/Streaming/channels/101?transportmode=unicast 5555 1080 1920 0" --name "t_6" #663BC2
pm2 start "python3 transmitor.py t_7 rtsp://admin:Frinks%402020@192.168.1.21:554/Streaming/channels/101?transportmode=unicast 5555 1080 1920 0" --name "t_7" #664BC2
pm2 start "python3 transmitor.py t_8 rtsp://admin:Frinks%402020@192.168.1.22:554/Streaming/channels/101?transportmode=unicast 5555 1080 1920 0" --name "t_8" #664BC3
pm2 start "python3 transmitor.py w_13 rtsp://admin:enhance%4012345@192.168.1.32:554/Streaming/channels/101?transportmode=unicast 5556 1080 1920 0" --name "w_13" #689LM1
pm2 start "python3 transmitor.py w_14 rtsp://admin:enhance%4012345@192.168.1.31:554/Streaming/channels/101?transportmode=unicast 5556 1080 1920 0" --name "w_14" #689LM2
pm2 start "python3 transmitor.py w_15 rtsp://admin:enhance%4012345@192.168.1.29:554/Streaming/channels/101?transportmode=unicast 5556 1080 1920 0" --name "w_15" #691LM1
pm2 start "python3 transmitor.py w_16 rtsp://admin:enhance%4012345@192.168.1.24:554/Streaming/channels/101?transportmode=unicast 5556 1080 1920 0" --name "w_16" #692LM1
pm2 start "python3 transmitor.py w_17 rtsp://admin:enhance%4012345@192.168.1.26:554/Streaming/channels/101?transportmode=unicast 5556 1080 1920 0" --name "w_17" #693LM1
pm2 start "python3 transmitor.py w_18 rtsp://admin:enhance%4012345@192.168.1.25:554/Streaming/channels/101?transportmode=unicast 5556 1080 1920 0" --name "w_18" #694LM1
pm2 start "python3 transmitor.py w_19 rtsp://admin:enhance%4012345@192.168.1.40:554/Streaming/channels/101?transportmode=unicast 5556 1080 1920 0" --name "w_19" #695LM1
pm2 start "python3 transmitor.py w_20 rtsp://admin:enhance%4012345@192.168.1.39:554/Streaming/channels/101?transportmode=unicast 5556 1080 1920 0" --name "w_20" #696LM1
pm2 start "python3 transmitor.py w_21 rtsp://admin:enhance%4012345@192.168.1.27:554/Streaming/channels/101?transportmode=unicast 5556 1080 1920 0" --name "w_21" #697LM1
pm2 start "python3 transmitor.py w_22 rtsp://admin:enhance%4012345@192.168.1.28:554/Streaming/channels/101?transportmode=unicast 5556 1080 1920 0" --name "w_22" #698LM1
pm2 start "python3 transmitor.py w_23 rtsp://admin:enhance%4012345@192.168.1.38:554/Streaming/channels/101?transportmode=unicast 5556 1080 1920 0" --name "w_23" #699LM1
pm2 stop w_13 w_14 w_15 w_16 w_17 w_18 w_19 w_20 w_21 w_22 w_23