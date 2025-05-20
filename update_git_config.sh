cd;
cat <<'catEND' >> .gitconfig
[alias]
	ac = !git add --all && git commit -m
	ch = !git checkout
	chb = !git checkout -b
	ba = !git branch -a
	bd = !git branch -d
	ss = !git status -s
	logs = !git log --pretty=format:'%C(cyan)%h %C(white)%s %C(red)%cn -  %C(red)%ch %C(reset)'
	logf = !git log --pretty=format:'%C(cyan)%H %h%d%n  %C(white)%s%n  %C(red)%cn (%ce) - %C(red)%ch (%cr)%C(reset)%n'
catEND
