cd;
cat <<'catEND' >> .gitconfig
[alias]
	ac = !git add --all && git commit -m
	ch = !git checkout
	bls = !git branch -a
	bnew = !git checkout -b
	bdel = !git branch -d
	logf = !git log --pretty=format:'%C(cyan)%H %h%d%n  %C(white)%s%n  %C(red)%cn (%ce) - %C(red)%ch (%cr)%C(reset)%n'
	logs = !git log --pretty=format:'%C(cyan)%h %C(white)%s %C(red)%cn -  %C(red)%ch %C(reset)'
	st = !git status -s
catEND
