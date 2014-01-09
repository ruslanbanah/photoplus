<div class="row clearfix">
    <div class="col-md-12 column">
        <?php foreach($albums as $album):?>

                <div style="width: 120px;height: 120px;float: left;margin: 10px">
                    <a class="album" data-id="<?php echo $album["id"];?>" data-count="<?php echo $album["count"];?>">
                        <img class="img-thumbnail" src="<?php echo $album["cover_path"];?>" width="100" height="100" alt="">
                        <span><?php echo $album["name"];?></span>
                    </a>
                </div>

        <?php endforeach;?>
    </div>
</div>