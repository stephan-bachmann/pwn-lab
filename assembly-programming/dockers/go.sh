#!/bin/bash
cd "$(dirname "$0")"

SERVICE="programming"
IMAGE="asm-containers-programming"
CONTAINER=$(docker compose ps -a -q "$SERVICE" 2>/dev/null)

# 1. 이미지 없으면 빌드
if [ -z "$(docker images -q "$IMAGE" 2>/dev/null)" ]; then
    echo "[*] 이미지가 없습니다. 빌드합니다..."
    docker compose build
fi

# 2. 컨테이너 없으면 생성 + 실행
if [ -z "$CONTAINER" ]; then
    echo "[*] 컨테이너가 없습니다. 생성합니다..."
    docker compose up -d "$SERVICE"
else
    # 3. 컨테이너가 실행 중이 아니면 시작
    STATE=$(docker inspect -f '{{.State.Running}}' "$CONTAINER" 2>/dev/null)
    if [ "$STATE" != "true" ]; then
        echo "[*] 컨테이너가 중지되어 있습니다. 시작합니다..."
        docker compose start "$SERVICE"
    fi
fi

# 4. 접속
echo "[*] 컨테이너에 접속합니다..."
docker compose exec "$SERVICE" bash

# 5. 나오면 중단 (내용은 유지)
echo "[*] 컨테이너를 중단합니다 (데이터 유지)..."
docker compose stop "$SERVICE"
