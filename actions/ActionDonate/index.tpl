{**
 * Страница вывода правил
 *}

{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    Фонд поддержки IFHub.club
{/block}

{block 'layout_content'}
<p>IFHub живёт уже четвёртый год, и ему во многом помогают читатели. В том числе, в оплате хостинга и домена.</p>

<p>Здесь идёт сбор денег <strong>на 2019 год.</strong> Цель сборов - 7150р. до января 2020г.</p>

<p>На сегодня собрано 0 рублей ≈ 0% <progress max="100" value="0"></progress></p>
 
<h3>Реквизиты для перечисления</h3>

<div class="incut">
<p><b>PayPal:</b> <a href="https://www.paypal.me/oreolek">перейти на форму</a></p>

<p><iframe frameborder="0" scrolling="no" src="https://money.yandex.ru/quickpay/shop-widget?account=410011560528046&quickpay=shop&payment-type-choice=on&mobile-payment-type-choice=on&writer=seller&targets=%D0%BD%D0%B0+ifhub.club&targets-hint=&default-sum=200&button-text=03&successURL=" width="450" height="210"></iframe></p>
</div>

<p> Отдельные пожертвования публично не освещаются<sup>1</sup>. Переводы через Яндекс.Деньги анонимны; через PayPal отправителя видит только админ (как получатель). Если нужно подтверждение получения — пишите <a href="/profile/Oreolek">админу.</a></p>

<p><small><sup>1</sup>: Интересующиеся могут посмотреть <a target="_blank" href="https://github.com/Oreolek/ifhub-skin/commits/master/actions/ActionDonate/index.tpl">исходники этой страницы на Github,</a> которые обновляются вручную.</small></p>

<h4>А как вообще будет развиваться Ифхаб?</h4>

<p>Судьба LiveStreet под большим вопросом, поэтому потихоньку переписываем движок.
Накопилась уже небольшая гора <a href="https://destrier.tk/view_all_bug_page.php?project_id=1">задач и хотелок,</a>
которые не позволяет решить архитектура LS.
Свои идеи можно предлагать в основном трекере или <a href="https://github.com/oreolek/ifhub-skin/issues">на Github.</a></p>

<p>Спонтанные мелкие улучшения объявляются через соцсети и в рубрике еженедельных новостей.</p>
{/block}
