filename = "Data.xlsx";
data = readtable(filename,'TextType','string');
head(data);
data.film_name = categorical(data.film_name);

cvp = cvpartition(data.film_name,'Holdout',0.2);
dataTrain = data(training(cvp),:);
dataValidation = data(test(cvp),:);

customStopWords = (["," "." ";" ":" ":)" "↵" "(" ")" "!" "'" "^" "#" "%" "/" "{" "}" "[" "]" "?" "\" "$" "-" "_" "|" "acaba" "ama" "ancak" "artık" "asla" "aslında" "az" "bana" "bazen" "bazı" "bazıları" "bazısı" "belki" "ben" "beni" "benim" "beş" "bile" "bir" "birçoğu" "birçok" "birçokları" "biri" "birisi" "birkaç" "birkaçı" "bir" "şey" "bir" "şeyi" "biz" "bize" "bizi" "bizim" "böyle" "böylece" "bu" "buna" "bunda" "bundan" "bunu" "bunun" "burada" "bütün" "çoğu" "çoğuna" "çoğunu" "çok" "çünkü" "da" "daha" "de" "değil" "demek" "diğer" "diğeri" "diğerleri" "diye" "dolayı" "elbette" "enfakat" "falan" "felan" "filan" "gene" "gibi" "hangi" "hangisi" "hani" "hatta" "hem" "henüz" "hep" "hepsi" "hepsine" "hepsini" "her" "her" "biri" "herkes" "herkese" "herkesi" "hiç" "hiç" "kimse" "hiçbiri" "hiçbirine" "hiçbirini" "için" "içinde" "ile" "ise" "işte" "kaç" "kadar" "kendi" "kendine" "kendini" "ki" "kim" "kime" "kimi" "kimin" "kimisi" "madem" "mı" "mi" "mu" "mü" "nasıl" "ne" "ne" "kadar" "ne" "zaman" "neden" "nedir" "nerde" "nerede" "nereden" "nereye" "nesi" "neyse" "niçin" "niye" "ona" "ondan" "onlar" "onlara" "onlardan" "onların" "onu" "onun" "orada" "oysa" "oysaki" "öbürü" "ön" "önce" "ötürü" "öyle" "sana" "sen" "senden" "seni" "senin" "siz" "sizden" "size" "sizi" "sizin" "son" "sonra" "şayet" "şey" "şimdi" "şöyle" "şu" "şuna" "şunda" "şundan" "şunlar" "şunu" "şunun" "tabi" "tamam" "tüm" "tümü" "üzere" "var" "ve" "veya" "veyahutya" "ya" "da" "yani" "yerine" "yine" "yoksa" "zaten" "zira" "aa" "aaa" "aaah" "aah" "abe" "abes" "abo" "abosa" "abu" "acaba" "acayip" "accelerando" "acele" "aceleten" "acep" "acimasiz" "acimasizcasina" "acilen" "aciz" "acizane" "ac" "acik" "acikcasi" "aciktan" "adamakilli" "adamcasina" "adedi" "adeta" "adina" "adilane" "afedersin" "afedersinin" "aferin" "affettuoso" "agitato" "agucuk" "agababa" "agabey" "agir" "agizdan" "ah" "aha" "ahacik" "ahbap" "aheste" "ahir" "ahiren" "ahlaken" "ailecek" "ait" "akabinde" "akibet" "akilane" "aklen" "aklinca" "aksine" "aksamdan" "aksamlari" "aksamleyin" "aksamustu" "aksamuzeri" "alabildigine" "alarga" "alelacele" "alelhesap" "alelhusus" "alelitlak" "alelumum" "alelusul" "alem" "alenen" "alessabah" "aleykumselam" "alicenap" "alimallah" "alimane" "allahtan" "allegretto" "allegro" "alo" "alti" "altinci" "altisar" "altmis" "ama" "amabile" "aman" "amanin" "amca" "amenna" "amin" "amirane" "amma" "ana" "anafordan" "anal" "anasil" "anbean" "anca" "ancak" "andante" "andantino" "aninda" "ani" "aniden" "anif" "animato" "anlasilan" "ansizin" "antrparantez" "apacik" "apak" "apansiz" "apansizin" "apartopar" "aport" "appassionato" "aptal" "aptalcasina" "araciligiyla" "aralikta" "arasira" "ardarda" "ardinca" "ardindan" "arifane" "ariyeten" "arkadan" "arkadasca" "arkaustu" "ars" "artik" "asabi" "asaleten" "asil" "asla" "aslen" "aslinda" "asagi" "asik" "asikane" "asiri" "asikare" "askin" "atbasi" "atfen" "atmis" "atmisar" "atmisinci" "avantadan" "avara" "ay" "ayakta" "ayakustu" "ayakuzeri" "aybeay" "ayi" "ayik" "aylarca" "aylik" "aynen" "ayniyla" "ayol" "ayri" "ayrica" "ayriyeten" "az" "azade" "azicik" "azimkarane" "baci" "badehu" "badema" "bahar" "bahusus" "bakarak" "bakimindan" "bakindi" "baliklama" "baliksirti" "banko" "bari" "basbayagi" "basmakalip" "basbasa" "basibos" "baska" "baskasi" "baslibasina" "basta" "bastan" "bastanbasa" "basustune" "batsat" "bayagi" "bayan" "baygin" "bayramustu" "bayramuzeri" "bazan" "bazen" "bazi" "bazisi" "be" "bebek" "bebekce" "bedaheten" "bedava" "bedavadan" "bedavasina" "bedavaya" "bedenen" "begayet" "behemehal" "behey" "belesten" "beli" "belirgin" "belki" "bembeyaz" "ben" "bence" "bencileyin" "benimki" "beraber" "beraberce" "berabere" "beraberinde" "bereket" "berenari" "beri" "beriki" "bermutat" "bertafsil" "bertaraf" "besbelli" "besmelesiz" "bes" "beser" "besinci" "besyuz" "beybaba" "beyhude" "beyninde" "bezgin" "bildir" "bicimli" "bihaber" "bihakkin" "biilac" "bikes" "bilahare" "bilaistisna" "bilakis" "bilasebep" "bilavasita" "bilcumle" "bile" "bilerek" "bilfarz" "bilfiil" "bilhassa" "bililtizam" "bilistifade" "billahi" "bilmukabele" "bilmunasebe" "bilvasita" "bin" "binaen" "binaenaleyh" "biner" "bininci" "binnetice" "binyil" "bip" "biperva" "bir" "birader" "birara" "birarada" "biraz" "birazcik" "birazdan" "birbiri" "bircogu" "bircok" "birden" "birdenbire" "birer" "birgun" "biri" "birileri" "birinci" "birkac" "birkaci" "birlikte" "birtakim" "bis" "bismillah" "bitevi" "biteviye" "bittabi" "biz" "bizar" "bizatihi" "bizce" "bizcileyin" "bizimki" "bizzat" "bodoslama" "bodoslamadan" "bolca" "bonjur" "bos" "bosuna" "boyca" "boylamasina" "boyuna" "boyunca" "bonce" "boyle" "boylece" "boylecene" "boylelikle" "boylesi" "boylesine" "bravo" "bre" "bu" "budalacasina" "bugun" "bugunden" "bugunluk" "bulanik" "bunca" "bunlar" "buracikta" "burada" "buradan" "bunyece" "busbutun" "butunuyle" "caba" "cabadan" "cahilane" "cana" "candan" "canigonulden" "caniyurekten" "caniyane" "canli" "cansiparane" "capcanli" "carcar" "carcur" "cartadak" "cartadan" "cebren" "ceffelkalem" "ceman" "cesur" "cesurane" "cetbecet" "cevaben" "cik" "ciliz" "cis" "cicoz" "cidden" "ciddi" "cihangirane" "cihetiyle" "cismen" "cuk" "cumbadak" "cumburlop" "cumhurca" "cuppadak" "cumle" "cumlesi" "cumleten" "cabucacik" "cabucak" "cabuk" "cakirkeyif" "caktirmadan" "calak" "calakalem" "calakamci" "calakasik" "calakilic" "calakurek" "calyaka" "cap" "capkin" "capraz" "caprazlama" "caprazlamasina" "caprazvari" "carcabuk" "carnacar" "carpik" "cekinik" "cengucaganak" "cepcevre" "cepecevre" "ceyrek" "cildirasiya" "cilgincasina" "cinsabah" "cirilciplak" "cinko" "cocukca" "cocuksu" "cogu" "cogun" "cogunlukla" "cok" "cokbilmis" "cokca" "coklari" "cokluk" "coklukla" "coktandir" "cogunlukla" "cokkun" "cunki" "cunku" "cus" "da" "dadas" "dah" "daha" "dahasi" "dahi" "dahice" "dahil" "dahilen" "dahiyane" "daim" "daima" "dair" "dakika" "dakikalarca" "dakikasinda" "dalgin" "dalginlikla" "dalgunduz" "dalkavukca" "dalkilic" "dalogle" "dalya" "damsiz" "dandini" "dangadak" "dangalakca" "dar" "davetsiz" "dayali" "dayi" "de" "dede" "defaatle" "defalarca" "defaten" "degil" "degin" "deh" "dehset" "dehsetli" "dek" "dekresendo" "delice" "delicesine" "delikanli" "dembedem" "demek" "demin" "demincek" "denli" "derakap" "derece" "derhal" "derinden" "derinlemesine" "derinligine" "derken" "dervisane" "destur" "destursuz" "desturun" "devam" "devre" "devren" "deyyus" "disari" "digeri" "dikey" "dikine" "dikkat" "dikkatli" "diklemesine" "dimdik" "diminuendo" "dince" "dinc" "dinen" "direkt" "diye" "dogaclama" "dogactan" "dogallikla" "dogru" "dogrudan" "dogrusu" "dogustan" "doksan" "doksanar" "doksaninci" "dokuz" "dokuzar" "dokuzuncu" "dolayi" "dolayisiyla" "doludizgin" "domuzuna" "dosdogru" "dostane" "doyasiya" "dorder" "dorduncu" "dort" "dortnala" "durmadan" "duyguca" "dun" "dunden" "dunyada" "dupeduz" "durzu" "dut" "duzgun" "e" "ebediyen" "edepli" "edepsizcesine" "edibane" "efece" "efendi" "efendim" "efsus" "eger" "egreti" "egri" "eh" "ekseri" "ekseriya" "ekseriyetle" "ekstra" "elaman" "elan" "elbet" "elbette" "elden" "elektriksiz" "elele" "elhak" "elhamdulillah" "elhasil" "eliyle" "elli" "ellinci" "elliser" "elveda" "emaneten" "emprovize" "en" "enayicesine" "encok" "ender" "enikonu" "enlemesine" "epey" "epeyce" "epeydir" "epeyi" "epeyice" "er" "erden" "ergec" "erken" "erkence" "erkenden" "esasen" "eskaza" "eskiden" "esnasinda" "estagfurullah" "esekce" "eskin" "etrafli" "etraflica" "evce" "evcek" "evelallah" "evet" "evvel" "evvela" "evvelce" "evvelden" "evvelemirde" "evvelleri" "ey" "eyvah" "ezberden" "ezbere" "ezcumle" "ezercesine" "ezik" "ezkaza" "fakat" "falan" "falanca" "faraza" "farzimahal" "farzimuhal" "fasih" "fatihane" "fayrap" "fazla" "fazladan" "fazlasiyla" "fena" "fertik" "fesuphanallah" "fir" "firdolayi" "fistiki" "fitraten" "fiilen" "fikren" "filan" "filhakika" "filvaki" "fonda" "fondip" "fora" "forte" "fortepiano" "fortissimo" "fucceten" "gafilane" "gah" "gahi" "galiba" "garanti" "garip" "gavurcasina" "gayet" "gayetle" "gayri" "gayri" "gece" "geceleri" "geceleyin" "gec" "gece" "gecende" "gecenlerde" "gelgelelim" "gelisiguzel" "gene" "genelde" "genellikle" "gepgenc" "gercekte" "gercekten" "gerci" "geregince" "gerek" "gerekse" "geri" "gerisingeri" "gerisingeriye" "gevsek" "girla" "giyaben" "giyabinda" "gibi" "gibilerden" "gibisinden" "giderayak" "giderek" "gidi" "gine" "gitgide" "gittikce" "gizli" "gonlunce" "gore" "gorunurde" "gorunurlerde" "gorunuste" "goturu" "gucun" "guc" "gucbela" "guclukle" "gumbedek" "gunasiri" "gunaydin" "gunbegun" "gunde" "gunduz" "gunduzleri" "gunduzleyin" "gunduzun" "gunlerce" "gunubirligine" "gunubirlik" "gupegunduz" "gurpedek" "guya" "guzel" "guzelim" "guzellikle" "guzun" "ha" "haa" "habire" "hacmen" "haddizatinda" "hadi" "hadisene" "hafazanallah" "hafif" "hafiften" "hafta" "haftalarca" "hah" "hain" "haincesine" "hakeza" "hakikat" "hakikaten" "hakimane" "hakimane" "hakkinda" "hakkiyla" "hala" "halbuki" "halen" "halihazirda" "halisane" "haliyle" "hamdolsun" "hamilen" "handiyse" "hangi" "hangisi" "hanimanne" "hani" "hapur" "harfiyen" "haricen" "haric" "harika" "harrangurra" "hart" "hartadak" "hasbelkader" "hasebiyle" "hasmane" "hassaten" "hasa" "hasa" "hasin" "hatta" "havadan" "hay" "hayalen" "haybeden" "hayda" "haydi" "haydin" "haydindi" "haydisene" "hayfa" "hayhay" "hayif" "hayir" "hayli" "hayret" "hayretle" "hayrola" "haysiyetiyle" "haza" "hazir" "hazret" "he" "helalinden" "hele" "hem" "hemen" "hemencecik" "henuz" "hep" "hepsi" "hepten" "her" "herbiri" "herhalde" "herkes" "herzaman" "hey" "heyetiyle" "heyhat" "himhim" "hincahinc" "hink" "hizla" "hizli" "hic" "hicbir" "hicbiri" "hicten" "hilkaten" "his" "hist" "hitaben" "Hm" "Hmm" "hodbehot" "hop" "hoppadak" "hoppala" "hos" "hoscakal" "host" "hoyrat" "host" "hot" "hu" "hukuken" "hurra" "husumetkar" "hususuyla" "hucum" "hukmen" "hulasa" "hulasaten" "hur" "hurmeten" "hurmetkarane" "hurya" "ih" "issiz" "ibne" "icabinda" "iceri" "icin" "icinde" "icre" "icten" "ictenlikle" "idareten" "igrenc" "ihtimal" "ihtiyaten" "iken" "iki" "ikinci" "ikindi" "ikindileri" "ikindiustu" "ikindiuzeri" "ikindiyin" "ikiser" "iktisaden" "ila" "İlahi" "ilanen" "ilanihaye" "ilaveten" "ile" "ilelebet" "ileri" "ileride" "iliskin" "ilk" "ilkbahar" "ilkin" "ilkonce" "ilkten" "illa" "illaki" "illallah" "ille" "imdat" "imdi" "inadina" "incecikten" "indinde" "insaf" "insallah" "iptida" "iptidalari" "irsen" "irticalen" "isabet" "ise" "ismen" "isnaden" "ister" "istinaden" "iste" "istiraken" "ithafen" "itibaren" "itibariyla" "itogluit" "ivedi" "ivedilikle" "iyi" "iyicene" "iyilikle" "izafeten" "kabaca" "kabala" "kablelmilat" "kac" "kacak" "kacta" "kadar" "kafadan" "kaffesi" "kafi" "kafir" "kah" "kahrolsun" "kainat" "kala" "kalben" "kalender" "kamera" "kamilen" "kanaliyla" "kanunen" "kanunen" "kapkara" "kararlamadan" "kardes" "kargatulumba" "karsi" "karsillikli" "karsin" "kaskati" "kasten" "katbekat" "kategorik" "kati" "katiyen" "katiyetle" "katrilyon" "katrilyonar" "katrilyonuncu" "kavi" "kazaen" "kazara" "kefaleten" "kemakan" "kendi" "kendiligimizden" "kendiliginden" "kendiliginizden" "kendiliklerinden" "kendince" "kendinden" "kendisince" "kentilyon" "kerhen" "kesin" "kesinkes" "kesinlikle" "kesmece" "kestirmeden" "keske" "keski" "keyfince" "keza" "kicustu" "kilicina" "kirgin" "kirk" "kirkar" "kirkinci" "kirkyil" "kisa" "kisacasi" "kiskivrak" "kismen" "kismet" "kis" "kisin" "kitlama" "kiyasen" "kiyasiya" "kiz" "ki" "kim" "kimi" "kimileyin" "kimisi" "kimse" "kolay" "kolaycacik" "kolayda" "kolaylikla" "kolektif" "kolkola" "kosa" "koyu" "koftehor" "kopekoglu" "kopoglu" "korcesine" "korkutuk" "korlemeden" "kotu" "kudretten" "kulaktan" "kurban" "kuvvetle" "kulhani" "kulliyen" "kuskutuk" "kuttedek" "laakal" "lacerem" "laf" "lafzen" "lahavle" "lahzada" "lakayit" "lakin" "lala" "lan" "lanet" "lappadak" "larghetto" "largo" "larp" "larpadak" "laubaliyane" "lava" "layikiyla" "lebalep" "lebbeyk" "legato" "lento" "levendane" "loppadak" "lupten" "lutfen" "lutufkarane" "maada" "maaile" "maalesef" "maalmemnuniye" "maatteessuf" "maazallah" "maddeten" "madem" "mademki" "maestoso" "magrurane" "magrurcasina" "mahcubane" "mahcup" "mahfuzen" "mahiye" "mahkûmane" "mahsuben" "mahsus" "mahsusen" "mahzunane" "malca" "malen" "malulen" "malum" "mamafih" "manen" "mantiken" "manyak" "marifetiyle" "mars" "masumane" "masallah" "mayna" "mealen" "mebni" "mecazen" "mecburen" "meccanen" "mecnunane" "medet" "meger" "megerki" "megerse" "melfufen" "melul" "memnun" "memnuniyetle" "mepsuten" "merdane" "merhaba" "merhameten" "mesabesinde" "mesela" "mestane" "mesudane" "mesruten" "metazori" "mevkufen" "mezzo" "mi" "mi" "milim" "milyar" "milyarar" "milyarinci" "milyon" "milyonar" "milyonuncu" "minnettarane" "minnos" "miskalle" "miskinane" "mizacen" "monser" "moralman" "motamot" "mu" "muahharen" "muhakkak" "muhtasaran" "muhtemelen" "mukabil" "mukaddema" "muntazam" "muntazaman" "muslihane" "mutlak" "mutlaka" "muttasil" "muvacehesinde" "muvakkaten" "muzafferane" "mu" "mubarek" "mudellel" "muebbeden" "mujde" "mukafaten" "mukemmel" "mukemmelen" "mukerreren" "munasebetiyle" "munferiden" "munhasiran" "muphem" "mureffehen" "mustacelen" "mustakilen" "mustehzi" "mustemirren" "musteniden" "mustesna" "mustereken" "muteakiben" "muteakip" "mutemadi" "mutemadiyen" "muteneffir" "mutenekkiren" "muteselsilen" "muteveccihen" "muthis" "muttefikan" "muttehiden" "nacizane" "nadir" "nadiren" "nafile" "nagehan" "nah" "nakden" "nakis" "naklen" "nakzen" "namaglup" "namina" "namutenahi" "nasil" "nasilsa" "nasi" "nazaran" "nazarinda" "nazikane" "nazmen" "ne" "neden" "nedeniyle" "nedense" "nere" "nerede" "nereden" "neredeyse" "neresi" "nereye" "nesi" "nesren" "neticeten" "nevmit" "neyleyim" "neyse" "nezaketen" "nezdinde" "nice" "nicin" "nihayet" "nihayetinde" "nine" "ninni" "nispet" "nispeten" "nispetle" "nite" "nitekim" "niye" "nobetlese" "numerik" "o" "oburcasina" "of" "ogul" "oh" "oha" "olamaz" "olasiya" "oldu" "oldukca" "ole" "oley" "on" "onalti" "onaltinci" "onar" "onbes" "onbesinci" "onca" "onculayin" "ondorduncu" "ondort" "onlar" "onlarca" "onuncu" "onuc" "onucuncu" "oo" "oof" "ooo" "oracikta" "orada" "oradan" "oral" "oraya" "orsa" "ortada" "ortaklasa" "ortalamasina" "ortalikta" "Osmanlica" "otomatikman" "otuz" "otuzar" "otuzuncu" "oy" "oysa" "oysaki" "obur" "oburku" "oburu" "of" "ogleleri" "oglende" "oglenleri" "oglenleyin" "ogleustu" "ogleuzeri" "ogleyin" "oho" "olduresiye" "olesiye" "olum" "olumune" "omrubillah" "once" "onceden" "onceleri" "oncelikle" "onunden" "oof" "ornegin" "ote" "oteki" "otekisi" "oturu" "oyle" "oylelikle" "oylemesine" "oylesi" "oylesine" "oz" "ozcesi" "ozellikle" "palaspandiras" "paraca" "pas" "patadak" "pattadak" "pattadan" "paydos" "pederane" "pehlivanane" "pehpeh" "pek" "pekala" "peki" "pekiyi" "peltek" "perhizkar" "pes" "pesin" "pesinen" "peyapey" "peyderpey" "peygamberane" "peygambervari" "pezevenk" "pirt" "pir" "pist" "piyano" "pof" "poh" "pratikte" "presto" "psikolojikman" "puf" "pust" "purdikkat" "Rabbena" "raddelerinde" "ragmen" "rahat" "rahatcana" "rahatlikla" "rahim" "rahvan" "rappadak" "rapten" "rastgele" "resen" "resmen" "retrospektif" "rindane" "riyakarane" "riyasiz" "ruhen" "ruzuseb" "saadetle" "saatlerce" "sabah" "sabaha" "sabahlari" "sabahleyin" "sabahtan" "sabirla" "sade" "sadece" "sadikane" "safcasina" "safi" "safiyane" "saglam" "saglicakla" "sagliginiza" "sahi" "sahiden" "sakin" "salimen" "salise" "salisen" "sallapati" "salt" "samimi" "samimiyetle" "sanatkarane" "saniye" "sanki" "sapasaglam" "sarahaten" "sargin" "sarhos" "sarmasdolas" "sayesinde" "sayica" "sebebiyle" "sefihane" "sefil" "sefilane" "sehven" "sek" "sekiz" "sekizer" "sekizinci" "seksen" "seksener" "sekseninci" "selamunaleykum" "sen" "seneye" "serapa" "serbest" "sereserpe" "seri" "serian" "serinkanli" "sermestane" "sersefil" "sert" "sesli" "sessiz" "seyrek" "seyyanen" "sifir" "sifirar" "sifirinci" "sik" "sikca" "siki" "simsicak" "simsiki" "sinirsiz" "sirasinda" "sirasiyla" "sirf" "sirtustu" "sivirya" "siftah" "silik" "silme" "sittinsene" "siyaseten" "siz" "soguk" "sokulu" "son" "sonbahar" "sonra" "sonradan" "sonralari" "sonunda" "sozde" "sozgelimi" "sozgelisi" "spontane" "sucustu" "sularinda" "suphanallah" "sureta" "suskun" "suspus" "susuz" "suratle" "surekli" "surgit" "sahsen" "sakaciktan" "sakadan" "sakkadak" "sakkadanak" "sakrak" "sapadanak" "sappadak" "sarkadak" "sasi" "sayet" "seklen" "seran" "simarik" "sippadak" "sirakkadak" "sifahen" "simdi" "simdiden" "simdilerde" "simdileyin" "simdilik" "sinanay" "sipsak" "sorolop" "soyle" "soylesine" "su" "sunlar" "suracikta" "surada" "suphesiz" "ta" "taammuden" "taban" "tabanvay" "tabi" "tabiatiyla" "tabii" "tahminen" "tahriren" "takdirde" "takiben" "takkadak" "takriben" "tallahi" "tam" "tamam" "tamamen" "tamamiyla" "tamamiyle" "taptaze" "tarafindan" "tarihen" "tastamam" "tatli" "tatlilikla" "tatsiz" "teberruken" "tedbiren" "tedricen" "tedviren" "tek" "tekduze" "tekiden" "tekmil" "tekrar" "tekraren" "telmihen" "temiz" "temsilen" "tepetakla" "tepetaklak" "tepeustu" "terbiyesizcesine" "tercihan" "tercihen" "tersine" "terutaze" "tesadufen" "tesadufi" "teslim" "tevfikan" "teyze" "tez" "tezelden" "tibben" "tikabasa" "tingadak" "tipatip" "tipki" "top" "toptan" "topu" "topyekûn" "tos" "toskuru" "transit" "trilyon" "trilyonar" "trilyonuncu" "tu" "tuh" "tuhaf" "tutturabildigine" "tuu" "tuuu" "tu" "tuh" "tukenik" "tum" "tumden" "tumu" "tumuyle" "tunaydin" "Turkcesi" "tuu" "tuuu" "ucuzuna" "uf" "ufaklik" "ugrun" "ugrunda" "ulan" "uluorta" "umum" "umumiyetle" "upuzun" "usangin" "uslu" "ustalikla" "usturuplu" "usul" "usulca" "usulcacik" "usuldan" "usulen" "usulunce" "uyarinca" "uysal" "uz" "uzadiya" "uzaktan" "uzun" "uzunlamasina" "uc" "ucer" "ucuncu" "uf" "ustadane" "ustat" "ustelik" "ustten" "ustune" "ustunkoru" "uzere" "uzerinde" "uzerine" "uzre" "vah" "vahsiyane" "vaktinde" "vaktiyle" "vaktizamaninda" "vallaha" "vallahi" "varda" "vasitasiyla" "vay" "ve" "vehleten" "vekaleten" "velakin" "velet" "velev" "velhasil" "velhasilikelam" "veresiye" "verevine" "vesselam" "veya" "veyahut" "vicahen" "vicdanen" "vira" "viya" "voyvo" "vurtut" "ya" "yaa" "yaaa" "yahey" "yahu" "yahut" "yakin" "yakinda" "yakindan" "yakinlarda" "yakinen" "yalanciktan" "yalandan" "yalapsap" "yalinayak" "yallah" "yalniz" "yalnizca" "yamyassi" "yan" "yana" "yanasik" "yaninda" "yanisira" "yani" "yanlamasina" "yanlis" "yanlislikla" "yapayalniz" "yapyakin" "yaradilistan" "yari" "yarimsar" "yarin" "yasa" "yasasin" "yavas" "yavascacik" "yaya" "yayan" "yazik" "yazin" "yedi" "yedinci" "yediser" "yegen" "yekdigeri" "yekpare" "yekten" "yekvucut" "yenge" "yengecvari" "yeni" "yeniden" "yenilerde" "yepyeni" "yerinde" "yerine" "yeterince" "yetmis" "yetmiser" "yetmisinci" "yevmiye" "yillarca" "yilligina" "yisa" "yine" "yirmi" "yirminci" "yirmiser" "yo" "yok" "yoksa" "yoluyla" "yoo" "yonelik" "yuf" "yuh" "yuha" "yukari" "yukaridan" "yumusakca" "yurekten" "yuz" "yuzbeyuz" "yuzbin" "yuzbinlerce" "yuzer" "yuzgeri" "yuzukoyun" "yuzuncu" "yuzunden" "yuzustu" "yuzyil" "yuzyuze" "zahir" "zahirde" "zahiren" "zalimane" "zamaninda" "zararina" "zarfinda" "zarifane" "zaten" "zati" "zecren" "zimnen" "zimninda" "zingadak" "zippadak" "zihnen" "zilzurna" "zinhar" "zira" "ziyadesiyle" "zor" "zoraki" "zorla" "zorlukla"]);

textDataTrain = dataTrain.comment;
textDataValidation = dataValidation.comment;
YTrain = dataTrain.film_name;
YValidation = dataValidation.film_name;

textDataTrain = lower(textDataTrain);
textDataValidation = lower(textDataValidation);%küçük harf yaptık

str = strrep( textDataTrain, 'ç', 'c' );
str = strrep( str, 'ğ', 'g' );
str = strrep( str, 'ı', 'i' );
str = strrep( str, 'ö', 'o' );
str = strrep( str, 'ş', 's' );
str = strrep( str, 'ü', 'u' );
documents = tokenizedDocument(str);
textDataTrain = removeWords(documents,customStopWords);

str = strrep( textDataValidation, 'ç', 'c' );
str = strrep( str, 'ğ', 'g' );
str = strrep( str, 'ı', 'i' );
str = strrep( str, 'ö', 'o' );
str = strrep( str, 'ş', 's' );
str = strrep( str, 'ü', 'u' );
documents = tokenizedDocument(str);
textDataValidation = removeWords(documents,customStopWords);


documentsTrain = DocumentsText(textDataTrain);
documentsValidation = DocumentsText(textDataValidation);

documentsTrain(1:5)

enc = wordEncoding(documentsTrain); % içindeki kelimelerden bir kelime kodlaması oluşturur documents.

documentLengths = doclength(documentsTrain);

sequenceLength = 65;
XTrain = doc2sequence(enc,documentsTrain,'Length',sequenceLength);
XTrain(1:5);


XValidation = doc2sequence(enc,documentsValidation,'Length',sequenceLength);

inputSize = 1;
embeddingDimension = 50;
numHiddenUnits = 90; %Gizli katman sayısı 

numWords = enc.NumWords;
numClasses = numel(categories(YTrain));

layers = [ ...
    sequenceInputLayer(inputSize) %Bir dizi giriş katmanı oluşturuyor
    wordEmbeddingLayer(embeddingDimension,numWords)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    dropoutLayer(0.2)
    lstmLayer(numHiddenUnits,'OutputMode','sequence')
    dropoutLayer(0.2)
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer]

options = trainingOptions('adam', ...
    'MaxEpochs',5, ...
    'MiniBatchSize',96, ...
    'GradientThreshold',2, ...
    'Shuffle','every-epoch', ...
    'ValidationData',{XValidation,YValidation}, ...
    'Plots','training-progress', ...
    'Verbose',false); %çıktı mesajlarının ayrıntı düzeyini kontrol eder.

net = trainNetwork(XTrain,YTrain,layers,options);
modelP = classify(net,XValidation);
modelPerformans = modelStatistics(YValidation, modelP);
egitimKumesi = net;
save egitimKumesi












