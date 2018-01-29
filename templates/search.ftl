<#include "head.ftl">
<script src="/searchidx.js"></script>
<script>
    /**
     * Normalize text
     * remove accent and other disturbing stuff
     * remove unneeded spaces
     */
    function normalize (str) {
        if (str == null) {
            return "";
        }

        return str.replace(/ +(?= )/g, '').normalize('NFD').replace(/[\u0300-\u036f]/g, "");

    }

    /**
     * Get the the search object
     * .orginal = the original string
     * .fullString = the normalised search string used for the search
     * .terms each terms of the request char > 3
     */
    function getSearchObj(str) {

        var jsonData = {};
        jsonData["fullString"] = normalize(str);
        jsonData["terms"] = [];
        jsonData["original"] = str;

        if (jsonData["fullString"].length < 4) {
            return null;
        }

        for (let term of jsonData["fullString"].split(" ")) {
            if (term.length >= 3) {
                jsonData.terms.push(term);
            }
        }

        return jsonData;

    }

    /**
     * retourn un tableau de resultat avec les termes correspondants
     */
    function searchMe(string, idxs) {
        var res = [];
        var srch = getSearchObj(string);

        if (srch != null) {
            console.log("startMeUp");

            for (let readIndx of idxs) {
                let score = 0;

                // score tag;
                if (readIndx.hasOwnProperty("tags")) {
                    let tagHits = readIndx["tags"].filter(x => srch["terms"].indexOf(x) > 0);
                    score += tagHits.length * 7 // seven point direct hit;
                    readIndx["tagHits"] = tagHits;

                }

                // score title;
                if (readIndx.hasOwnProperty("title")) {
                    let arTitle =  normalize(readIndx["title"]).split(" ");
                    let titleHits = arTitle.filter(x => srch["terms"].indexOf(x) > 0);
                    score += titleHits.length * 3 // seven point direct hit;
                    readIndx["titleHits"] = titleHits;
                    //console.log (titleHits);
                }

                // @TODO score full text maybe

                // add point if post as score and is recent

                if (score > 0) {
                    readIndx["score"] = score;

                    res.push (readIndx);
                }
            }

            if (res.length > 0) {
                // @TODO les resultat devrait tenir compte des date en cas d'egualite
                res.sort(function(a, b) {return b["score"] - a["score"];});
                return res;
            } else {
                return null;
            }

        } else {
            console.log ("no search found");
        }
    }
    var t0 = performance.now();
    console.log(searchMe("du velo et des blog en raspberry root", indx));
    var t1 = performance.now();
    console.log("Call to doSomething took " + (t1 - t0) + " milliseconds.")

</script>
<body>
<#include "header.ftl">
	<div class="content-wrapper">
		<div class="content-wrapper__inner">
			<article class="post-container post-container--single">
				<header class="post-header">
				<h1 class="post-title">Search this site</h1>
  			  	</header>

                <form class="form-wrapper cf">
                    <input id="schrstr" type="text" placeholder="Search here..." required>
                    <button id="btn" type="button">Search</button>
                </form>

                <hr />

				<section class="post">
                <ul id="result"></ul>
				</section>
		</article>
		</div>
		<#include "footer.ftl">
        <script type="text/javascript">
            $(document).ready(function(){
                console.log ("start");
                $('#btn').click(function() {
                    var searchstr = $( "#schrstr" ).val();

                    var t0 = performance.now();
                    var res = searchMe(searchstr, indx);
                    var t1 = performance.now();
                    console.log("Call to doSomething took " + (t1 - t0) + " milliseconds.");
                    console.log(res);

                    $('#result').empty()
                    if (res == null) {
                        console.log ("Im null");
                    } else {
                        $.each(res, function(i, f) {
                            $('#result').append('<li><a href="' + f.url + '">' + f.title + '</a> - ' + f.score +  ' - </li>');
                        });
                    }



                    //return true;
                });
            });
        </script>
  </div>
</body>
</html>