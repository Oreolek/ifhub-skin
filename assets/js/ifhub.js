/**
 * Инициализации модулей
 *
 * @license   GNU General Public License, version 2
 * @author    Alexander Yakovlev <keloero@oreolek.ru>
 */

jQuery(document).ready(function($){
    $(".search-icon").on('click touchstart', function(){
        $(".main-search").toggle()
    });
    $('.spoiler-title').on('click touchstart', function(){
        $(this).toggleClass('open');
        $(this).parent().children('div.spoiler-body').toggle('normal');
        return false;
    });
});
