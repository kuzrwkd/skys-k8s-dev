#!/bin/bash

# シェルの動作設定
#   -e: コマンドがエラーになった時点でエラー終了
#   -u: 未定義変数を参照した場合にエラー終了
#   -x: 実行されるコマンドの引数を展開した上で表示

set -eux

cd /var/www

npm cache clean -f \
&& npm install

if [ "$NODE_ENV" == 'development' ]; then
  # ローカル環境用
  npm run dev
else
  # 本番環境用
  pm2 start ecosystem.config.js
  while true; do sleep 86400; done
fi