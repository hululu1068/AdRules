#!/bin/sh
LC_ALL='C'
AA="Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_2 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8H7 Safari/6533.18.5 Quark/2.4.2.986"
rm *.txt
rm -rf md5 tmp
wait
# Create temporary folder
mkdir -p ./tmp/
cd tmp

# Start Download Filter File
echo 'Downloading...'
easylist_lite=(  
  #xinggsf (乘风 视频过滤规则)
  "https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt" 
  #damengzhu
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt" 
  #Noyllopa NoAppDownload
  "https://raw.githubusercontent.com/Noyllopa/NoAppDownload/master/NoAppDownload.txt" 
  #china
  "https://filters.adtidy.org/extension/ublock/filters/224.txt" 
  #cjx
  "https://raw.githubusercontent.com/cjx82630/cjxlist/master/cjx-annoyance.txt"
  #anti-anti-ad
  "https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt"
  #"https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
  #"https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt"
  #秋风のとおり道
  "https://raw.githubusercontent.com/TG-Twilight/AWAvenue-Ads-Rule/main/AWAvenue-Ads-Rule.txt"
  #ublock-filters-ulist-youtube
  "https://raw.githubusercontents.com/91ajames/ublock-filters-ulist-youtube/main/blocklist.txt"
)

easylist=( 
  #Clean Url (用于绕过一些网站的重定向/跟踪器)
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs%20for%20uBo/clear_urls_uboified.txt" 
  #privacy(国外主流网站)
  "https://filters.adtidy.org/extension/ublock/filters/3_optimized.txt"
  #english opt(国外主流网站)
  "https://filters.adtidy.org/extension/ublock/filters/2_optimized.txt"
  #EasyList官方
  "https://easylist.to/easylist/easylist.txt"
  #EasyList privacy
  "https://easylist.to/easylist/easyprivacy.txt"
  #anti-AD easylist
  "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-easylist.txt"
)

easylist_plus=(
  #ubo annoyance
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt"
  #ubo privacy
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt"
  #adg base
  "https://filters.adtidy.org/windows/filters/2.txt"
  #adg phone
  "https://filters.adtidy.org/windows/filters/11.txt"
  #adg privacy
  "https://filters.adtidy.org/windows/filters/3.txt"
  #adg cn
  "https://filters.adtidy.org/windows/filters/224.txt"
  #adg annoyance
  "https://filters.adtidy.org/windows/filters/14.txt"
  #adg social
  "https://filters.adtidy.org/windows/filters/4.txt"
  #adg URL
  "https://filters.adtidy.org/windows/filters/17.txt"
)

dns=(
  #Ultimate Ad Filter (横幅、弹窗)(适合浏览器扩展)
  #"https://filters.adavoid.org/ultimate-ad-filter.txt"
  #Ultimate Privacy Filter （移动端隐私过滤）(终极隐私过滤器)
  #"https://filters.adavoid.org/ultimate-privacy-filter.txt"
  #秋风のとおり道 (@AWAvenue收集整理)
  "https://raw.githubusercontent.com/TG-Twilight/AWAvenue-Ads-Rule/main/AWAvenue-Ads-Rule.txt"
  #AdGuard 社交媒体过滤器 （适合国外网站）
  #"https://filters.adtidy.org/windows/filters/4.txt"
  #Annoying (!适合桌面端)
  #"https://filters.adtidy.org/windows/filters/14.txt"
  #"https://easylist-downloads.adblockplus.org/fanboy-annoyance.txt"
  #Mobile Ads (国内适配差)
  #"https://filters.adtidy.org/windows/filters/11.txt"
  #EasyList + AdGuard English filter # 英语网站
  #"https://filters.adtidy.org/windows/filters/2.txt"
  #EasyList China+EasyList
  #"https://easylist-downloads.adblockplus.org/easylistchina+easylist.txt"
  #"https://filters.adtidy.org/windows/filters/224.txt"
  #Fuck Tracking （主打隐私、跟踪）
  #"https://easylist-downloads.adblockplus.org/easyprivacy.txt"
  #"https://filters.adtidy.org/windows/filters/3.txt"
  #anti-coin （!误杀icon）
  #"https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"
  #scam
  "https://raw.githubusercontent.com/durablenapkin/scamblocklist/master/adguard.txt"
  #damengzhu (主要去除色情悬浮广告)
  #"https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt"
  #adgk
  #"https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt"  # 长期未更新了
  #xinggsf (乘风 视频过滤规则)
  #"https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt" 
  #uBO （!提取误差大）
  #"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt" 
  #"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt" 
  #"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt"
  #"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt"
  #cjx
  #"https://raw.githubusercontent.com/cjx82630/cjxlist/master/cjx-annoyance.txt" #提取误差大、太多误杀了
  #anti-anti-ad
  "https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt"
  #"https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
  #"https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt"
  #HostsVN (常见广告及跟踪，国外网站居多)
  #"https://raw.githubusercontent.com/bigdargon/hostsVN/master/filters/adservers-all.txt"
  #Smart-TV
  "https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV-AGH.txt"
  ### 自用添加 ↓ ###
  #KoolProxy规则
  #"https://github.com/ilxp/koolproxy/blob/main/rules/koolproxy.txt" #静态规则、不定时更新
  "https://raw.githubusercontent.com/ilxp/koolproxy/main/rules/daily.txt"
  "https://github.com/ilxp/koolproxy/blob/main/rules/adg.txt"
  #"https://github.com/ilxp/koolproxy/blob/main/rules/adgk.txt"
  #"https://github.com/ilxp/koolproxy/blob/main/rules/yhosts.txt"
  #"https://github.com/ilxp/koolproxy/blob/main/rules/steven.txt"
  #乘风 广告过滤规则 (下方已合并)
  #"https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/rule.txt"
  #"https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt"
  #HalfLife吧 (合并自乘风视频广告过滤规则、EasylistChina、EasylistLite、CJX'sAnnoyance)
  "https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad.txt"
  #AdditionalFiltersCN (适合浏览器扩展)
  #"https://raw.githubusercontent.com/Crystal-RainSlide/AdditionalFiltersCN/master/CN.txt"
  #AdGuard DNS (AdGuard Base filter, Social media filter, Tracking Protection filter, Mobile ads filter, EasyList, EasyPrivacy, etc)
  "https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt"
  #GoodbyeAds-YouTube(可能误杀)
  #"https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Formats/GoodbyeAds-YouTube-AdBlock-Filter.txt"
  #anti-AD easylist
  "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-adguard.txt"
  #Peter Lowe's List (国外网站居多)
  #"https://pgl.yoyo.org/adservers/serverlist.php?hostformat=adblockplus&showintro=1&mimetype=plaintext"
)

hosts=(
  #adaway 官方的去广告 Host 规则
  "https://adaway.org/hosts.txt"
  #ad-wars（大圣净化 | 针对国内视频）
  "https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts"
  #anti-windows-spy (针对Windows)
  #"https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt"
  #Notarck-Malware (恶意软件、网络钓鱼或广告软件的域)
  "https://gitlab.com/quidsup/notrack-blocklists/-/raw/master/malware.hosts"
  #hostsVN (主要针对国外网站)
  #"https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts"
  #StevenBlack (误杀多)
  #"https://raw.githubusercontent.com/StevenBlack/hosts/master/data/StevenBlack/hosts"
  #URLHANS (国外网站)
  #"https://urlhaus.abuse.ch/downloads/hostfile/"
  #SomeoneNewWhoCares (国外域名居多)
  #"https://someonewhocares.org/hosts/zero/hosts"
  #Spam404 (国外域名居多)
  #"https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt"
  ### 自用添加 ↓ ###
  #neodevhost
  #"https://raw.githubusercontent.com/neodevpro/neodevhost/master/host"
  #Yhosts规则 (国内、移动端|更新慢)(包含track)
  #"https://raw.githubusercontent.com/VeleSila/yhosts/master/hosts.txt"
  #StevenBlack/hosts (全球主流主机)
  #"https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
)



for i in "${!easylist[@]}" "${!easylist_lite[@]}" "${!easylist_plus[@]}" "${!hosts[@]}" "${!dns[@]}" 
do
  curl --parallel --parallel-immediate -k -L -C - -o "easylist${i}.txt" --connect-timeout 30 -s "${easylist[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "plus-easylist${i}.txt" --connect-timeout 30 -s "${easylist_plus[$i]}"  &
  curl --parallel --parallel-immediate -k -L -C - -o "lite-easylist${i}.txt" --connect-timeout 30 -s "${easylist_lite[$i]}"  &
  curl --parallel --parallel-immediate -k -L -C - -o "dns${i}.txt" --connect-timeout 30 -s "${dns[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "hosts${i}.txt" --connect-timeout 30 -s "${hosts[$i]}" &
done
wait

echo 'Finish'

# 添加空格
file="$(ls|sort -u)"
for i in $file; do
  echo -e '\n\n\n' >> $i &
done
wait

# Start Merge and Duplicate Removal

echo Start Merge

#Normal | 处理普通的adblock规则
cat .././mod/rules/adblock-rules.txt easylist*.txt lite-*.txt \
 | grep -Ev "^((\!)|(\[)).*" | grep -Pv "^(@@)?\|\|[a-z]*(?:(?!\^|\/|\$).)*$" \
 | grep -P '^[@|\[\]~#$:/a-z0-9.*]' | grep -Pv '^\.[a-z0-9]*\^$' \
 | sort -n | uniq > tmp-adblock.txt  

#Plus | 处理adblock_plus规则
cat tmp-adblock.txt plus*easylist*.txt \
 | grep -Ev "^((\!)|(\[)).*" | grep -Pv "^(@@)?\|\|[a-z]*(?:(?!\^|\/|\$).)*$" \
 | grep -P '^[@|\[\]~#$:/a-z0-9.*]' | grep -Pv '^\.[a-z0-9]*\^$' \
 | sort -n | uniq > tmp-adblock_plus.txt  

#Lite  | 处理adblock_lite规则
cat .././mod/rules/adblock-rules.txt lite-*.txt \
 | grep -Ev "^((\!)|(\[)).*" | grep -Pv "^(@@)?\|\|[a-z]*(?:(?!\^|\/|\$).)*$" \
 | grep -P '^[@|\[\]~#$:/a-z0-9.*]' | grep -Pv '^\.[a-z0-9]*\^$' \
 | sort -n | uniq > tmp-adblock_lite.txt

#DNS  | 处理dns-list规则、使用/script/rebuilt-dns-list.sh脚本
bash ../script/rebuilt-dns-list.sh
wait

cd ../tmp/
mv ../{dns.txt,hosts.txt,ad-domains.txt} ./
rename 's/^/tmp-/' dns.txt hosts.txt ad-domains.txt
sed -i 's/^\!.*//g' tmp-dns.txt tmp-hosts.txt tmp-ad-domains.txt
sed -i 's/^\#.*//g' tmp-dns.txt tmp-hosts.txt tmp-ad-domains.txt
sed -i '/^$/d' tmp-dns.txt tmp-hosts.txt tmp-ad-domains.txt
rm -f ../{dns.txt,hosts.txt,ad-domains.txt}

# Move to Pre Filter | 移动到预处理/pre文件夹下
cd ../
mkdir -p ./pre/
cp ./tmp/tmp-*.txt ./pre
cd ./pre


# Start Add title and date | 添加标题和时间
diffFile="$(ls|sort -u)"
for i in $diffFile; do
 python .././script/rule.py $i
 n=`cat $i | wc -l` 
 echo "! Version: $(TZ=UTC-8 date +'%Y-%m-%d %H:%M:%S')(GMT+8) " >> tpdate.txt 
 new=$(echo "$i" |sed 's/tmp-//g') 
 echo "! Total count: $n" > $i-tpdate.txt 
 cat ./tpdate.txt ./$i-tpdate.txt ./$i |grep -Ev "^(\|)*(\.)?com(\^)?$" > ./$new 
 rm $i *tpdate.txt 
done

# Add Title and MD5 | 添加标题和MD5值
cd ../
mkdir -p ./md5/
diffFile="$(ls pre |sort -u)"
for i in $diffFile; do
 titleName=$(echo "$i" |sed 's#.txt#-title.txt#') 
 cat ./mod/title/$titleName ./pre/$i | awk '!a[$0]++'> ./$i 
 sed -i '/^$/d' $i 
 md5sum $i | sed "s/$i//" > ./md5/$i.md5 
 perl ./script/addchecksum.pl ./$i &
 iconv -t UTF-8 $i > tmp-$i
 mv -f tmp-$i $i
done
wait
sed -i 's/!/#/g' hosts.txt
rm -rf pre tmp
exit
