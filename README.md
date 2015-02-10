# UnofficialCocos2DTemplate
Cocos2D v3.4 template that does not require SpriteBuilder

## Usage:

```
git clone --recursive https://github.com/slembcke/UnofficialCocos2DTemplate.git
cd UnofficialCocos2DTemplate
./RenameProject.rb
```

The rename script will ask for a project name, then do a find/replace on the project structure and update all of the name references. Check that the project compiles and then commit the renaming to Git (if you plan to use Git).

## Push to a new GitHub repository:

The cloned repository will be linked to mine. That's probably not what you want. To retain the submodule references, you need to change the origin remote to an empty repository of your own.

```
git remote set-url origin MyRepositoryURL
git pull origin
git push
```
