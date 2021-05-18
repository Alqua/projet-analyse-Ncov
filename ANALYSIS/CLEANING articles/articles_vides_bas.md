# Liste d’articles présent dans la liste d’articles téléchargés mais ne contenant pas de texte en chinois.

Après avoir nettoyé mes articles de toutes lettres de l’alphabet et chiffres, certains articles se sont révélés être vide. L’hypothèse la plus probable est qu’il y ait eu un problème lors de la sauvegarde de l’archive, ce qui laisse la possibilité de retrouver l’article depuis le lien original. Une autre possibilité est qu’il y ait eu un problème directement lors de l’envoi du lien, par exemple lorsqu’un article se trouve derrière un paywall, ce qui ne nous laisse pas d’autre choix que de les supprimer avant l’analyse.
J’indique ci-dessous la décision prise par rapport à ces articles : supprimé ou copié/collé le texte et une raison possible du problème.
Supprimés (id) : 266, 833, 1202, 3113, 3114, 3130, 3660, 3716
Récupérés par copié/collé (id): 1639, 2326, 2331, 2333

Id : 266 title :  菲律宾出现境外首个新冠肺炎死亡病例 逝者为44岁武汉观光客
Caixin behind paywall / archive.org empty
	Supprimé

Id: 833 title: 作家方方：武汉人仍处在关键的时候
Lien original fonctionne et lien sur archive.org fonctionne
MAIS le contenu est différent de l’un à l’autre. De plus, le titre de la base de données ne correspond pas non plus à une des deux versions.
	Supprimé

Id :1202 title : 口罩机紧俏无现货 生产企业加紧排产
Lien original : Caixin derrière un paywall. Lien sur archive.today : 504 gateway timed-out
	Supprimé

Id: 1639 title: 脆弱的疫区养老院：看似封闭的空间，无孔不入的病毒
Lien original: erreur 404 (supprimé ou censure). Lien sur archive.org et terminus2049 semble fonctionner
	Copié, collé dans le fichier.

Id : 2326 title : 重症武汉，重新呼吸 (nanfang zhoumo)
Lien original : fonctionne normalement. Lien sur une archive n’existe pas. 
	Copié, collé dans le fichier.

Id :2331 title : 口罩的 “非常 ”加法：日产量或将两亿 ，仍会短缺还是饱和？ (nanfang zhoumo)
Lien original : fonctionne normalement. Lien sur une archive n’existe pas.
	Copié, collé dans le fichier.


Id :2333 title : “蝗虫大军”暂时不来了，这些乌龙与真相仍要警惕  (nanfang zhoumo)
Lien original : fonctionne normalement. Lien sur une archive n’existe pas.
	Copié, collé dans le fichier.

Id : 3113 title : 江山不幸诗家也没幸
Lien original : supprimé ou censuré. Lien sur une archive n’existe pas
	Supprimé

Id : 3114 title : 江山娇，你中考加分了吗？
Lien original : supprimé ou censuré. Lien sur une archive n’existe pas
	Supprimé

Id : 3130 title : 听金刚经也睡不着的日子
Lien original : supprimé ou censuré. Lien sur une archive n’existe pas
	Supprimé

Id :3660 title : 冬天来了，春天还会远吗？
Lien original :arrive sur login weibo. Lien sur une archive n’existe pas
	Supprimé

Id : 3716意大利怎么了（2）2020年3月2日
Lien original :besoin d’un compte weibo pour accéder au contenu. Lien sur une archive n’existe pas
	Supprimé


# Liste d’articles problématiques après une première extraction de sujet

Après avoir effectué une analyse de sujets avec python, je me suis rendu compte que ma base de données d’articles comprenait encore des erreurs. En effet, un des articles sélectionnés comme le plus représentatif d’un sujet était en russe. J’avais déjà filtré les articles des lettres de l’alphabet et de la plupart des caractères spéciaux mais je n’avais pas pensé à filtrer les caractères russes ou ukrainiens. Des articles en japonais subsistent encore aussi. Nous pourrions filtrer les textes pour garder uniquement les caractères chinois mais cette manière transforme le japonais en caractère chinois aléatoire amenant ainsi du bruit dans la base de données mais rendant aussi leur détection plus difficile. J’ai donc opté pour un nouveau filtrage des articles en supprimant les caractères russes, ukrainiens et quelques caractères spéciaux encore présent.

Ces articles désormais vides sont les suivant (id) : 3198, 3287, 4154, 4242, 4244, 4245, 4246, 4247, 4248, 4251, 4252, 4253, 4254, 4255, 4256, 4257, 4258, 4259, 4260, 4261, 4262. 
Nous allons voir s’il est possible de récupérer le contenu de ceux-ci :
(note : nous avons pu récupérer tous les textes cette fois)
3198 韩国日增确诊三连降！新增创13天来最低，15家药企与疫情赛跑
Lien original ok. Lien sur archive.today en russe
	Copié/collé

3287停摆45天后，武汉为出租车复运做准备，恢复后需实名乘车
Lien original ok. Lien sur archive.today en russe.
	Copié/collé

4154 旅欧中国留学生的艰难回国路
Lien sur archive.today sur la censure à Singapour, pas encore détecté à cause de caractères spéciaux.
	Copié/collé

4242 插曲：怎样捍卫国家利益和民族利益
Lien original sur weibo, besoin de s’inscrire pour lire. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé


4244 一个“深喉”引发的冤案与…… 
Lien original sur weibo, besoin de s’inscrire pour lire. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4245战幕徐徐开启
Lien original sur weibo, besoin de s’inscrire pour lire. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4246 武汉保卫战：从错失战机、惨烈退守到逆转反攻（一）
Lien original sur weibo pas de droit de lire :抱歉，你暂时没有这篇头条文章的查看权限 
错误码:100005. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4247 就疫情预警防线失守的文章答读者问
Lien original sur weibo, besoin de s’inscrire pour lire. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4248解读|争议新冠无症状感染者：为何不并入确诊统计
Lien original sur caixin, paywall. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé
4251无症状感染比例有多大？多项研究透露“冰山一角”
Lien original sur weixin (caijing)ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé


4252 无症状感染者为何不纳入确诊病例？官方回应来了
Lien original sur yicai ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4253 刑满释放确诊人员可离开武汉？
Lien original sur yicai ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4254 独家|首个北京分流国际航班仅19人返京，八成旅客被留呼和浩特隔离
Lien original sur yicai ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4255 独家 | 武汉不明原因肺炎已做好隔离 检测结果将第一时间对外公布

Lien original sur yicai ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4256一财现场直击武汉肺炎事发海鲜批发市场，商户仍在正常营业
Lien original sur yicai ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé
	
4257 独家|武汉肺炎病原检测正在进行 中国已具备最危险病毒研究条件
Lien original sur yicai ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4258 多图直击武汉肺炎事发海鲜批发市场，有人不在意有人担心
Lien original sur yicai ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé


4259 作家方方：所有的疑问，都无人回应
Lien original sur le bloc de fangfang sur caixin ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4260作家方方：野火烧不尽，春风吹又生
Lien original sur le bloc de fangfang sur caixin ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4261直击英国缓疫策略：9天进入“拖延期”，ICU严重不足，暂不检测轻症患者
Lien original weixin ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4262疫情对美国的冲击将会比中国更大 | 巴伦独家
Lien original weixin ok. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

Après avoir parcouru les liens, il est facile de conclure ce qu’il s’est passé. Il s’agit pour la plupart d’un problème d’encodage lors du téléchargement. Maintenant, parcourons un peu nos textes pour voir si nous trouvons d’autres textes à problème.
Il en reste quelques-uns, voyons plutôt : 207, 212, 214, 215, 221, 1611, 3862
Ceux-ci sont correctes : 207, 212, 214, 215, 221. Ils contiennent simplement le même début provenant de leur mise-en-page. Le contenu semble correct.

1611 “封城”后还到武汉拉客，确诊司机获刑一年
Lien original ok. Lien sur archive.today est de la pub pour itunes.
	Copié/collé



3862 以口罩为诱饵花式获客、疫区延期还款难落地，用户难逃消费金融“新套路”
Lien original ok. Lien sur archive.today sur Robert Goebbels, opinion sur le parlement européens, encodage corrompu, résultant à des caractères grecs dans la base de données
	Copié/collé

A nouveau 446, 4249, 4250
446 疫情之下，快手里守望时刻
Lien weixin ok. Lien original contient des commentaires sur des mangas japonais.
	Copié/collé

4249 武汉一小区出现“无症状感染者”，核酸检测“两阴一阳”
Lien original infzm besoin de s’inscrire pour lire. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé

4250 出院病人：评估专家的压力，未决的艰难康复
Lien original infzm besoin de s’inscrire pour lire. Lien sur archive.today ok (Problème d’encodage à un moment donné).
	Copié/collé


# Liste d’articles vide après une mise à niveau de data.csv

Après avoir fini mes analyses lda, j’ai remarqué que le tableau utilisé n’était pas tout à fait à jour, il manquait quelques données par rapport à une dernière version en ligne. J’ai donc relancé ma fonction pour télécharger les articles manquants. Cette fois, je l’ai fait en linux ce qui a enlevé tous problème d’encodage. J’ai rajouté Sys.sleep(1) pour mettre un délai d’une seconde entre les téléchargements et j’ai contacté le webmaster d’archive.today qui a ajouté mon IP à sa whitelist.
C’est d’ailleurs ce que j’aurai dû faire dès le début.
Après le téléchargement, le nettoyage avec deux scripts python, le script checkfiles.py indique ces fichiers comme ne contenant aucun caractère. En vérifiant sur le tableau ceux-ci ne contiennent pas de lien archive.org et ont été supprimés. Impossible donc de les récupérer.
Voici la liste des IDs :
['4881.txt', '4882.txt', '4883.txt', '4884.txt', '4885.txt', '4886.txt', '4887.txt', '4888.txt', '4889.txt', '4890.txt', '4891.txt', '4892.txt', '4893.txt', '4894.txt', '4895.txt', '4896.txt', '4898.txt', '4899.txt', '4900.txt', '4901.txt', '4902.txt']


# Articles au nombre de caractères bas.
Après avoir calculé le nombre de caractères par articles, certains articles présentent un nombre de caractère étonnamment bas : 731, 927, 1903, 2028, 2138, 3101, 3102, 3121, 3261, 3315, 3317, 3505, 3922, 4241, 4307, 4317. 
Copié/collé : 731, 927, 2138, 3317, 3505, 4241
Ok :1903,2028, 3101, 3102, 3121, 3261, 3315, 3922, 4317
Supprimé : 4307

731 有序复工与做好防疫，一个都不能少！
Lien original weixin ok. Lien sur archive.today hors-sujet (dumb scientist)
	Copié/collé


927 武汉情况“很难说正在变好”，重症确诊真的收治完成了吗？以及其他 38 条疫情新闻
Lien original weixin supprimé. Lien sur archive.org cassé. Troisième lien sur un google doc comprenant d’autres documents. L’article en question est très court sur le nombre de cas en Chine. En dessous, se trouve un des liens sur d’autres articles, font-ils parties de l’article ou non (non). Peut-être que l’original était plus long ? Difficile à dire. Dans le doute, je le garde (partie courte).
	Copié/collé

1903 我不明白
Lien original supprimé. Lien sur archive.today ok. Contenu est un poème très court
	Article ok, rien à faire

2028文旅部提醒：切勿前往美国旅游
Lien original weixin ok. Lien archive.today ok. Contenu très court.
	Article ok, rien à faire

2138 “柏林可能封城或部分封城”

Lien original weixin ok. Lien archive.today contient un texte en allemand.
	Copié/collé

3101 青山一道，同担风雨！
Lien original weixin ok. Lien archive.today ok. Texte très court, beaucoup d’images.
	Article ok, rien à faire

3102 控制灵魂对自由的渴望
Lien original weixin ok. Lien archive.today ok. Texte très court, image.
	Article ok, rien à faire

3121 出天门记
Lien original weixin ok. Lien archive.today ok. Images.
	Article ok, rien à faire

 3261留言版 ：发 的人
Lien original weixin ok. Lien archive.today ok. Image.
	Article ok, rien à faire

3315武汉一社区用环卫车运送平价肉，2人被免职
Article posté en tant qu’image sur les deux Liens, plutôt court, déjà OCR puis copié/collé parce que traduit.
	Article ok, rien à faire

3317 湖北潜江的小龙虾提前“复工”了
Lien original ok, Lien archive.today spam en allemand
	Copié/collé

3505 2万品牌在天猫上“战疫力”爆表！逆势增长100%
Lien original ok. Lien archive.today corrompu (go-fuck-yourself.com)
	Copié/collé




3922 不明白
Lien original ok. Lien archive.today ok. Le texte a été posté en image, il reste un petit texte avant. Le mieux serait d’ocr le texte mais je n’ai pas assez de temps.
	Rien fait

4241 海外疫区里的中国留学生：要学位，还是保命？
Lien original ok. Lien sur archive.today ok
	Copié/collé

4307武大人民医院一消化科医生感染新冠  曾接诊无症状感染者（更新）
Lien original derrière caixin paywall. Lien sur archive.today complètement vide.
	Supprimé

4317 “保持距离，无人生还”
Lien original ok. Lien archive.today ok. Articles contient des photos de marques pratiquant la distanciation sociale
	Article ok, rien à faire

Conclusion : Nous avons trouvé quelques articles problématiques mais la majorité ne présente pas de problème particulier. Il s’agit souvent d’images. Nous arrêtons donc la vérification ici.
