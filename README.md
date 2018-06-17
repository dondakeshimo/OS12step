# 12ステップで作る組み込みOS自作入門

## 環境構築

### 依存ライブラリ

-   docker

### 各種ビルド等

-   docker build `Dockerfile`
-   kz_h8writeのビルド `build/PackageFiles`
-   WORKDIRのパスの設定 `tools/makeos.sh`
-   USBDEVのパスの設定 `tools/makeos.sh`

## 使い方

1.   `src/01/bootload` などに書籍のコードを記入
2.   `./tools/makeos.sh make 01/bootload` を実行
3.   `./tools/makeos.sh image 01/bootload` を実行
4.   `./tools/makeos.sh write 01/bootload` を実行
