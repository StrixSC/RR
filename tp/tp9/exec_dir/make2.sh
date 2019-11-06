#!/bin/bash


#Simplement ecrire ./make.sh dans le exec_dir  et le programme executera toute les commandes necessaire pour compiler la librairie et les executables.

echo "
 ____   ____    ___    ____  ___ ___    ___  ___ ___ 
|    \ |    \  /   \  /    ||   |   |  /  _]|   |   |
|  o  )|  D  )|     ||   __|| _   _ | /  [_ | _   _ |
|   _/ |    / |  O  ||  |  ||  \_/  ||    _]|  \_/  |
|  |   |    \ |     ||  |_ ||   |   ||   [_ |   |   |
|  |   |  .  \|     ||     ||   |   ||     ||   |   |
|__|   |__|\_| \___/ |___,_||___|___||_____||___|___|
                                                     
"
./progmem -v -o bytecode.bin write2/progmemTest.txt
make clean -C write2
make -C write2
make install -C write2

echo " 
  _____ ______   ____  ____   ______  ____  ____    ____      ____     ___   ____  ___   
 / ___/|      | /    ||    \ |      ||    ||    \  /    |    |    \   /  _] /    ||   \  
(   \_ |      ||  o  ||  D  )|      | |  | |  _  ||   __|    |  D  ) /  [_ |  o  ||    \ 
 \__  ||_|  |_||     ||    / |_|  |_| |  | |  |  ||  |  |    |    / |    _]|     ||  D  |
 /  \ |  |  |  |  _  ||    \   |  |   |  | |  |  ||  |_ |    |    \ |   [_ |  _  ||     |
 \    |  |  |  |  |  ||  .  \  |  |   |  | |  |  ||     |    |  .  \|     ||  |  ||     |
  \___|  |__|  |__|__||__|\_|  |__|  |____||__|__||___,_|    |__|\_||_____||__|__||_____|
                                                                                         
"
./serieViaUSB -e -f bytecode.bin
make clean
make
make install
od -v -t x1 bytecode.bin