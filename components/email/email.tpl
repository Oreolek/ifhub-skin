{**
 * Базовый шаблона e-mail'а
 *}

{$backgroundColor = 'F4F4F4'}       {* Цвет фона *}

{$containerBorderColor = 'D0D6E8'}    {* Цвет границ основного контейнера *}

{$headerBackgroundColor = '222222'}   {* Цвет фона шапки *}
{$headerTitleColor = 'FFFFFF'}      {* Цвет заголовка в шапке *}
{$headerDescriptionColor = 'dddddd'}  {* Цвет описания в шапке *}

{$contentBackgroundColor = 'FFFFFF'}  {* Цвет фона содержимого письма *}
{$contentTitleColor = '000000'}     {* Цвет заголовка *}
{$contentTextColor = '4f4f4f'}      {* Цвет текста *}

{$footerBackgroundColor = 'fafafa'}   {* Цвет фона футера *}
{$footerTextColor = '949fa3'}       {* Цвет текста в футере *}
{$footerLinkColor = '949fa3'}       {* Цвет ссылки в футере *}

{* Путь до папки с изображенями *}
{$imagesDir = "{$LS->Component_GetWebPath('email')}/images"}

{component_define_params params=[ 'title', 'content' ]}

{* Фон *}
<style>
@font-face {
  font-family: 'Racing Sans One';
  font-style: normal;
  font-weight: 400;
  src: local('Racing Sans One'), local('RacingSansOne-Regular'), url(https://fonts.gstatic.com/s/racingsansone/v5/sykr-yRtm7EvTrXNxkv5jfKKyDCAKHDi.ttf) format('truetype'), url(https://fonts.gstatic.com/s/racingsansone/v5/sykr-yRtm7EvTrXNxkv5jfKKyDCAKHDn.woff2) format('woff2');
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
}
</style>
<table width="100%" align="center" bgcolor="#{$backgroundColor}" cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
  <tr><td>
    <br />
    <br />

    {* Основной контейнер *}
    <table width="573" align="center" cellpadding="0" cellspacing="0" style="border-collapse: collapse; font-style: normal; font-weight: normal; font-size: 13px/1.4em; font-family: Verdana, Arial; color: #4f4f4f; border: 1px solid #{$containerBorderColor};">
      {* Шапка *}
      <tr>
        <td>
          <table width="100%" bgcolor="#{$headerBackgroundColor}" cellpadding="50" cellspacing="0" style="border-collapse: collapse;">
            <tr>
              <td style="font-size: 11px; line-height: 1em;">
                <p><span style="font-weight: normal; font-style: normal; font-size: 29px; font-family: 'Racing Sans One', Arial, sans-serif; line-height: 1em; color: #{$headerTitleColor}"><strong><span style="background-color: #cd1713">&nbsp;IF&nbsp;</span>Hub<span style="color: #b3b3b3">.club</span></strong></span></p>
                <p><span style="color: #{$headerDescriptionColor}">{Config::Get('view.description')}</span></p>
              </td>
            </tr>
          </table>
        </td>
      </tr>

      {* Контент *}
      <tr>
        <td>
          <table width="100%" cellpadding="50" cellspacing="0" bgcolor="#{$contentBackgroundColor}" style="border-collapse: collapse;">
            <tr>
              <td valign="top">
                <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse; font: normal 13px/1.4em Verdana, Arial; color: #{$contentTextColor};">
                  {* Заголовок *}
                  {if $sTitle}
                    <tr>
                      <td valign="top">
                        <span style="font: normal 19px Arial; line-height: 1.3em; color: #{$contentTitleColor}">{$title}</span>
                      </td>
                    </tr>
                    <tr><td height="10">&nbsp;</td></tr>
                  {/if}

                  {* Текст *}
                  <tr>
                    <td valign="top">
                      {block 'content'}{/block}
                      {$content}
                      <br>
                      <br>
                      {$aLangemails.common.regards} <a href="{Router::GetPath('/')}">{Config::Get('view.name')}</a>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>

          {* Подвал *}
          <table width="100%" bgcolor="#{$footerBackgroundColor}" cellpadding="20" cellspacing="0" style="border-collapse: collapse; font: normal 11px Verdana, Arial; line-height: 1.3em; color: #{$footerTextColor};">
            <tr>
              <td valign="center">
                <div style="width:27px;height:10px;vertical-align: middle">&nbsp;</div>
                <a href="{Router::GetPath('/')}" style="color: #{$footerLinkColor} !important;">{Config::Get('view.name')}</a>
                {if isset($oUserTo) }
                <br>
                <div style="width:27px;height:10px;vertical-align: middle">&nbsp;</div>
                Чтобы отписаться от уведомлений, снимите галочки <a href="{Router::getPath('/')}settings/tuning">в вашем профиле.</a>
                {/if}
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

    <br />
    <br />
  </td></tr>
</table>
