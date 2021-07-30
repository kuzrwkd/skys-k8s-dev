# SKYS K8S

## 開発環境立ち上げ手順（Mac）

① docker desktop for Macをインストール

② docker desktopのkubernetesを有効にする

③ `brew install helm`を実行し、`helm`コマンドを使えるようにする

④ このローカルリポジトリのルートに`envfile`を作成する  
`envfile`の内容
```
# project root
SKYS_SCRAPER_ROOT_PATH=/Users/＜Macのユーザー名＞/＜skys-scraperのローカルリポジトリまでのパス＞
SKYS_API_ROOT_PATH=/Users/＜Macのユーザー名＞/＜skys-apiのローカルリポジトリまでのパス＞
SKYS_CLIENT_ROOT_PATH=/Users/＜Macのユーザー名＞/＜skys-clientのローカルリポジトリまでのパス＞
```

⑤ `make`コマンドでdocker imageをビルドする  
例）`make build-all`

⑥ `make`コマンドで各環境を立ち上げる  
例）`make install-all`

⑦ `make`コマンドで各環境をdownさせる  
例）`make uninstall-all`

⑧ `make`コマンドでdocker imageを削除する  
例）`make clean-all`