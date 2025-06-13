<!DOCTYPE html>
<html lang="{function.localeToHTML, userLang, defaultLang}" {{{if languageDirection}}}data-dir="{languageDirection}" style="direction: {languageDirection};"{{{end}}}>
<head>
 <title>{browserTitle}</title>
 {{{each metaTags}}}{function.buildMetaTag}{{{end}}}
 <link rel="stylesheet" type="text/css" href="{relative_path}/assets/client{{{if bootswatchSkin}}}-{bootswatchSkin}{{{end}}}{{{ if (languageDirection=="rtl") }}}-rtl{{{ end }}}.css?{config.cache-buster}" />
 {{{each linkTags}}}{function.buildLinkTag}{{{end}}}

 <script>
  var config = JSON.parse('{{configJSON}}');
  var app = {
   user: JSON.parse('{{userJSON}}')
  };
  document.documentElement.style.setProperty('--panel-offset', `0px`);
 </script>

 {{{if useCustomHTML}}}
 {{customHTML}}
 {{{end}}}
 {{{if useCustomCSS}}}
 <style>{{customCSS}}</style>
 {{{end}}}
</head>

<body class="{bodyClass} skin-{{{if bootswatchSkin}}}{bootswatchSkin}{{{else}}}noskin{{{end}}}">
 <a class="visually-hidden-focusable position-absolute top-0 start-0 p-3 m-3 bg-body" style="z-index: 1021;" href="#content">[[global:skip-to-content]]</a>

 <div class="navbar bg-card text-card-foreground shadow-sm w-full border-b">
  <div class="container flex h-16 items-center">
   <a href="/" class="font-bold text-2xl">NodeBB</a>
   <div class="flex-grow"></div>
   <nav class="flex items-center space-x-4">
    <a href="/recent">Recent</a>
    <a href="/categories">Categories</a>
    <a href="/tags">Tags</a>
    <a href="/login">Login</a>
    <a href="/register">Register</a>
   </nav>
  </div>
 </div>

 <main id="panel" class="d-flex flex-column gap-3 flex-grow-1 mt-3" style="min-width: 0;">
  <div class="container-lg px-md-4 d-flex flex-column gap-3 h-100 mb-5 mb-lg-0" id="content">
   <!-- IMPORT partials/noscript/warning.tpl -->
   <!-- IMPORT partials/noscript/message.tpl -->
			<!-- IMPORT partials/noscript/warning.tpl -->
			<!-- IMPORT partials/noscript/message.tpl -->
  </div>
 </main>
</body>
</html>
