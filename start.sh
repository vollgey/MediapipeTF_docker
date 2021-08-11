sudo xhost +si:localuser:root
sudo docker run --runtime nvidia --network host -it \
    -w /root \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    -v /tmp/argus_socket:/tmp/argus_socket \
    --device /dev/video0  \
    takumitomokawa/mediapipe-tf:latest