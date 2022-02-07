{# > Flix media 
 # https://flixmedia.eu/
 #
 # > turning browsers into buyers <
 #
 # - INpages
 # - MiniSites
 #
 # All you need to do is copy and paste the code snippet below into the
 # MASTER PRODUCT TEMPLATE of your product pages and ensure that the BRAND, 
 # MPN and/or EAN parameters are AUTOMATICALLY replaced from your product database.
 # The code snippet below will propogate and your website will automatically update
 # all your product pages with the product MiniSites and/ or INpages instantly!
 #
 # For more details on the parameters, please visit video and FAQ page:
 # https://www.flixmedia.eu/sellmore
 #
 # data-flix-
 #  distributor: __DISTRIBUTOR__ID__
 #  language: hu
 #  brand: {{ manufacturer }}
 #  mpn: {{ sku }} - móodsítva / vagy más érték
 #  ean: n/a
 #  sku: n/a
 #
 #
 # Példa:
 #
 # <div id="flix-minisite"></div>
 # <div id="flix-inpage"></div>
 # <script type="text/javascript" src="//media.flixfacts.com/js/loader.js" 
 #   data-flix-distributor="__DISTRIBUTOR__ID__" 
 #   data-flix-language="hu" 
 #   data-flix-brand="Sony" 
 #   data-flix-mpn="ILCE6000LS.CEC"
 #   data-flix-ean="" 
 #   data-flix-sku="" 
 #   data-flix-button="flix-minisite" 
 #   data-flix-inpage="flix-inpage" 
 #   data-flix-button-image="" 
 #   data-flix-fallback-language="" 
 #   data-flix-price=""
 # ></script>
 #
 #
 # A Swig split funkció használata:
 # - A kötőjelnél felbontva két részre osztjuk a cikkszámot (0,1)
 # - A kapott tömb 2. elemét (1) azaz a gyártói cikkszámot küldjük tovább
 #
 #   {{ sku }} : 480-ILCE6000LS.CEC
 #   {{ sku | split('-', 2)[1] }}
 #
 #
 # Változó: {{ flixmedia }}
 #   
 #  
 #
 #
 # A használat:
 # - engedélyezés: "flixmedia" címke használatával
 # - eltérő cikkszám használata: "flixmedia:(cikkszám)" címke használatával
 # - Saját kit esetében, két termékkel: "flixmedia:(cikkszám,cikkszám)" címke használatával
 #
 #
 # Distributor ID: 
 #  37 37 30 32 / Használat el vissza kell fejteni!
 #
 #
 #}


{% if flixmedia %}


  {% set sku_for_flix = [false] %}

  {% if flixmedia | split(':', 2)[1] != false  %}

    {# kapott, n db cikszámmal #}
    {% set sku_for_flix = flixmedia | split(':', 2)[1] | replace({'(':'', ')':''}) | split(';') %}

  {% else %}

    {# örökölt cikszámmal #}
    {% set sku_for_flix = [sku | split('-', 2)[1]] %}

  {% endif %}

  {# Flix media  (eleje) #}
  {% for sku_to_flix in sku_for_flix %}

    <div id="flix-inpage"></div>
    <script type="text/javascript" src="//media.flixfacts.com/js/loader.js" 
      data-flix-distributor="__DISTRIBUTOR__ID__" 
      data-flix-language="hu" 
      data-flix-brand="{{ manufacturer }}" 
      data-flix-mpn="{{ sku_to_flix }}" 
      data-flix-ean="" 
      data-flix-sku="" 
      data-flix-inpage="productdescriptionnoparameters" 
      data-flix-fallback-language="" 
      data-flix-price=""
    ></script>

    <script type="text/javascript">
      /* A flix-inpage áthelyezése a leírásba.
      * A leíárs nem hozzáférhető, ezért a feljebb létrehozott Flix media tartalmat áthelyezzük a leírás modulba.
      */  
      $('#flix-inpage').appendTo( '#productdescriptionnoparameters > .module-body' );
    </script>

  {% endfor %}

  <style type="text/css">
    /* Vaamiért van egy flix-hotspot gomb a bal felső sarokba, ezt eltüntetjük.
     */
    #flix_hotspots { display:none; }
  </style>

  {# Flix media  (vége) #}

{% endif %}
