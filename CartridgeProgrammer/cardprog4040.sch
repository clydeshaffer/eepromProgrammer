<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.3.1">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Arduino-clone">
<description>Arduino Clone pinheaders
By cl@xganon.com
http://www.xganon.com</description>
<packages>
<package name="NANO">
<pad name="TX0" x="5.08" y="-8.89" drill="0.8" shape="long"/>
<pad name="RX1" x="5.08" y="-6.35" drill="0.8" shape="long"/>
<pad name="RST1" x="5.08" y="-3.81" drill="0.8" shape="long"/>
<pad name="GND1" x="5.08" y="-1.27" drill="0.8" shape="long"/>
<pad name="D2" x="5.08" y="1.27" drill="0.8" shape="long"/>
<pad name="D3" x="5.08" y="3.81" drill="0.8" shape="long"/>
<pad name="D4" x="5.08" y="6.35" drill="0.8" shape="long"/>
<pad name="D5" x="5.08" y="8.89" drill="0.8" shape="long"/>
<pad name="D6" x="5.08" y="11.43" drill="0.8" shape="long"/>
<pad name="D7" x="5.08" y="13.97" drill="0.8" shape="long"/>
<pad name="D8" x="5.08" y="16.51" drill="0.8" shape="long"/>
<pad name="D9" x="5.08" y="19.05" drill="0.8" shape="long"/>
<pad name="RAW" x="-10.16" y="-8.89" drill="0.8" shape="long"/>
<pad name="GND" x="-10.16" y="-6.35" drill="0.8" shape="long"/>
<pad name="RST" x="-10.16" y="-3.81" drill="0.8" shape="long"/>
<pad name="A3" x="-10.16" y="11.43" drill="0.8" shape="long"/>
<pad name="A2" x="-10.16" y="13.97" drill="0.8" shape="long"/>
<pad name="A1" x="-10.16" y="16.51" drill="0.8" shape="long"/>
<pad name="A0" x="-10.16" y="19.05" drill="0.8" shape="long"/>
<pad name="D13" x="-10.16" y="26.67" drill="0.8" shape="long"/>
<pad name="D12" x="5.08" y="26.67" drill="0.8" shape="long"/>
<pad name="D11" x="5.08" y="24.13" drill="0.8" shape="long"/>
<pad name="D10" x="5.08" y="21.59" drill="0.8" shape="long"/>
<pad name="3.3V" x="-10.16" y="24.13" drill="0.8" shape="long" rot="R180"/>
<pad name="AREF" x="-10.16" y="21.59" drill="0.8" shape="long" rot="R180"/>
<pad name="5V" x="-10.16" y="-1.27" drill="0.8" shape="long"/>
<pad name="ICSP2" x="-5.08" y="-7.62" drill="0.8" rot="R90"/>
<pad name="ICSP4" x="-2.54" y="-7.62" drill="0.8" rot="R90"/>
<pad name="ICSP6" x="0" y="-7.62" drill="0.8" rot="R90"/>
<pad name="A4" x="-10.16" y="8.89" drill="0.8" shape="long" rot="R180"/>
<pad name="A5" x="-10.16" y="6.35" drill="0.8" shape="long" rot="R180"/>
<pad name="A6" x="-10.16" y="3.81" drill="0.8" shape="long" rot="R180"/>
<pad name="A7" x="-10.16" y="1.27" drill="0.8" shape="long" rot="R180"/>
<pad name="ICSP1" x="-5.08" y="-10.16" drill="0.8" rot="R90"/>
<pad name="ICSP3" x="-2.54" y="-10.16" drill="0.8" rot="R90"/>
<pad name="ICSP5" x="0" y="-10.16" drill="0.8" rot="R90"/>
</package>
</packages>
<symbols>
<symbol name="NANO">
<pin name="3.3V" x="-22.86" y="12.7" visible="pin" length="middle"/>
<pin name="AREF" x="-22.86" y="10.16" visible="pin" length="middle"/>
<pin name="ICSP1" x="-10.16" y="-27.94" visible="off" length="point" rot="R270"/>
<pin name="ICSP2" x="-10.16" y="-25.4" visible="off" length="point" rot="R270"/>
<pin name="ICSP3" x="-7.62" y="-27.94" visible="off" length="point" rot="R270"/>
<pin name="ICSP4" x="-7.62" y="-25.4" visible="off" length="point" rot="R270"/>
<pin name="TX0" x="10.16" y="-20.32" visible="pin" length="middle" rot="R180"/>
<pin name="RX1" x="10.16" y="-17.78" visible="pin" length="middle" rot="R180"/>
<pin name="RST1" x="10.16" y="-15.24" visible="pin" length="middle" rot="R180"/>
<pin name="GND2" x="10.16" y="-12.7" visible="pin" length="middle" rot="R180"/>
<pin name="D2" x="10.16" y="-10.16" visible="pin" length="middle" rot="R180"/>
<pin name="D3" x="10.16" y="-7.62" visible="pin" length="middle" rot="R180"/>
<pin name="D4" x="10.16" y="-5.08" visible="pin" length="middle" rot="R180"/>
<pin name="D5" x="10.16" y="-2.54" visible="pin" length="middle" rot="R180"/>
<pin name="D6" x="10.16" y="0" visible="pin" length="middle" rot="R180"/>
<pin name="D7" x="10.16" y="2.54" visible="pin" length="middle" rot="R180"/>
<pin name="D8" x="10.16" y="5.08" visible="pin" length="middle" rot="R180"/>
<pin name="D9" x="10.16" y="7.62" visible="pin" length="middle" rot="R180"/>
<pin name="RAW" x="-22.86" y="-20.32" visible="pin" length="middle"/>
<pin name="GND" x="-22.86" y="-17.78" visible="pin" length="middle"/>
<pin name="RST" x="-22.86" y="-15.24" visible="pin" length="middle"/>
<pin name="5.5V" x="-22.86" y="-12.7" visible="pin" length="middle"/>
<pin name="A3" x="-22.86" y="0" visible="pin" length="middle"/>
<pin name="A2" x="-22.86" y="2.54" visible="pin" length="middle"/>
<pin name="A1" x="-22.86" y="5.08" visible="pin" length="middle"/>
<pin name="A0" x="-22.86" y="7.62" visible="pin" length="middle"/>
<pin name="D13" x="-22.86" y="15.24" visible="pin" length="middle"/>
<pin name="D12" x="10.16" y="15.24" visible="pin" length="middle" rot="R180"/>
<pin name="D11" x="10.16" y="12.7" visible="pin" length="middle" rot="R180"/>
<pin name="D10" x="10.16" y="10.16" visible="pin" length="middle" rot="R180"/>
<pin name="A7" x="-22.86" y="-10.16" visible="pin" length="middle"/>
<pin name="A6" x="-22.86" y="-7.62" visible="pin" length="middle"/>
<pin name="A5" x="-22.86" y="-5.08" visible="pin" length="middle"/>
<pin name="A4" x="-22.86" y="-2.54" visible="pin" length="middle"/>
<pin name="ICSP5" x="-5.08" y="-27.94" visible="off" length="point" rot="R270"/>
<pin name="ICSP6" x="-5.08" y="-25.4" visible="off" length="point" rot="R270"/>
<wire x1="-17.78" y1="17.78" x2="-17.78" y2="-30.48" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-30.48" x2="5.08" y2="-30.48" width="0.254" layer="94"/>
<wire x1="5.08" y1="-30.48" x2="5.08" y2="17.78" width="0.254" layer="94"/>
<wire x1="5.08" y1="17.78" x2="-17.78" y2="17.78" width="0.254" layer="94"/>
<text x="-12.7" y="20.32" size="1.778" layer="95">Arduino Nano</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="NANO">
<description>Arduino Nano</description>
<gates>
<gate name="G$1" symbol="NANO" x="7.62" y="2.54"/>
</gates>
<devices>
<device name="" package="NANO">
<connects>
<connect gate="G$1" pin="3.3V" pad="3.3V"/>
<connect gate="G$1" pin="5.5V" pad="5V"/>
<connect gate="G$1" pin="A0" pad="A0"/>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="A3" pad="A3"/>
<connect gate="G$1" pin="A4" pad="A4"/>
<connect gate="G$1" pin="A5" pad="A5"/>
<connect gate="G$1" pin="A6" pad="A6"/>
<connect gate="G$1" pin="A7" pad="A7"/>
<connect gate="G$1" pin="AREF" pad="AREF"/>
<connect gate="G$1" pin="D10" pad="D10"/>
<connect gate="G$1" pin="D11" pad="D11"/>
<connect gate="G$1" pin="D12" pad="D12"/>
<connect gate="G$1" pin="D13" pad="D13"/>
<connect gate="G$1" pin="D2" pad="D2"/>
<connect gate="G$1" pin="D3" pad="D3"/>
<connect gate="G$1" pin="D4" pad="D4"/>
<connect gate="G$1" pin="D5" pad="D5"/>
<connect gate="G$1" pin="D6" pad="D6"/>
<connect gate="G$1" pin="D7" pad="D7"/>
<connect gate="G$1" pin="D8" pad="D8"/>
<connect gate="G$1" pin="D9" pad="D9"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="GND2" pad="GND1"/>
<connect gate="G$1" pin="ICSP1" pad="ICSP1"/>
<connect gate="G$1" pin="ICSP2" pad="ICSP2"/>
<connect gate="G$1" pin="ICSP3" pad="ICSP3"/>
<connect gate="G$1" pin="ICSP4" pad="ICSP4"/>
<connect gate="G$1" pin="ICSP5" pad="ICSP5"/>
<connect gate="G$1" pin="ICSP6" pad="ICSP6"/>
<connect gate="G$1" pin="RAW" pad="RAW"/>
<connect gate="G$1" pin="RST" pad="RST"/>
<connect gate="G$1" pin="RST1" pad="RST1"/>
<connect gate="G$1" pin="RX1" pad="RX1"/>
<connect gate="G$1" pin="TX0" pad="TX0"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="mychips">
<packages>
<package name="SLOT36">
<pad name="P$1" x="-21.59" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$2" x="-19.05" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$3" x="-16.51" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$4" x="-13.97" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$5" x="-11.43" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$6" x="-8.89" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$7" x="-6.35" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$8" x="-3.81" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$9" x="-1.27" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$10" x="1.27" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$11" x="3.81" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$12" x="6.35" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$13" x="8.89" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$14" x="11.43" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$15" x="13.97" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$16" x="16.51" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$17" x="19.05" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$18" x="21.59" y="0" drill="1.016" diameter="1.524"/>
<pad name="P$19" x="-21.59" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$20" x="-19.05" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$21" x="-16.51" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$22" x="-13.97" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$23" x="-11.43" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$24" x="-8.89" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$25" x="-6.35" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$26" x="-3.81" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$27" x="-1.27" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$28" x="1.27" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$29" x="3.81" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$30" x="6.35" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$31" x="8.89" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$32" x="11.43" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$33" x="13.97" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$34" x="16.51" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$35" x="19.05" y="4.8514" drill="1.016" diameter="1.524"/>
<pad name="P$36" x="21.59" y="4.8514" drill="1.016" diameter="1.524"/>
<wire x1="-26.162" y1="-2.2606" x2="26.162" y2="-2.2606" width="0.127" layer="21"/>
<wire x1="-26.162" y1="7.112" x2="26.162" y2="7.112" width="0.127" layer="21"/>
<wire x1="-26.162" y1="-2.2606" x2="-26.162" y2="7.112" width="0.127" layer="21"/>
<wire x1="26.162" y1="7.112" x2="26.162" y2="-2.2606" width="0.127" layer="21"/>
<rectangle x1="-30.48" y1="-6.4643" x2="30.48" y2="11.3157" layer="39"/>
</package>
<package name="DIL28-6" urn="urn:adsk.eagle:footprint:770/1">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt; 0.6 inch</description>
<wire x1="-17.653" y1="-1.27" x2="-17.653" y2="-6.604" width="0.1524" layer="21"/>
<wire x1="-17.653" y1="1.27" x2="-17.653" y2="-1.27" width="0.1524" layer="21" curve="-180"/>
<wire x1="17.653" y1="-6.604" x2="17.653" y2="6.604" width="0.1524" layer="21"/>
<wire x1="-17.653" y1="6.604" x2="-17.653" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-17.653" y1="6.604" x2="17.653" y2="6.604" width="0.1524" layer="21"/>
<wire x1="-17.653" y1="-6.604" x2="17.653" y2="-6.604" width="0.1524" layer="21"/>
<pad name="1" x="-16.51" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-13.97" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-11.43" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-8.89" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="-6.35" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="-3.81" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="-1.27" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="1.27" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="3.81" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="6.35" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="8.89" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="11.43" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="13.97" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="16.51" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="16.51" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="13.97" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="17" x="11.43" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="18" x="8.89" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="19" x="6.35" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="20" x="3.81" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="21" x="1.27" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="22" x="-1.27" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="23" x="-3.81" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="24" x="-6.35" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="25" x="-8.89" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="26" x="-11.43" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="27" x="-13.97" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="28" x="-16.51" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<text x="-17.78" y="-6.35" size="1.778" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-14.605" y="-0.9398" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="DIL28-6" urn="urn:adsk.eagle:package:826/2" type="model">
<description>Dual In Line Package 0.6 inch</description>
<packageinstances>
<packageinstance name="DIL28-6"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="28C64">
<wire x1="-15.24" y1="27.94" x2="15.24" y2="27.94" width="0.254" layer="94"/>
<wire x1="15.24" y1="27.94" x2="15.24" y2="-30.48" width="0.254" layer="94"/>
<wire x1="15.24" y1="-30.48" x2="-15.24" y2="-30.48" width="0.254" layer="94"/>
<wire x1="-15.24" y1="-30.48" x2="-15.24" y2="27.94" width="0.254" layer="94"/>
<pin name="D0" x="20.32" y="15.24" length="middle" rot="R180"/>
<pin name="D1" x="20.32" y="12.7" length="middle" rot="R180"/>
<pin name="D2" x="20.32" y="10.16" length="middle" rot="R180"/>
<pin name="D3" x="20.32" y="7.62" length="middle" rot="R180"/>
<pin name="D4" x="20.32" y="5.08" length="middle" rot="R180"/>
<pin name="D5" x="20.32" y="2.54" length="middle" rot="R180"/>
<pin name="D6" x="20.32" y="0" length="middle" rot="R180"/>
<pin name="D7" x="20.32" y="-2.54" length="middle" rot="R180"/>
<pin name="A0" x="-20.32" y="15.24" length="middle" direction="in"/>
<pin name="A1" x="-20.32" y="12.7" length="middle" direction="in"/>
<pin name="A2" x="-20.32" y="10.16" length="middle" direction="in"/>
<pin name="A3" x="-20.32" y="7.62" length="middle" direction="in"/>
<pin name="A4" x="-20.32" y="5.08" length="middle" direction="in"/>
<pin name="A5" x="-20.32" y="2.54" length="middle" direction="in"/>
<pin name="A6" x="-20.32" y="0" length="middle" direction="in"/>
<pin name="A7" x="-20.32" y="-2.54" length="middle" direction="in"/>
<pin name="A8" x="-20.32" y="-5.08" length="middle" direction="in"/>
<pin name="A9" x="-20.32" y="-7.62" length="middle" direction="in"/>
<pin name="A10" x="-20.32" y="-10.16" length="middle" direction="in"/>
<pin name="A11" x="-20.32" y="-12.7" length="middle" direction="in"/>
<pin name="A12" x="-20.32" y="-15.24" length="middle" direction="in"/>
<pin name="VCC" x="-20.32" y="25.4" length="middle" direction="pwr"/>
<pin name="VSS" x="20.32" y="25.4" length="middle" direction="pwr" rot="R180"/>
<pin name="_WE" x="20.32" y="-10.16" length="middle" direction="in" rot="R180"/>
<pin name="_OE" x="20.32" y="-12.7" length="middle" direction="in" rot="R180"/>
<pin name="_CS1" x="-20.32" y="-22.86" length="middle" direction="in"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="28C64">
<gates>
<gate name="G$1" symbol="28C64" x="0" y="0"/>
</gates>
<devices>
<device name="SLOT" package="SLOT36">
<connects>
<connect gate="G$1" pin="A0" pad="P$14"/>
<connect gate="G$1" pin="A1" pad="P$13"/>
<connect gate="G$1" pin="A10" pad="P$26"/>
<connect gate="G$1" pin="A11" pad="P$24"/>
<connect gate="G$1" pin="A12" pad="P$6"/>
<connect gate="G$1" pin="A2" pad="P$12"/>
<connect gate="G$1" pin="A3" pad="P$11"/>
<connect gate="G$1" pin="A4" pad="P$10"/>
<connect gate="G$1" pin="A5" pad="P$9"/>
<connect gate="G$1" pin="A6" pad="P$8"/>
<connect gate="G$1" pin="A7" pad="P$7"/>
<connect gate="G$1" pin="A8" pad="P$22"/>
<connect gate="G$1" pin="A9" pad="P$23"/>
<connect gate="G$1" pin="D0" pad="P$15"/>
<connect gate="G$1" pin="D1" pad="P$16"/>
<connect gate="G$1" pin="D2" pad="P$17"/>
<connect gate="G$1" pin="D3" pad="P$32"/>
<connect gate="G$1" pin="D4" pad="P$31"/>
<connect gate="G$1" pin="D5" pad="P$30"/>
<connect gate="G$1" pin="D6" pad="P$29"/>
<connect gate="G$1" pin="D7" pad="P$28"/>
<connect gate="G$1" pin="VCC" pad="P$1"/>
<connect gate="G$1" pin="VSS" pad="P$36"/>
<connect gate="G$1" pin="_CS1" pad="P$27"/>
<connect gate="G$1" pin="_OE" pad="P$25"/>
<connect gate="G$1" pin="_WE" pad="P$20"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DIL28" package="DIL28-6">
<connects>
<connect gate="G$1" pin="A0" pad="10"/>
<connect gate="G$1" pin="A1" pad="9"/>
<connect gate="G$1" pin="A10" pad="21"/>
<connect gate="G$1" pin="A11" pad="23"/>
<connect gate="G$1" pin="A12" pad="2"/>
<connect gate="G$1" pin="A2" pad="8"/>
<connect gate="G$1" pin="A3" pad="7"/>
<connect gate="G$1" pin="A4" pad="6"/>
<connect gate="G$1" pin="A5" pad="5"/>
<connect gate="G$1" pin="A6" pad="4"/>
<connect gate="G$1" pin="A7" pad="3"/>
<connect gate="G$1" pin="A8" pad="25"/>
<connect gate="G$1" pin="A9" pad="24"/>
<connect gate="G$1" pin="D0" pad="11"/>
<connect gate="G$1" pin="D1" pad="12"/>
<connect gate="G$1" pin="D2" pad="13"/>
<connect gate="G$1" pin="D3" pad="15"/>
<connect gate="G$1" pin="D4" pad="16"/>
<connect gate="G$1" pin="D5" pad="17"/>
<connect gate="G$1" pin="D6" pad="18"/>
<connect gate="G$1" pin="D7" pad="19"/>
<connect gate="G$1" pin="VCC" pad="28"/>
<connect gate="G$1" pin="VSS" pad="14"/>
<connect gate="G$1" pin="_CS1" pad="20"/>
<connect gate="G$1" pin="_OE" pad="22"/>
<connect gate="G$1" pin="_WE" pad="27"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:826/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="40xx" urn="urn:adsk.eagle:library:80">
<description>&lt;b&gt;CMOS Logic Devices, 4000 Series&lt;/b&gt;&lt;p&gt;
Based on the following sources:
&lt;ul&gt;
&lt;li&gt;Motorola &lt;i&gt;CMOS LOGIC DATA&lt;/i&gt;; book, 02/88, DL131 REV 1
&lt;li&gt;http://www.elexp.com
&lt;li&gt;http://www.intersil.com
&lt;li&gt;http://www.ls3c.com.tw/product/1/COMOS.html
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL16" urn="urn:adsk.eagle:footprint:917/1" library_version="3">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="10.16" y1="2.921" x2="-10.16" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="10.16" y1="2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="2.921" x2="-10.16" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="-10.16" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.016" x2="-10.16" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-10.541" y="-2.921" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-7.493" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SO16" urn="urn:adsk.eagle:footprint:722/1" library_version="3">
<description>&lt;b&gt;Small Outline package&lt;/b&gt; 150 mil</description>
<wire x1="4.699" y1="1.9558" x2="-4.699" y2="1.9558" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-1.9558" x2="5.08" y2="-1.5748" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.5748" x2="-4.699" y2="1.9558" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="1.9558" x2="5.08" y2="1.5748" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.5748" x2="-4.699" y2="-1.9558" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.699" y1="-1.9558" x2="4.699" y2="-1.9558" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.5748" x2="5.08" y2="1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.5748" x2="-5.08" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.508" x2="-5.08" y2="-1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21" curve="-180"/>
<wire x1="-5.08" y1="-1.6002" x2="5.08" y2="-1.6002" width="0.0508" layer="21"/>
<smd name="1" x="-4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="16" x="-4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="2" x="-3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="3" x="-1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="15" x="-3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="14" x="-1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="4" x="-0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="13" x="-0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="5" x="0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="12" x="0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="6" x="1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="7" x="3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="11" x="1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="10" x="3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="8" x="4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="9" x="4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<text x="-4.064" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.461" y="-2.032" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<rectangle x1="-0.889" y1="1.9558" x2="-0.381" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="-3.0988" x2="-4.191" y2="-1.9558" layer="51"/>
<rectangle x1="-3.429" y1="-3.0988" x2="-2.921" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="-3.0734" x2="-1.651" y2="-1.9304" layer="51"/>
<rectangle x1="-0.889" y1="-3.0988" x2="-0.381" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="1.9558" x2="-1.651" y2="3.0988" layer="51"/>
<rectangle x1="-3.429" y1="1.9558" x2="-2.921" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="1.9558" x2="-4.191" y2="3.0988" layer="51"/>
<rectangle x1="0.381" y1="-3.0988" x2="0.889" y2="-1.9558" layer="51"/>
<rectangle x1="1.651" y1="-3.0988" x2="2.159" y2="-1.9558" layer="51"/>
<rectangle x1="2.921" y1="-3.0988" x2="3.429" y2="-1.9558" layer="51"/>
<rectangle x1="4.191" y1="-3.0988" x2="4.699" y2="-1.9558" layer="51"/>
<rectangle x1="0.381" y1="1.9558" x2="0.889" y2="3.0988" layer="51"/>
<rectangle x1="1.651" y1="1.9558" x2="2.159" y2="3.0988" layer="51"/>
<rectangle x1="2.921" y1="1.9558" x2="3.429" y2="3.0988" layer="51"/>
<rectangle x1="4.191" y1="1.9558" x2="4.699" y2="3.0988" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="DIL16" urn="urn:adsk.eagle:package:922/2" type="model" library_version="3">
<description>Dual In Line Package</description>
<packageinstances>
<packageinstance name="DIL16"/>
</packageinstances>
</package3d>
<package3d name="SO16" urn="urn:adsk.eagle:package:821/2" type="model" library_version="3">
<description>Small Outline package 150 mil</description>
<packageinstances>
<packageinstance name="SO16"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="4040" urn="urn:adsk.eagle:symbol:752/1" library_version="3">
<wire x1="-7.62" y1="-17.78" x2="7.62" y2="-17.78" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-17.78" x2="7.62" y2="15.24" width="0.4064" layer="94"/>
<wire x1="7.62" y1="15.24" x2="-7.62" y2="15.24" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="15.24" x2="-7.62" y2="-17.78" width="0.4064" layer="94"/>
<text x="-7.62" y="15.875" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-20.32" size="1.778" layer="96">&gt;VALUE</text>
<pin name="Q12" x="12.7" y="-15.24" length="middle" direction="out" rot="R180"/>
<pin name="Q6" x="12.7" y="0" length="middle" direction="out" rot="R180"/>
<pin name="Q5" x="12.7" y="2.54" length="middle" direction="out" rot="R180"/>
<pin name="Q7" x="12.7" y="-2.54" length="middle" direction="out" rot="R180"/>
<pin name="Q4" x="12.7" y="5.08" length="middle" direction="out" rot="R180"/>
<pin name="Q3" x="12.7" y="7.62" length="middle" direction="out" rot="R180"/>
<pin name="Q2" x="12.7" y="10.16" length="middle" direction="out" rot="R180"/>
<pin name="Q1" x="12.7" y="12.7" length="middle" direction="out" rot="R180"/>
<pin name="P1" x="-12.7" y="12.7" length="middle" direction="in" function="dotclk"/>
<pin name="RES" x="-12.7" y="-15.24" length="middle" direction="in"/>
<pin name="Q9" x="12.7" y="-7.62" length="middle" direction="out" rot="R180"/>
<pin name="Q8" x="12.7" y="-5.08" length="middle" direction="out" rot="R180"/>
<pin name="Q10" x="12.7" y="-10.16" length="middle" direction="out" rot="R180"/>
<pin name="Q11" x="12.7" y="-12.7" length="middle" direction="out" rot="R180"/>
</symbol>
<symbol name="PWRN" urn="urn:adsk.eagle:symbol:713/1" library_version="3">
<text x="-1.27" y="-0.635" size="1.778" layer="95">&gt;NAME</text>
<text x="1.905" y="2.54" size="1.27" layer="95" rot="R90">VDD</text>
<text x="1.905" y="-5.842" size="1.27" layer="95" rot="R90">VSS</text>
<pin name="VSS" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="VDD" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="4040" urn="urn:adsk.eagle:component:848/4" prefix="IC" library_version="3">
<description>12-stage binary/ripple &lt;b&gt;COUNTER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="4040" x="15.24" y="0"/>
<gate name="P" symbol="PWRN" x="-5.08" y="0" addlevel="request"/>
</gates>
<devices>
<device name="N" package="DIL16">
<connects>
<connect gate="A" pin="P1" pad="10"/>
<connect gate="A" pin="Q1" pad="9"/>
<connect gate="A" pin="Q10" pad="14"/>
<connect gate="A" pin="Q11" pad="15"/>
<connect gate="A" pin="Q12" pad="1"/>
<connect gate="A" pin="Q2" pad="7"/>
<connect gate="A" pin="Q3" pad="6"/>
<connect gate="A" pin="Q4" pad="5"/>
<connect gate="A" pin="Q5" pad="3"/>
<connect gate="A" pin="Q6" pad="2"/>
<connect gate="A" pin="Q7" pad="4"/>
<connect gate="A" pin="Q8" pad="13"/>
<connect gate="A" pin="Q9" pad="12"/>
<connect gate="A" pin="RES" pad="11"/>
<connect gate="P" pin="VDD" pad="16"/>
<connect gate="P" pin="VSS" pad="8"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:922/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="D" package="SO16">
<connects>
<connect gate="A" pin="P1" pad="10"/>
<connect gate="A" pin="Q1" pad="9"/>
<connect gate="A" pin="Q10" pad="14"/>
<connect gate="A" pin="Q11" pad="15"/>
<connect gate="A" pin="Q12" pad="1"/>
<connect gate="A" pin="Q2" pad="7"/>
<connect gate="A" pin="Q3" pad="6"/>
<connect gate="A" pin="Q4" pad="5"/>
<connect gate="A" pin="Q5" pad="3"/>
<connect gate="A" pin="Q6" pad="2"/>
<connect gate="A" pin="Q7" pad="4"/>
<connect gate="A" pin="Q8" pad="13"/>
<connect gate="A" pin="Q9" pad="12"/>
<connect gate="A" pin="RES" pad="11"/>
<connect gate="P" pin="VDD" pad="16"/>
<connect gate="P" pin="VSS" pad="8"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:821/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="Arduino-clone" deviceset="NANO" device=""/>
<part name="U$2" library="mychips" deviceset="28C64" device="SLOT"/>
<part name="IC1" library="40xx" library_urn="urn:adsk.eagle:library:80" deviceset="4040" device="D" package3d_urn="urn:adsk.eagle:package:821/2"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="165.1" y="71.12" smashed="yes" rot="R180"/>
<instance part="U$2" gate="G$1" x="116.84" y="66.04" smashed="yes"/>
<instance part="IC1" gate="A" x="73.66" y="66.04" smashed="yes">
<attribute name="NAME" x="66.04" y="81.915" size="1.778" layer="95"/>
<attribute name="VALUE" x="66.04" y="45.72" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="N$3" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D1"/>
<pinref part="U$1" gate="G$1" pin="D3"/>
<wire x1="154.94" y1="78.74" x2="137.16" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D3"/>
<pinref part="U$1" gate="G$1" pin="D5"/>
<wire x1="154.94" y1="73.66" x2="137.16" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D4"/>
<pinref part="U$1" gate="G$1" pin="D6"/>
<wire x1="154.94" y1="71.12" x2="137.16" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D5"/>
<pinref part="U$1" gate="G$1" pin="D7"/>
<wire x1="154.94" y1="68.58" x2="137.16" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D6"/>
<pinref part="U$1" gate="G$1" pin="D8"/>
<wire x1="154.94" y1="66.04" x2="137.16" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D7"/>
<pinref part="U$1" gate="G$1" pin="D9"/>
<wire x1="154.94" y1="63.5" x2="137.16" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="137.16" y1="53.34" x2="149.86" y2="53.34" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="_OE"/>
<wire x1="149.86" y1="53.34" x2="149.86" y2="40.64" width="0.1524" layer="91"/>
<wire x1="149.86" y1="40.64" x2="190.5" y2="40.64" width="0.1524" layer="91"/>
<wire x1="190.5" y1="40.64" x2="190.5" y2="63.5" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A0"/>
<wire x1="190.5" y1="63.5" x2="187.96" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="ACLK" class="0">
<segment>
<pinref part="IC1" gate="A" pin="P1"/>
<wire x1="60.96" y1="78.74" x2="60.96" y2="83.82" width="0.1524" layer="91"/>
<wire x1="60.96" y1="83.82" x2="88.9" y2="83.82" width="0.1524" layer="91"/>
<wire x1="88.9" y1="83.82" x2="88.9" y2="78.74" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="A1"/>
<wire x1="88.9" y1="78.74" x2="96.52" y2="78.74" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="D12"/>
<wire x1="154.94" y1="55.88" x2="152.4" y2="55.88" width="0.1524" layer="91"/>
<label x="152.4" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="ARST" class="0">
<segment>
<pinref part="IC1" gate="A" pin="RES"/>
<wire x1="60.96" y1="50.8" x2="58.42" y2="50.8" width="0.1524" layer="91"/>
<label x="58.42" y="50.8" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="D11"/>
<wire x1="154.94" y1="58.42" x2="152.4" y2="58.42" width="0.1524" layer="91"/>
<label x="152.4" y="58.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="VSS" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="VSS"/>
<pinref part="U$1" gate="G$1" pin="GND2"/>
<wire x1="137.16" y1="91.44" x2="154.94" y2="83.82" width="0.1524" layer="91"/>
<wire x1="154.94" y1="83.82" x2="167.64" y2="83.82" width="0.1524" layer="91"/>
<wire x1="167.64" y1="83.82" x2="172.72" y2="88.9" width="0.1524" layer="91"/>
<junction x="154.94" y="83.82"/>
<pinref part="U$1" gate="G$1" pin="GND"/>
<wire x1="172.72" y1="88.9" x2="187.96" y2="88.9" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="_CS1"/>
<wire x1="96.52" y1="43.18" x2="116.84" y2="43.18" width="0.1524" layer="91"/>
<wire x1="116.84" y1="43.18" x2="116.84" y2="81.28" width="0.1524" layer="91"/>
<wire x1="116.84" y1="81.28" x2="137.16" y2="91.44" width="0.1524" layer="91"/>
<junction x="137.16" y="91.44"/>
<label x="144.78" y="88.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D0"/>
<wire x1="137.16" y1="81.28" x2="142.24" y2="81.28" width="0.1524" layer="91"/>
<wire x1="142.24" y1="81.28" x2="147.32" y2="76.2" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D4"/>
<wire x1="147.32" y1="76.2" x2="154.94" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D2"/>
<wire x1="137.16" y1="76.2" x2="144.78" y2="76.2" width="0.1524" layer="91"/>
<wire x1="144.78" y1="76.2" x2="149.86" y2="81.28" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="D2"/>
<wire x1="149.86" y1="81.28" x2="154.94" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VDD" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="5.5V"/>
<wire x1="187.96" y1="83.82" x2="193.04" y2="86.36" width="0.1524" layer="91"/>
<label x="193.04" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="VCC"/>
<wire x1="96.52" y1="91.44" x2="91.44" y2="96.52" width="0.1524" layer="91"/>
<label x="91.44" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q2"/>
<pinref part="U$2" gate="G$1" pin="A10"/>
<wire x1="86.36" y1="76.2" x2="96.52" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q3"/>
<pinref part="U$2" gate="G$1" pin="A11"/>
<wire x1="86.36" y1="73.66" x2="96.52" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q4"/>
<pinref part="U$2" gate="G$1" pin="A9"/>
<wire x1="86.36" y1="71.12" x2="96.52" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q7"/>
<pinref part="U$2" gate="G$1" pin="A8"/>
<wire x1="86.36" y1="63.5" x2="96.52" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q5"/>
<pinref part="U$2" gate="G$1" pin="A6"/>
<wire x1="86.36" y1="68.58" x2="96.52" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q6"/>
<pinref part="U$2" gate="G$1" pin="A7"/>
<wire x1="86.36" y1="66.04" x2="96.52" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q12"/>
<pinref part="U$2" gate="G$1" pin="A12"/>
<wire x1="86.36" y1="50.8" x2="96.52" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q11"/>
<pinref part="U$2" gate="G$1" pin="A5"/>
<wire x1="86.36" y1="53.34" x2="96.52" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q10"/>
<pinref part="U$2" gate="G$1" pin="A4"/>
<wire x1="86.36" y1="55.88" x2="96.52" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q8"/>
<pinref part="U$2" gate="G$1" pin="A3"/>
<wire x1="86.36" y1="60.96" x2="96.52" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q9"/>
<pinref part="U$2" gate="G$1" pin="A2"/>
<wire x1="86.36" y1="58.42" x2="96.52" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="IC1" gate="A" pin="Q1"/>
<wire x1="86.36" y1="78.74" x2="86.36" y2="81.28" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="A0"/>
<wire x1="86.36" y1="81.28" x2="96.52" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="_WE"/>
<wire x1="137.16" y1="55.88" x2="147.32" y2="55.88" width="0.1524" layer="91"/>
<wire x1="147.32" y1="55.88" x2="147.32" y2="45.72" width="0.1524" layer="91"/>
<wire x1="147.32" y1="45.72" x2="193.04" y2="45.72" width="0.1524" layer="91"/>
<wire x1="193.04" y1="45.72" x2="193.04" y2="66.04" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A1"/>
<wire x1="193.04" y1="66.04" x2="187.96" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D13"/>
<wire x1="187.96" y1="50.8" x2="187.96" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
