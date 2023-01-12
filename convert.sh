if [ -d "ttssh2" ]; then
	echo fetch
	cd ttssh2/
	git svn fetch --authors-file=authors.txt
else
	echo git svn clone
	git svn clone https://svn.osdn.net/svnroot/ttssh2/ --stdlayout --authors-file=authors.txt --prefix=svn/ -r 3226:HEAD --log-window-size=10000
	cd ttssh2/
fi
git for-each-ref --format='%(refname:lstrip=4)' refs/remotes/svn/tags | xargs -I{} git tag {} svn/tags/{}
git for-each-ref --format='%(refname:lstrip=3)' refs/remotes/svn | grep -v tags | xargs -I{} git branch {} svn/{}
git remote add github git@github.com:TeraTermProject/teraterm-mirror-gitsvn.git
#git push github --all
#git push github --tags
cd ..
tar jcfh ttssh2_git.tar.bz2 ttssh2
