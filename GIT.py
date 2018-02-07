CONFIGURACION DE ARCHIVO .git/config
para hacer pull
/**********************************/
$ cat .git/config
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
        symlinks = false
        ignorecase = true
[remote "origin"]
        url = https://bradt123@github.com/bradt123/brey.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
        remote = orgin
        merge=refs/heads/master

/**********************************/

git  add -A  /*agrega para subir al repositorio 

git status  /*para ver los cambios

git commit -m "nombre del commit" /*para hacer commit 

git log /*para ver los commits 

git push origin master /*para subir al repositorio

git fetch  /*para ver si hay cambios en el repositorio

git pull origin master /*para bajar cambios


/**************************/
git branch "nombre ramanueva"  /*para crear la ramanueva

git checkout "nombre ramanueva" /*para ir a la ramanueva

git merge "nombre rama" /* para unir los cambios de la rama
					   /* para hacer tienes que estar en la rama master o con la que quieres hacer union


	si te sale este error por ramas 
	! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'git@github.com:asantoya/projectnewbies.git'
To prevent you from losing history, non-fast-forward updates were rejected
Merge the remote changes (e.g. 'git pull') before pushing again.  See the
'Note about fast-forwards' section of 'git push --help' for details.
 

 cambiarce primero a la rama master
 con git checkout master y 
 luego hacer un git pull  
