Category generation does not work correctly:
http://ekkescorner.wordpress.com/2010/04/18/who-eats-the-categories-from-update-sites/
http://eclipsesource.com/blogs/2009/05/08/categorize-your-repository/

What seems to work is to remove the contents.jar and artifacts.jar files.

P2 note from newsgroup
Thanks for the quick answer.
In se, the update site seems okay. As far as I understand what is happening, the problem is really with Tycho. Tycho only resolves dependencies from a "modern" p2 repository, not from an "old" Eclipse Update Site (you can recognize the old format via the presence of the site.xml file). With the sources you hinted at, I could generate a p2 repository and that one works fine for me (both in PDE and with Maven/Tycho).
It's really extremely easy to implement with Eclipse PDE: in the workspace where you have your feature projects, do
* File > Export > Plug-in development > Deployable Features > * Choose the features you want to export
* In the destination tab, specify the output directory
* In the options tab, check Generate p2 repository

That's all : PDE generates a repository you can depose as is on your http server. If you're interested in this little enhancement, beware that users still working with Eclipse 3.5 or less cannot use a p2 repository.
Thanks anyhow for the bundling of all those dependencies, it's a real time saver!
