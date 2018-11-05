# 正規表現文字列変換プログラムのテスト

## テストのしかた

GitHubのユーザ名が`USERNAME`の場合:

  1. このリポジトリを`compiler-el-USERNAME`と同じディレクトリに clone する．
  2. `compiler-el-USERNAME/` ディレクトリで make して `printast`，`interp`，`comp` を作る．
  3. `compiler-el-USERNAME/` ディレクトリで `test.sh` を実行する．
  
  (プログラムを個別にテストしたい場合は，それぞれ `test_printast.sh`，`test_interp.sh`，`test_comp.sh` を実行する．)

## テストの追加のしかた

`testcases` 以下にテストケースファイルを作ってください．
テストケースファイルは拡張子を `.in` にしてください．
ただし，`printast` 用のテストケースはファイル名の末尾を `_printast` に，
`interp` と `comp` 用のテストケースはファイル名の末尾を `_interp` にしてください．

## テストケースファイルの書式

奇数行目にテストの入力を，続く偶数行目にテストの正解をそれぞれ1行で書いてください．
ただし，`printast` で改行文字が挿入される箇所は空白に置き換えてください．

例(`printast` のテストケース)
```
int x = 3; int y = 5; x + 2 * y
(VarDef x 3 (VarDef y 5 (+ (VarRef x) (* (Num 2) (VarRef y)))))
```

例(`interp` と `comp` のテストケース)
```
int x = 3; int y = 5; x + 2 * y
13
```

## テストケースファイルの名前

名前が衝突すると面倒なので，githubのユーザ名`.in`を付けたファイル名にしてください．
ユーザ名が`abc`であれば`abc_printast.in`や`abc_interp.in`というファイルを作ってください．

### githubユーザ名の確認のしかた

`ml-practice-abc`というリポジトリが作られていれば`abc`がユーザ名です．
