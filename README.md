# Deno で CLI 向けのツールを作ってみた

## まとめ

- `deno compile` で配布用のバイナリを作成できる
- commonjs で書かれたライブラリでも `esbuild` とかで bundle すれば大丈夫そう
- 標準入力と標準出力には `Deno.stdin`, `Deno.stdout` を使う必要がある
- Deno に関する定義は `deno types` で参照できる
