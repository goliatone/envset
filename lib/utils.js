'use strict';

var fs = require('fs');
var path = require('path');

/*
 * Taken from here:
 * https://github.com/dominictarr/rc/blob/132062de0e61881a025cc4784d9a2798409c2bf1/lib/utils.js
 */
exports.find = function $find() {

    var rel = path.join.apply(null, [].slice.call(arguments));

    function find(start, rel) {
        var file = path.join(start, rel);
        try {
            fs.statSync(file);
            return file;
        } catch (err) {
            if(path.dirname(start) !== start){
                return find(path.dirname(start), rel);
            }
        }
    }
    return find(process.cwd(), rel);
};
