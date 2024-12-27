#!/bin/bash 

# Fungsi untuk menginstal Python 3.9 dan dependensi lainnya
install_python() {
    log "Memasang Python 3.9..."
    sudo apt update
    sudo apt install -y software-properties-common git  # Menambahkan instalasi git
    sudo add-apt-repository ppa:deadsnakes/ppa -y
    sudo apt install -y python3.9 python3.9-venv python3.9-dev python3-pip libopencv-dev python3-opencv
    python3.9 -m pip install --upgrade pip
    log "Python 3.9 dan pip berhasil dipasang."

    # Mengkloning repositori Dawn-BOT dan menginstal dependensi
    log "Mengkloning repositori Dawn-BOT..."
    git clone https://github.com/vonssy/Dawn-BOT.git && cd Dawn-BOT
    log "Menginstal dependensi dari requirements.txt..."
    python3.9 -m pip install -r requirements.txt
    log "Dependensi berhasil diinstal."
}

# Fungsi untuk memeriksa apakah Python 3.9 sudah terpasang
check_python_installed() {
    if command -v python3.9 &>/dev/null; then
        log "Python 3.9 sudah terpasang."
    else
        log "Python 3.9 belum terpasang. Memasang sekarang..."
        install_python
    fi
}
