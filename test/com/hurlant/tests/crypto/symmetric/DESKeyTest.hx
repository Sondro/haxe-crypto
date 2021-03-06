/**
 * DesKeyTest
 *
 * A test class for DesKey
 * Copyright (c) 2007 Henri Torgemane
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.tests.crypto.symmetric;


import com.hurlant.tests.*;

import com.hurlant.crypto.symmetric.DESKey;
import com.hurlant.util.Hex;

import com.hurlant.util.ByteArray;

class DESKeyTest extends BaseTestCase {

    /**
     * Test vectors mostly grabbed from
     * http://csrc.nist.gov/publications/nistpubs/800-17/800-17.pdf
     * (Appendix A and B)
     * incomplete.
     */
    public function test_ecb() {
        var keys = [
            "3b3898371520f75e", // grabbed from the output of some js implementation out there
            "10316E028C8F3B4A", // appendix A vector
            "0101010101010101", // appendix B Table 1, round 0
            "0101010101010101", // round 1
            "0101010101010101", // 2
            "0101010101010101",
            "0101010101010101",
            "0101010101010101",
            "0101010101010101",
            "0101010101010101",
            "0101010101010101", // round 8
            "8001010101010101", // app B, tbl 2, round 0
            "4001010101010101",
            "2001010101010101",
            "1001010101010101",
            "0801010101010101",
            "0401010101010101",
            "0201010101010101",
            "0180010101010101",
            "0140010101010101"
        ];
        var pts = [
            "0000000000000000", // js
            "0000000000000000", // App A
            "8000000000000000", // App B, tbl 1, rnd0
            "4000000000000000",
            "2000000000000000",
            "1000000000000000",
            "0800000000000000", // rnd 4
            "0400000000000000",
            "0200000000000000",
            "0100000000000000",
            "0080000000000000", // round 8
            "0000000000000000", // App B, tbl2, rnd0
            "0000000000000000",
            "0000000000000000",
            "0000000000000000",
            "0000000000000000",
            "0000000000000000",
            "0000000000000000",
            "0000000000000000",
            "0000000000000000"];
        var cts = [
            "83A1E814889253E0", // js
            "82DCBAFBDEAB6602", // App A
            "95F8A5E5DD31D900", // App b, tbl 1, rnd 0
            "DD7F121CA5015619",
            "2E8653104F3834EA",
            "4BD388FF6CD81D4F",
            "20B9E767B2FB1456",
            "55579380D77138EF",
            "6CC5DEFAAF04512F",
            "0D9F279BA5D87260",
            "D9031B0271BD5A0A", // rnd 8
            "95A8D72813DAA94D", // App B, tbl 2, rnd 0
            "0EEC1487DD8C26D5",
            "7AD16FFB79C45926",
            "D3746294CA6A6CF3",
            "809F5F873C1FD761",
            "C02FAFFEC989D1FC",
            "4615AA1D33E72F10",
            "2055123350C00858",
            "DF3B99D6577397C8"];

        for (i in 0...keys.length) {
            var key = Hex.toArray(keys[i]);
            var pt = Hex.toArray(pts[i]);
            var des = new DESKey(key);
            des.encrypt(pt);
            var out = Hex.fromArray(pt).toUpperCase();
            assert(cts[i], out);
            // now go back to plaintext
            des.decrypt(pt);
            out = Hex.fromArray(pt).toUpperCase();
            assert(pts[i], out);
        }
    }

    public function new() {
        super();
    }
}


