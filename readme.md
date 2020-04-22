# Rubyでチンチロをつくる
## 1.目的
- Rubyの文法を理解しロジックを組めるようになるため
- つくったら楽しそう
- ポートフォリオとして

## 2.チンチロとは？
> &emsp;チンチロリンは、日本の大衆的な博戯（賭博・ゲーム）の一種である。数人程度（理論上は2人以上何人でも）が通常は車座になって、サイコロ3個と丼（ないし茶碗）を用いて行う。  
https://ja.wikipedia.org/wiki/%E3%83%81%E3%83%B3%E3%83%81%E3%83%AD%E3%83%AA%E3%83%B3


## 3.ルール
- 人数は2人以上　親一人と子複数
- サイコロを3つ振り、出た目によって役が決まる
- 役の一番強い人が勝ち
- 役はカイジルールを適用
　http://ketto.com/zw/tintiro_rule.shtml

## 4.役
|  出目     |  配当  |
| ----      | ----              |
|  1/1/1 <br>(ピンゾロ)   |  5倍づけ  |
|  2~6のゾロ目   |  3倍づけ  |
|  4/5/6 <br>(シゴロ)   |  2倍づけ  |
|  〇/〇/1, <br>〇/〇/2, <br> 〇/〇/3,  <br>〇/〇/4, <br> 〇/〇/5, <br> 〇/〇/6 |  1倍づけ <br>（勝てば張った分だけ取り） |
|  その他 <br>(目ナシ)   |  1倍払い  <br>（負ければ張った分だけ取られる） |
|  1/2/3 <br>(ヒフミ）   |  2倍払い   |

※　〇/〇/1　などの〇は任意のゾロ目を表す。
3個のサイコロのうち2個がゾロ目であればのこりの1個で役の強さが変わる。強さは　`1 < 2 < 3 < 4 < 5 < 6` の順
※　親の総取りはなし

## 5.ゲームの流れ
1. 親決め
2. 掛け金決定
3. サイコロを振り役を決める（親が最初、子も振る）
4. 役に応じて掛け金の移動
5. 掛け金が0になったら負け　もしくは親を二巡して掛け金が多い人が勝ち 

## 5.実際に必要な処理

### 5-1.サイコロを振る/役の決定
　ある関数として処理
　引数：なし
　戻り値：出目/役

　テストコードを書く
### 5-2.掛け金の移動
### 5-3.勝利/敗北判定
### 5-4.親の決定
### 5-5.親の移動
### 5-6.メイン画面・メッセージ出力

## 6.命名規則
### 6-1.クラス名、モジュール名
キャメルケース(CamelCase)：各単語の頭文字を大文字にする、_は使用しない。
```ruby
# NG
Foo_Class
barmodule
bazClass
ApiServer

# OK
FooClass
BarModule
BazClass
APIServer
```

### 6-2.ファイル名、ディレクトリ名
スネークケース(snake_cace)：すべてを小文字にし、単語の区切りを_で繋ぐ

### 6-3.メソッド名、変数名
スネークケース(snake_cace)：すべてを小文字にし、単語の区切りを_で繋ぐ

### 6-4.定数名
スクリーミングスネークケース(SCREAMING_SNAKE_CASE)：すべてを大文字にし、単語の区切りを_で繋ぐ