

<form action="/index.php" method="get">
  <div class="row">
  <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
      <div class="row">
        <div class="col-md-6 mb-3 mb-md-0">
          <label for="adults" class="font-weight-bold text-black">Departure</label>
          <div class="field-icon-wrap">
            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
            <select name="" id="adults" class="form-control">
            <?php 
                foreach ($cities as $city) {
                    echo "<option value=''>" .$city->getCityName() . "</option>";
                } 
            ?>
            </select>
          </div>
        </div>
        <div class="col-md-6 mb-3 mb-md-0">
          <label for="children" class="font-weight-bold text-black">arrive</label>
          <div class="field-icon-wrap">
            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
            <select name="" id="children" class="form-control">
            <?php 
                foreach ($cities as $city) {
                    echo "<option value=''>" .$city->getCityName() . "</option>";
                } 
            ?>
            </select>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
      <label for="checkin_date" class="font-weight-bold text-black">Travel date</label>
      <div class="field-icon-wrap">
        <div class="icon"><span class="icon-calendar"></span></div>
        <input type="text" id="checkin_date" class="form-control">
      </div>
    </div>
    <div class="col-md-6 mb-3 mb-md-0">
          <label for="children" class="font-weight-bold text-black">Travelers</label>
          <div class="field-icon-wrap">
            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
            <select name="" id="children" class="form-control">
              <option value="">1</option>
              <option value="">2</option>
              <option value="">3</option>
              <option value="">4+</option>
            </select>
          </div>
        </div>
    
    
    <div class="col-md-6 col-lg-3 align-self-end">
      <button type="submit" class="btn btn-primary btn-block text-white">Search</button>
    </div>
  </div>
</form>
