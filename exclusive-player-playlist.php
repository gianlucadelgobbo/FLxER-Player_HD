<?php
include "includes/bootstrap.php";
?>
<root lng="en" tit="VIDEO" toolbarHead="0x72263D" toolbarBorder="0x72263D" toolbarBackground="0x72263D" btnBkg="0x72263D">
<?php
switch($_GET['type']) {
    case 'featured':
        $hd = false;
        $contents = call('category_getContent', array('type_id' => 1, 'category_id' => 1, 'limit' => 100, 'order' => 'new'));
        break;
    case 'hd_news':
        $hd = true;
        $contents = call('category_getContent', array('type_id' => 1, 'category_id' => 2, 'limit' => 100, 'order' => 'new'));
        break;
    case 'hd_eventi':
        $hd = true;
        $contents = call('category_getContent', array('type_id' => 1, 'category_id' => 3, 'limit' => 100, 'order' => 'new'));
        break;
    case 'hd_highlights':
        $hd = true;
        $contents = call('category_getContent', array('type_id' => 1, 'category_id' => 4, 'limit' => 100, 'order' => 'new'));
        break;
    case 'hd_remember':
        $hd = true;
        $contents = call('category_getContent', array('type_id' => 1, 'category_id' => 5, 'limit' => 100, 'order' => 'new'));
        break;
    case 'new':
    default:
        $hd = false;
        $contents = call('content_get', array('type_id' => 1, 'limit' => 100));
        break;
}
while($row = core_getRow($contents)) {
    if ($row['type_id'] != 1)
        continue;
    ?>
    <item id="<?=$row['id']?>">
            <file><?php
            if ($hd) {
                echo core_getMediaLink($row['id'], 'content', 'hd.mp4');
            } else {
                echo core_getMediaLink($row['id'], 'content', '.mp4');
            }
            ?></file>
            <data>
                    <tit><?=strip_tags($row['title'])?></tit>
                    <date><?=$row['date_added']?></date>
                    <duration>0</duration>
                    <txt><div><?=strip_tags($row['description'])?></div></txt>
                    <author><a title="<?=$row['user_name']?>" href="<?=core_getPermalink('user-profile', array('id' => $row['id'], $row['user_name']))?>"><?=$row['user_name']?></a></author>
                    <categories>VIDEO</categories>
                    <tag></tag>
            </data>
            <thumb><?=core_getMedialink($row['id'], 'content', '_med.jpg')?></thumb>
    </item>
    <?
}
?>
</root>