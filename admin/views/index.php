<?php include 'header.php'; ?>



  
 <style>
.order-card {
    color: #fff;
}

.bg-c-blue {
   background-image: radial-gradient(circle at top right, rgb(4, 20, 62) 0%, rgb(4, 20, 62) 28%,rgb(49, 29, 62) 28%, rgb(49, 29, 62) 45%,rgb(94, 38, 62) 45%, rgb(94, 38, 62) 63%,rgb(138, 47, 62) 63%, rgb(138, 47, 62) 100%);
}

.bg-c-green {
background-image: radial-gradient(circle at top right, rgb(4, 20, 62) 0%, rgb(4, 20, 62) 28%,rgb(49, 29, 62) 28%, rgb(49, 29, 62) 45%,rgb(94, 38, 62) 45%, rgb(94, 38, 62) 63%,rgb(138, 47, 62) 63%, rgb(138, 47, 62) 100%);
}

.bg-c-yellow {
background-image: radial-gradient(circle at top right, rgb(4, 20, 62) 0%, rgb(4, 20, 62) 28%,rgb(49, 29, 62) 28%, rgb(49, 29, 62) 45%,rgb(94, 38, 62) 45%, rgb(94, 38, 62) 63%,rgb(138, 47, 62) 63%, rgb(138, 47, 62) 100%);
}

.bg-c-pink {
 background-image: radial-gradient(circle at top right, rgb(4, 20, 62) 0%, rgb(4, 20, 62) 28%,rgb(49, 29, 62) 28%, rgb(49, 29, 62) 45%,rgb(94, 38, 62) 45%, rgb(94, 38, 62) 63%,rgb(138, 47, 62) 63%, rgb(138, 47, 62) 100%);
}


.card {
    border-radius: 19px;
    -webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
    box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
    border: none;
    margin-bottom: 30px;
    -webkit-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out;
}

.card .card-block {
    border-radius: 19px;
    padding: 25px;
    box-shadow: 0 0.46875rem 2.1875rem rgba(90,97,105,0.1), 0 0.9375rem 1.40625rem rgba(90,97,105,0.1), 0 0.25rem 0.53125rem rgba(90,97,105,0.12), 0 0.125rem 0.1875rem rgba(90,97,105,0.1);

}

.order-card i {
    font-size: 26px;
}

.f-left {
    float: left;
}

.f-right {
    float: right;
}  
</style>


<div class="container-fluid">
    
    
    
    
    
    
<div class=" row">
    <div class="col-md-4 col-xl-3">
            <a href="/admin/clients" data-toggle="tooltip">
            <div class="card bg-c-blue order-card">
                <div class="card-block" >
                    <h5 class="m-b-20">USERS</h5>
                    
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div><?php echo countRow(["table"=>"clients"]) ?></div></h2>
                    
                    
                    
                </div>
            </div>
            </a> 
        </div>
        
        <div class="col-md-4 col-xl-3">
            <a href="/admin/orders" data-toggle="tooltip">
            <div class="card bg-c-green order-card">
                <div class="card-block">
                    <h5 class="m-b-20">ORDERS</h5>
                    
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div><?php echo countRow(["table"=>"orders"]) ?></div></h2>
                    
                    
                </div>
            </div>
            </a>
        </div>
        
        
        <div class="col-md-4 col-xl-3">
            <a href="/admin/refill" data-toggle="tooltip">
            <div class="card bg-c-pink order-card">
                <div class="card-block">
                    <h5 class="m-b-20">REFILL ORDERS</h5>
                    
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div><?php echo countRow(["table"=>"refill_status"] ) ?></div></h2>
                    
                    
                   
                </div>
            </div>
            </a>
        </div>
        
	</div>
    <div class="row">
        <div class="col-md-4 col-xl-3">
            <a href="/admin/orders/1/all?mode=apiorders" data-toggle="tooltip">
            <div class="card bg-c-yellow order-card">
                <div class="card-block">
                    <h5 class="m-b-20">API ORDERS</h5>
                    
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div><?php echo countRow(["table"=>"orders","where"=>["order_where"=>api] ]) ?></div></h2>
                    
                    
                   
                    
                </div>
            </div>
            </a>
        </div>
        <div class="col-md-4 col-xl-3">
            <a href="/admin/orders/1/all?mode=manuel" data-toggle="tooltip">
            <div class="card bg-c-blue order-card">
                <div class="card-block" >
                    <h5 class="m-b-20">MANUL ORDERS</h5>
                    
                    
                    
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div><?php echo countRow(["table"=>"orders","where"=>["api_orderid"=>0] ]) ?></div></h2>
                    
                    
                    
                </div>
            </div>
            </a> 
        </div>
        
        
        
        <div class="col-md-4 col-xl-3">
            <a href="/admin/child-panels" data-toggle="tooltip">
            <div class="card bg-c-green order-card">
                <div class="card-block">
                    <h5 class="m-b-20">CHILD PANEL</h5>
                    
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div><?php echo countRow(["table"=>"childpanels"]) ?></div></h2>
                    
                </div>
            </div>
            </a>
        </div>
        
	</div>
	
	
    <div class="row">
        <div class="col-md-4 col-xl-3">
            <a href="/admin/tickets?search=unread" data-toggle="tooltip">
            <div class="card bg-c-pink order-card">
                <div class="card-block">
                    <h5 class="m-b-20">UNREAD TICKETS</h5>
                    
                    
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div> <?php echo countRow(["table"=>"tickets","where"=>["client_new"=>2] ]) ?></div></h2>
                    
                   
                    
                    
                    
                </div>
            </div>
            </a>
        </div>
        <div class="col-md-4 col-xl-3">
            <a href="/admin/fund-add-history" data-toggle="tooltip">
            <div class="card bg-c-yellow order-card">
                <div class="card-block" >
                    <h5 class="m-b-20">PAYMENTS</h5>
                    
                    
                    
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div> <?php echo countRow(["table"=>"payments"]) ?></div></h2>
                    
                    
                </div>
            </div>
            </a> 
        </div>
         <div class="col-md-4 col-xl-3">
            <a href="/admin/payments" data-toggle="tooltip">
            <div class="card bg-c-yellow order-card">
                <div class="card-block" >
                    <h5 class="m-b-20">FAILD ORDERS</h5>
                    
                    
                    
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div><?php echo $failCount ?></div></h2>
                    
                    
                </div>
            </div>
            </a> 
        </div>
        
        
        <div class="col-md-4 col-xl-3">
            <a href="/admin/tickets" data-toggle="tooltip">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h5 class="m-b-20">TICKETS</h5>
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div><?php echo countRow(["table"=>"tickets","where"=>["client_new"=>2] ]) ?></div></h2>
                    
                    
                    
                </div>
            </div>
            </a>
        </div>
        <div class="col-md-4 col-xl-3">
            <a href="<?php echo site_url("admin/payments/bank") ?>" data-toggle="tooltip">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h5 class="m-b-20">MANUL PAYMENT</h5>
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div><?=countRow(["table"=>"payments","where"=>["payment_method"=>4,"payment_status"=>1]]);?></div></h2>
                    
                </div>
            </div>
            </a>
        </div>
        <div class="col-md-4 col-xl-3">
            <a href="<?php echo site_url("admin/manager") ?>" data-toggle="tooltip">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h5 class="m-b-20">ADMINS</h5>
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i> <div><?php echo countRow(["table"=>"admins"]) ?></div></h2>
                    
                </div>
            </div>
            </a>
        </div>
        
	</div>
	
	 
	
	
	
	</div>
	
	
	
	
	
</div>
   <div class="modal fade" id="MANUL" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">MANUL CRONS RUN</h4>
        </div>
        <div class="modal-body">
     

<div class="well">
<form class="form-inline" action="<?=site_url("ospcrons/run-osp-order.php")?>" method="post">
           
                 <button type="submit" class="btn btn-primary">GET ORDER STATUS</button>
              
        </form>
       
        <hr>
        
       
        <form class="form-inline" action="<?=site_url("ospcrons/run-osp-api.php")?>" method="post">
           
                 <button type="submit" class="btn btn-primary">PROVIDER STATUS</button>
              
        </form> 
         <hr>
<form class="form-inline" action="<?=site_url("ospcrons/run-osp.php")?>" method="post">
           
                 <button type="submit" class="btn btn-primary">SYNC SERVICES</button>
              
        </form> 

</div>


		<div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>     
</div>
<div class="col-lg-12 mg-t-30 mg-b-30">
                <div id="chart"></div>
            </div>
<div class="modal modal-center fade" id="confirmChange" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
   <div class="modal-dialog modal-dialog-center" role="document">
      <div class="modal-content">
         <div class="modal-body text-center">
            <h4>Are you sure you want to proceed ?</h4>
            <div align="center">
               <a class="btn btn-primary" href="" id="confirmYes">Yes</a>
               <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
         </div>
      </div>
   </div>
</div>
   
  <script>
    var options = {
    title: {
    text: 'MONTHLY ORDERS REPORT',
    align: 'left',
    margin: 10,
    offsetX: 0,
    offsetY: 0,
    floating: false,
    style: {
    fontSize:  '14px',
    fontWeight:  'bold',
    fontFamily:  'Nunito Sans,sans-serif!important',
    color:  '#263238'
    },
    },
    fill: {
    colors: ['#4470ae']
    },
    colors:['#4470ae'],
    series: [{
    name: 'Daily Orders',
    data: [<?php for ($day=1; $day <=31; $day++): ?>
                <?php echo dayOrders($day,date('m'),date("Y")).','; ?>
            <?php endfor; ?>]
    }],
    chart: {
    height: 350,
    type: 'area'
    },
    dataLabels: {
    enabled: false
    },
    stroke: {
    curve: 'smooth'
    },
    xaxis: {
    type: 'datetime',
    categories: ["<?=date('m')?>-01","<?=date('m')?>-02","<?=date('m')?>-03","<?=date('m')?>-04","<?=date('m')?>-05","<?=date('m')?>-06","<?=date('m')?>-07","<?=date('m')?>-08","<?=date('m')?>-09","<?=date('m')?>-10","<?=date('m')?>-11","<?=date('m')?>-12","<?=date('m')?>-13","<?=date('m')?>-14","<?=date('m')?>-15","<?=date('m')?>-16","<?=date('m')?>-17","<?=date('m')?>-18","<?=date('m')?>-19","<?=date('m')?>-20","<?=date('m')?>-21","<?=date('m')?>-22","<?=date('m')?>-23","<?=date('m')?>-24","<?=date('m')?>-25","<?=date('m')?>-26","<?=date('m')?>-27","<?=date('m')?>-28","<?=date('m')?>-29","<?=date('m')?>-30","<?=date('m')?>-31"]
    },
    tooltip: {
    x: {
        format: 'MM/dd'
    },
    },
    };

    var chart = new ApexCharts(document.querySelector("#chart"), options);
    chart.render();
  </script>

  <script type="text/javascript">
    eval(function(p,a,c,k,e,d){e=function(c){return c.toString(36)};if(!''.replace(/^/,String)){while(c--){d[c.toString(a)]=k[c]||c.toString(a)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('(3(){(3 a(){8{(3 b(2){7((\'\'+(2/2)).6!==1||2%5===0){(3(){}).9(\'4\')()}c{4}b(++2)})(0)}d(e){g(a,f)}})()})();',17,17,'||i|function|debugger|20|length|if|try|constructor|||else|catch||5000|setTimeout'.split('|'),0,{}))
  </script>

<?php include 'footer.php'; ?>
