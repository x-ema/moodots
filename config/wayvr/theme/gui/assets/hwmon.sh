#! /bin/bash
wayvrctl panel-modify hwmon startbutton set-visible 0
echo $(env) > /tmp/wayvr-env.txt
while :
do

	json="$(amd-smi monitor -g 0 --json)"
	gpuUsageVal="$(jq -r '.[0].gfx.value' <<< "$json")"
	gpuUsageUnit="$(jq -r '.[0].gfx.unit'  <<< "$json")"
	gpuUsageText="GPU: ${gpuUsageVal}${gpuUsageUnit}"

	gpuVramVal="$(jq -r '.[0].vram_used.value' <<< "$json")"
	gpuVramUnit="$(jq -r '.[0].vram_used.unit'  <<< "$json")"

	gpuVramTotalVal="$(jq -r '.[0].vram_total.value' <<< "$json")"
	gpuVramTotalUnit="$(jq -r '.[0].vram_total.unit'  <<< "$json")"
	gpuVramText="VRAM: ${gpuVramVal}${gpuVramUnit}/${gpuVramTotalVal}${gpuVramTotalUnit}"

	gpuHotspotVal="$(jq -r '.[0].hotspot_temperature.value' <<< "$json")"
	gpuHotspotUnit="$(jq -r '.[0].hotspot_temperature.unit'  <<< "$json")"
	gpuHotspotText="JUNC: ${gpuHotspotVal}°${gpuHotspotUnit}"

	gpuMemVal="$(jq -r '.[0].memory_temperature.value' <<< "$json")"
	gpuMemUnit="$(jq -r '.[0].memory_temperature.unit'  <<< "$json")"
	gpuMemText="MEM: ${gpuMemVal}°${gpuMemUnit}"

	top="$(top -b -n 1 | head -14 | tail -16 | awk '{print $9," | " $10, " | "$11 " | ", $12}')"

	tctl="$(sensors k10temp-pci-00c3 | awk '/Tctl:/ {gsub("\\+","",$2); print $2}')"
	tctlText="TCTL: ${tctl}"
	echo $gpuVramText
	echo $gpuUsageText
	echo $gpuHotspotText
	echo $gpuMemText
	echo $tctlText 
	{
	echo "panel-modify hwmon vram set-text \"$gpuVramText\""
	echo "panel-modify hwmon gpu set-text \"$gpuUsageText\""
	echo "panel-modify hwmon junc set-text \"$gpuHotspotText\""
	echo "panel-modify hwmon mem set-text \"$gpuMemText\""
	echo "panel-modify hwmon tctl set-text \"$tctlText\""
} | wayvrctl batch
	sleep 2;
done


