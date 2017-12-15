{**
 * Страница вывода правил
 *}

{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    Архив IFWiki
{/block}

{block 'layout_content'}
<p>Файлы названы в формате <code>[день].[месяц].[год]</code>, дампы делаются раз в две недели. Архиватор <a href="http://7-zip.org/">7-zip.</a></p>
<p>Для создания дампов используется последняя версия скрипта <a href="https://github.com/WikiTeam/wikiteam">wikiteam.</a> XML-дампы готовы для импорта в любую свежую копию MediaWiki.</p>
<p>Напоминаем, что содержимое IFWiki доступно по лицензии Attribution-Noncommercial 3.0 Unported (если не указано иное). </p>
<p><ul>
{foreach $files as $file}
    <li><a href="/wikidump/{$file}">{$file}</li>
{/foreach}
</ul></p>
{/block}
