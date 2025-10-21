# Whisky - Signing Configuration Guide

## 証明書エラーの解決方法

現在のエラー:
```
Signing for "Whisky" requires a development team. Select a development team in the Signing & Capabilities editor.
```

### 1. Xcode での設定手順

1. **Xcodeでプロジェクトを開く**
   - `/Volumes/FastSSD02/dev/Whisky/Whisky.xcodeproj` を開く

2. **プロジェクト設定を開く**
   - 左のナビゲーターでプロジェクト名 "Whisky" をクリック
   - メインエリアでプロジェクト設定が表示される

3. **各ターゲットの署名設定**
   以下の3つのターゲットそれぞれで設定が必要:
   - Whisky (メインアプリ)
   - WhiskyCmd (コマンドラインツール)
   - WhiskyThumbnail (サムネイル拡張)

4. **署名設定の変更**
   各ターゲットで:
   - "Signing & Capabilities" タブをクリック
   - "Team" ドロップダウンから自分のApple Developer Teamを選択
   - "Automatically manage signing" がチェックされていることを確認

### 2. Apple Developer Account が必要な場合

Apple Developer Account を持っていない場合:
1. Xcode → Settings → Accounts
2. "+" ボタンをクリックして Apple ID を追加
3. 無料の Personal Team を使用可能

### 3. 開発用の推奨設定

```
Code Signing Identity: Apple Development
Team: [あなたのTeam名]
Provisioning Profile: Automatic
Bundle Identifier: 一意の識別子 (例: com.yourname.whisky)
```

### 4. Bundle Identifier の変更

もしTeam IDに問題がある場合:
1. 各ターゲットの "General" タブ
2. "Bundle Identifier" を変更
3. 例: `com.yourname.Whisky`、`com.yourname.WhiskyCmd`、`com.yourname.WhiskyThumbnail`

### 5. トラブルシューティング

**証明書が見つからない場合:**
1. Keychain Access を開く
2. "Certificates" カテゴリーを確認
3. "Apple Development" 証明書があるか確認

**それでも解決しない場合:**
1. Xcode → Settings → Accounts
2. Apple ID を選択して "Download Manual Profiles" をクリック
3. Xcode を再起動

### 6. ローカル署名のみの場合

配布する予定がなく、ローカルでの開発のみの場合:
1. "Sign to Run Locally" を選択
2. この場合、他のMacでは実行できません

## コード修正について

Liquid Glass エフェクトのエラーも修正済み:
- カスタム `.whiskyLiquidGlass()` メソッドを削除
- 標準的な `.regularMaterial`背景に置き換え
- インタラクティブ効果も実装

これでビルドエラーは解決されるはずです。