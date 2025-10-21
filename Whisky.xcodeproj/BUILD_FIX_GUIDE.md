# Whisky - コンパイルエラー解決ガイド

## ✅ 修正完了済みのファイル

以下のファイルのコードエラーを修正しました：

### 1. PinAddView.swift
- ❌ 削除: `.whiskyLiquidGlass(.card, interactive: true)`
- ✅ 追加: 標準的な `.regularMaterial` 背景とインタラクティブ効果

### 2. PinView.swift  
- ❌ 削除: `.whiskyLiquidGlass(.card, interactive: true)`
- ✅ 追加: 標準的な `.regularMaterial` 背景

### 3. BottomBar.swift
- ❌ 削除: `.whiskyLiquidGlass(.bar, interactive: true)`
- ✅ 追加: `.background(.regularMaterial, in: Rectangle())`

## 🛠️ 証明書エラーの解決方法

### 即座に解決する手順:

1. **Xcodeでプロジェクトを開く**
   ```
   /Volumes/FastSSD02/dev/Whisky/Whisky.xcodeproj
   ```

2. **プロジェクト設定を開く**
   - 左のナビゲーターで「Whisky」プロジェクト名をクリック

3. **各ターゲットで署名設定**
   以下の**3つのターゲット全て**で設定が必要:
   - ✅ **Whisky** (メインアプリ)
   - ✅ **WhiskyCmd** (コマンドラインツール) 
   - ✅ **WhiskyThumbnail** (サムネイル拡張)

4. **署名設定の手順**
   各ターゲットで:
   - 「**Signing & Capabilities**」タブをクリック
   - 「**Team**」ドロップダウンから自分のApple Developer Teamを選択
   - 「**Automatically manage signing**」がチェックされていることを確認

### Apple Developer Account設定

**無料アカウントの場合:**
1. Xcode → Preferences → Accounts
2. 「+」ボタンで Apple ID を追加
3. Personal Team を使用

**有料アカウントの場合:**
- Developer Program のTeamを選択

### 推奨設定

```
Code Signing Identity: Apple Development
Team: [あなたのTeam名]
Provisioning Profile: Automatic
Bundle Identifier: 一意の識別子
```

### Bundle Identifier の変更（必要な場合）

既存のIDと重複する場合:
```
com.yourname.Whisky          (元: com.whisky-app.Whisky)
com.yourname.WhiskyCmd       (元: com.whisky-app.WhiskyCmd)
com.yourname.WhiskyThumbnail (元: com.whisky-app.WhiskyThumbnail)
```

## 🎨 修正後の視覚効果

### 使用している標準API:
- **材料システム**: `.regularMaterial` (半透明ガラス効果)
- **形状**: `RoundedRectangle(cornerRadius: 12)` 
- **影**: `.shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)`
- **インタラクション**: ホバー＆プレスアニメーション

### 利点:
- ✅ すべてのmacOSバージョンで動作
- ✅ Appleの標準デザインガイドラインに準拠
- ✅ カスタムAPIへの依存なし
- ✅ パフォーマンスが向上

## 🚀 次のステップ

1. **Xcodeで署名設定を完了**
2. **プロジェクトをクリーンビルド**: Product → Clean Build Folder
3. **ビルド実行**: ⌘+B

これですべてのコンパイルエラーが解決されるはずです！