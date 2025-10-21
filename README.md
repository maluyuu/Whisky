<div align="center">

  # Whisky 🥃 
  *ワインより少しだけ強いお酒*
  
  ![](https://img.shields.io/github/actions/workflow/status/IsaacMarovitz/Whisky/SwiftLint.yml?style=for-the-badge)
  [![](https://img.shields.io/discord/1115955071549702235?style=for-the-badge)](https://discord.gg/CsqAfs9CnM)
</div>

## メンテナンス通知

[Whiskyは現在、積極的にメンテナンスされていません](https://docs.getwhisky.app/maintenance-notice)。アプリやゲームはいつでも動作しなくなる可能性があります。

<img width="650" alt="Config" src="https://github.com/Whisky-App/Whisky/assets/42140194/d0a405e8-76ee-48f0-92b5-165d184a576b">

macOSにシームレスに統合される、おなじみのUI

<div align="right">
  <img width="650" alt="New Bottle" src="https://github.com/Whisky-App/Whisky/assets/42140194/ed1a0d69-d8fb-442b-9330-6816ba8981ba">

  ワンクリックでのボトル作成と管理
</div>

<img width="650" alt="debug" src="https://user-images.githubusercontent.com/42140194/229176642-57b80801-d29b-4123-b1c2-f3b31408ffc6.png">

簡単にデバッグとプロファイリング

---

Whiskyは、ネイティブSwiftUIで構築された、Wine用のクリーンで使いやすいグラフィカルラッパーを提供します。ボトルを作成・管理し、Windowsアプリやゲームをインストール・実行し、技術的な知識なしでMacの可能性を最大限に引き出すことができます。WhiskyはCrossOver 22.1.1とApple独自の`Game Porting Toolkit`を基盤としています。

[Crowdin](https://crowdin.com/project/whisky)で翻訳されました。

---

## システム要件
- CPU: Apple Silicon (Mシリーズチップ)
- OS: macOS Sonoma 14.0以降

## macOS 26 Liquid Glass 対応
macOS 26 (Tahoe) で導入された Liquid Glass デザイン言語に合わせ、Whisky のナビゲーションと各ボトル関連ビューは新しいガラスエフェクトへ自動的に切り替わります。システム設定の Liquid Glass スタイル（Clear / Tinted）や透明度の調整にも追従するため、macOS 本体と統一された見た目でご利用いただけます。旧バージョンの macOS では従来どおりのマテリアル表現が維持されます。

## Homebrew

WhiskyはHomebrewで利用可能です！ `brew install --cask whisky`でインストールしてください。

## ゲームが動作しません！

一部のゲームは、動作させるために特別な手順が必要です。[wiki](https://github.com/IsaacMarovitz/Whisky/wiki/Game-Support)をご確認ください。

---

## クレジットと謝辞

Whiskyは、以下のいくつかのプロジェクトの魔法のおかげで実現しました。

- [msync](https://github.com/marzent/wine-msync) (marzentによる)
- [DXVK-macOS](https://github.com/Gcenx/DXVK-macOS) (Gcenxおよびdoitsujinによる)
- [MoltenVK](https://github.com/KhronosGroup/MoltenVK) (KhronosGroupによる)
- [Sparkle](https://github.com/sparkle-project/Sparkle) (sparkle-projectによる)
- [SemanticVersion](https://github.com/SwiftPackageIndex/SemanticVersion) (SwiftPackageIndexによる)
- [swift-argument-parser](https://github.com/apple/swift-argument-parser) (Appleによる)
- [SwiftTextTable](https://github.com/scottrhoyt/SwiftyTextTable) (scottrhoytによる)
- [CrossOver 22.1.1](https://www.codeweavers.com/crossover) (CodeWeaversおよびWineHQによる)
- D3DMetal (Appleによる)

Gcenx、ohaiibuzzle、およびNat Brownのサポートと貢献に感謝します！

---

<table>
  <tr>
    <td>
        <picture>
          <source media="(prefers-color-scheme: dark)" srcset="./images/cw-dark.png">
          <img src="./images/cw-light.png" width="500">
        </picture>
    </td>
    <td>
        WhiskyはCrossOverなしには存在しません。当社の<a href="https://www.codeweavers.com/store?ad=1010">アフィリエイトリンク</a>を使用して、CodeWeaversの活動をサポートしてください。
    </td>
  </tr>
</table>
