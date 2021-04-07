build: \
	dist/windows/html2md dist/windows/md2ast \
	dist/darwin_silicon/html2md dist/darwin_silicon/md2ast \
	dist/darwin/html2md dist/darwin/md2ast \
	dist/linux/html2md dist/linux/md2ast

dist/linux/%: dist/%.js
	mkdir -p $(dir $@)
	deno compile --lite --target x86_64-unknown-linux-gnu --unstable --output $@ $^

dist/darwin/%: dist/%.js
	mkdir -p $(dir $@)
	deno compile --lite --target x86_64-apple-darwin --unstable --output $@ $^

dist/darwin_silicon/%: dist/%.js
	mkdir -p $(dir $@)
	deno compile --lite --target aarch64-apple-darwin --unstable --output $@ $^

dist/windows/%: dist/%.js
	mkdir -p $(dir $@)
	deno compile --lite --target x86_64-pc-windows-msvc --unstable --output $@ $^

dist/%.js: cmd/%/main.ts
	npx esbuild --bundle --outfile=$@ $^
