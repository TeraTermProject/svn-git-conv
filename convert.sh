if [ -d "ttssh2" ]; then
	echo fetch
	cd ttssh2/
	git svn fetch --authors-file=../authors.txt
else
	echo git svn clone
	git svn clone https://svn.osdn.net/svnroot/ttssh2/ --stdlayout --authors-file=authors.txt --prefix=svn/ -r 3226:HEAD --log-window-size=10000
	cd ttssh2/
fi
git switch master
git pull origin master
git branch | grep -v '*' | xargs git branch -D
git for-each-ref --format='%(refname:lstrip=4)' refs/remotes/svn/tags | xargs -I{} git tag {} svn/tags/{}
git for-each-ref --format='%(refname:lstrip=3)' refs/remotes/svn | grep -v tags | xargs -I{} git branch {} svn/{}
if [ -v GIT_REPOSITORY ] && [ -v GIT_USER_NAME ] && [ -v GIT_USER_EMAIL ]; then
	echo git conf
	git remote rm github
	git remote add github ${GIT_REPOSITORY}
	git config --local user.name ${GIT_USER_NAME}
	git config --local user.email ${GIT_EMAIL_NAME}
	#
	echo git push
	git push github --all
	git push github --tags
fi
cd ..
tar jcfh ttssh2_git.tar.bz2 ttssh2
