# myKarabiner-Elements-Setting
karabiner complex-modifications 追加作業軽減策

# motivations
- karabinerの設計ではkarabiner.jsonを書き換えることを本質としていない
- 設定をパーツに分け、KBDと設定パーツ組み合わせで設定を構成、設定ファイルがどう組み込まれるかはkarabinerの自動生成に任せたい

## post install
[install karabiner](https://pqrs.org/osx/karabiner/)

## Usage
e.g.,
```
$ ./import_mod.sh ./custom_assets.[json, yml, yaml]
// 実行後karabiner import画面起動
```

- custom_assets.jsonは個人設定に置き換える
- 記述はYamlもしくはJson 両方有効
  - 要npm環境
  - Yamlで記述した場合は、ファイル名.jsonが上書きされるので注意
- jsonのvalidationはkarabinerに、Yamlはyaml2jsonにそれぞれ任せる


# Memo
## least tested env
### SW
- macOS 10.13 / 10.12
- Karabiner-Elements 11.5.6

### HW
- MacBookPro14,2 / MacBookAir5,1
- Vorke Model: [K2](http://www.vorke.com/accessories/vorke-k2/)
- HHKB Pro2 ja
