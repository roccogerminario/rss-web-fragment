# Maintainable Plugins Challenge: web fragment solution

This repository is my response to Olaf Kock's challenge to find a more mantainable solution to his customization for the RSS-Publisher (see <https://liferay.dev/blogs/-/blogs/maintainable-plugins-challenge>).

The [original customization](https://github.com/olafk/rss-web-ext) was done through an ext-module.

I've reached the same goal with a "web fragment", with less code duplication and the advantage of being hot-deployable.

However this is arguably "more mantainable" because it's not an "elegant" solution:

* while I dulicated less code, my code is harder to understand and so harder to mantain;
* I leveraged an internal logic of method `getSyndContents` in `RSSFeedEntry` class and that's why I'm forcing `syndEntry.setDescription(null)`;
* I also had to deal with a side effect: because the original implementation uses
a "WebCache" I had to clone the original "SyndFeed" object and use reflection
(otherwise the full content of the rss would always be displayed regardless of 
the configuration).

This customization was harder than expected because there were no
useful OSGi extension points and also the internal use of the WebCache forced me
to use some "reflection" tricks.
In other words the original RSS-Publisher does not follow some Liferay's best
practices and patterns and that's why it is less customizable and extendible
than other modules.

I don't know if there is a simpler solution. IMHO this is an example where
"less code" does not mean "better code" and the "ext" solution is preferrable.
