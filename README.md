## アプリケーション名
Rubigon QUEST

## アプリケーション概要
次々と現れるエラー画面に対し、正しい選択肢を選んでゴールを目指すロールプレイングゲームです。
Ruby on Railsを用いてアプリケーションを制作した時の実際のエラー画面を使って、対処法の一例を復習できます。

## URL
https://rubigon-quest.herokuapp.com/

## （出題用）管理者ページ遷移アカウント
- Basic認証ID: admin
- Basic認証パスワード: 0000

## 利用方法
### プレイモード
「冒険をはじめる」のリンクをクリックするとゲーム開始です。
各エラーに対して、画面下の選択肢から正しいものを選んでください。
画面右上に進捗メーターがあり、右端のお城のマークまでメーターを進めることができればゲームクリアです。

### 管理者モード
トップ画面右下のパソコンのアイコンをクリックし、Basic認証を通過すると、
管理者ページへ遷移する事ができ、エラー(敵)を追加・編集することが可能です。
エラーを登録する際に入力するstage_noは、プレイモード画面右上に表示されている進捗メーターに関与します。
デフォルトの進捗メーターは、1(ゲームオーバー) ~ 7(ゲームクリア)の間で数値が設定されています。
例えば、ステージ序盤難易度の低いエラーの場合は2~3を設定し、後半の難易度の高いエラーの場合は6を設定します。

各エラーに対して選択肢を登録する際は、戻り値という数値を割り当てます。
その選択肢を選んだ場合、次にどのエラーを出現させるのか設定をするものです。
戻り値に設定した数値のエラーidへ遷移するようになっている為、
エラーを作成した際に割り当てられるidを事前に把握しておく必要があります。

## アプリケーションを作成した背景
アプリケーションを制作している時に発生するエラーを対処しているときの情景が、
「まるでエラーと闘っているようだ」と思えたため、
この闘いの記録をリメイクすることで、楽しく復習に活かせないかと考え、制作しました。

## 洗い出した要件
https://docs.google.com/spreadsheets/d/19myXPQhR1yA4m2N52qPy7j6uVMV8QfFFzlg4BsfRmQg/edit?usp=sharing

## 実装した機能についての画像および説明
[![Image from Gyazo](https://i.gyazo.com/24b6724e71c5978bc04bc13f9c7ca83a.jpg)](https://gyazo.com/24b6724e71c5978bc04bc13f9c7ca83a)
トップページ

[![Image from Gyazo](https://i.gyazo.com/eb4885378684c5c44b816e614cd7dce7.jpg)](https://gyazo.com/eb4885378684c5c44b816e614cd7dce7)
プレイモード画面

## 実装予定の機能
正答率によるランキング機能

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/9d421c227aa52fd6b196d73db082d61f.png)](https://gyazo.com/9d421c227aa52fd6b196d73db082d61f)

## 画面遷移図

## 開発環境
フロントエンド
バックエンド
インフラ
テスト
テキストエディタ

## ローカルでの動作方法


## 工夫したポイント
進捗メーターを加える事で、正解すると前進し、間違えると後退してしまうといったゲーム性を加える事ができたと思っています。
当初は、プレーヤー機能を実装したり、ヒットポイントやアイテムといったゲーム要素を想定していましたが、
うまく実装させることが出来ず停滞してしまった為、シンプルに進捗メーターという形に切り替えることにしました。
それに応じた挙動をするためには、設問の段階から遷移先を把握し、割り当てていく必要がある為、構成を考えるところが少し苦労しました。
