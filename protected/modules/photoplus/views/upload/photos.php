<div class="row clearfix">
    <div class="col-md-12 column">
        <?php foreach($photos as $photo):?>
           <img  class="img-thumbnail" src="<?php echo $photo["picture"];?>" width="150" height="150" alt="" data-source="<?php echo $photo["source"];?>">
        <?php endforeach;?>
    </div>
</div>