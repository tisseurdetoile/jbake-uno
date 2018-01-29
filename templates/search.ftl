<#include "head.ftl">
<script src="/searchidx.js"></script>
<script>
    /**
     * Normalize text
     * remove accent and other disturbing stuff
     * remove unneeded spaces
     */
    function normalize(str) {
        if (str == null) {
            return "";
        }

        return str.toLowerCase().replace(/ +(?= )/g, '').normalize('NFD').replace(/[\u0300-\u036f]/g, "");

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

            for (let readIndx of idxs) {
                let score = 0;

                // score tag;
                if (readIndx.hasOwnProperty("tags")) {
                    let tagHits = readIndx["tags"].filter(x => srch["terms"].indexOf(x) >= 0);
                    score += tagHits.length * 7 // seven point direct hit;
                    readIndx["tagHits"] = tagHits;

                }

                // score title;
                if (readIndx.hasOwnProperty("title")) {
                    let arTitle = normalize(readIndx["title"]).split(" ");
                    let titleHits = arTitle.filter(x => srch["terms"].indexOf(x) >= 0);
                    score += titleHits.length * 3 // seven point direct hit;
                    readIndx["titleHits"] = titleHits;
                }

                // @TODO score full text maybe
                // @TODO add point if post as score and is recent

                if (score > 0) {
                    readIndx["score"] = score;

                    res.push(readIndx);
                }
            }

            if (res.length > 0) {
                // @TODO les resultat devrait tenir compte des date en cas d'egualite
                res.sort(function (a, b) {
                    return b["score"] - a["score"];
                });
                return res;
            } else {
                return null;
            }
        }
    }
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

            <hr/>

            <section class="post">
                <span id="info"></span>
                <ul id="result"></ul>
            </section>
        </article>
    </div>
		<#include "footer.ftl">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btn').click(function () {
                var searchstr = $("#schrstr").val();

                var t0 = performance.now();
                var res = searchMe(searchstr, indx);
                var elasped = Math.round(performance.now() - t0);

                $('#result').empty();
                $('#result').text('took :' + elasped  + ' ms');
                if (res == null) {
                    $('#result').append('No results found');
                } else {
                    $.each(res, function (i, f) {
                        $('#result').append('<li><a href="' + f.url + '">' + f.title + '</a> - Score:' + f.score + ' - </li>');
                    });
                }

            });
        });
    </script>
</div>
</body>
</html>