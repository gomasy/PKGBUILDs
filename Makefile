build:
	cpp -P -I nginx-mainline-boringssl -o nginx-mainline-boringssl/Dockerfile Dockerfile.in; \
	cpp -P -I vim-mainline -o vim-mainline/Dockerfile Dockerfile.in; \
	cpp -P -I neovim-mainline -o neovim-mainline/Dockerfile Dockerfile.in

clean:
	rm -f */Dockerfile
