-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-08-06 11:55:20
-- 服务器版本： 5.7.16
-- PHP Version: 7.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lsh`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(100, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- 表的结构 `album`
--

CREATE TABLE `album` (
  `id` int(9) NOT NULL,
  `name` varchar(10) NOT NULL COMMENT '用户昵称',
  `title` varchar(30) NOT NULL COMMENT '相册名称',
  `intro` varchar(100) NOT NULL COMMENT '相册介绍',
  `pic` varchar(100) NOT NULL COMMENT '封面照片',
  `click` int(9) NOT NULL DEFAULT '0' COMMENT '点击量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `album`
--

INSERT INTO `album` (`id`, `name`, `title`, `intro`, `pic`, `click`) VALUES
(48, 'Michael', '夏目友人帐', '夏目贵志', '/static/album/upload/夏目友人帐/20170214/thumbnail_19319160680405a5b7d21d513a546862.jpg', 0),
(49, 'Michael', '东京食尸鬼', '金木一', '/static/album/upload/东京食尸鬼/20170216/thumbnail_c0aff5536f9170507b709d3e1c73b94c.jpg', 0),
(50, 'Michael', '海贼王', '这是海贼王相册', '/static/album/upload/海贼王/20170214/thumbnail_44e9f41d719980cfe04f9e85b2b3d95f.jpg', 0),
(51, 'Michael', '火影忍者', '这是火影忍者相册', '/static/album/upload/火影忍者/20170215/thumbnail_88dafae919950f5357e2e5e5bc226436.jpg', 0),
(52, 'Michael', '阴阳师', '这是阴阳师相册', '/static/album/upload/阴阳师/20170214/thumbnail_b7f14778e7150869e6551456d6515a80.jpg', 0),
(53, 'Michael', '风光', '网页背景的材料', '/static/album/upload/风光/20170214/thumbnail_0d396b1583649f041a12a588978b47c9.jpg', 0),
(87, 'Michael', 'sadsad', '随便写点啥1', '/static/album/upload/sadsad/20170216/thumbnail_c2e758ee12655738238152ca6eec91e4.jpg', 0),
(88, 'Michael', '小黄人', '这个是小黄人相册', '/static/album/upload/小黄人/20170627/thumbnail_96bea4b0946ecd688ead7b503a283ff2.jpg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL COMMENT '用户昵称',
  `title` varchar(20) NOT NULL COMMENT '标题',
  `keywords` varchar(32) NOT NULL COMMENT '关键词',
  `intro` varchar(200) NOT NULL COMMENT '描述',
  `pic` varchar(100) NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `click` mediumint(9) NOT NULL DEFAULT '0' COMMENT '点击量',
  `time` int(10) NOT NULL COMMENT '发布时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`id`, `name`, `title`, `keywords`, `intro`, `pic`, `content`, `click`, `time`) VALUES
(1, 'Michael', '爱是最不可以算计的', '爱情', '在同事和朋友中，许多是劝我不嫁的——理由是他有什么好？除了看上去四肢健全，五官端正，还有什么别的明显的优点吗？工作一般般，没有房子，没有存款，没有车，而且在短期内看不到唾手可得的升值前景，你疯了吗？									', '/static/upload/20170207/dd1da3ea3ac3dcddf8ead5305ec9c418.jpg', '<p>										</p><p><span style="font-family: Simsun; font-size: 14px; widows: 1;">&nbsp;&nbsp;在同事和</span><a href="http://www.duwenzhang.com/huati/pengyou/index1.html" style="font-family: Simsun; font-size: 14px; widows: 1; color: rgb(51, 51, 51); text-decoration: none;">朋友</a><span style="font-family: Simsun; font-size: 14px; widows: 1;">中，许多是劝我不嫁的——理由是他有什么好？除了看上去四肢健全，五官端正，还有什么别的明显的优点吗？工作一般般，没有房子，没有存款，没有车，而且在短期内看不到唾手可得的升值前景，你疯了吗？</span><br/></p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　我没疯，我只是想嫁人想疯了。与他的劣势资源相比，我的那些优势资源其实并不能算是优势。我的学历比他高，硕士研究生毕业，但高学历对于要找<a href="http://www.duwenzhang.com/huati/laogong/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">老公</a>的<a href="http://www.duwenzhang.com/huati/nvren/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">女人</a>来说，算优势吗？</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　<a href="http://www.duwenzhang.com/huati/langman/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">浪漫</a>不属于我们，我们的结婚喜宴差得我都不愿意回顾。住在一间半地下室里，夏天只要下雨，我们家就顿成泽国。记得有一天，我一觉醒来，发现我所有的书、甚至结婚证全都漂在水面上。我的房子小到只能摆一张大床和一个电脑桌，最小号的那种。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　我给老公电话，才说一句就哭了。他火速到家，挽起裤腿就铲水，还对我说：“你就在床上呆着，别沾水了。”有他这一句话，我就不哭了，心里刹那间变得亮堂和欢喜起来。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　很快我就走了狗屎运——提职加薪出书挣钱，日子变得轻快起来。我们买了车，在郊区有了房，我<a href="http://www.duwenzhang.com/huati/xihuan/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">开始喜欢</a>大手大脚地花钱，但他却<a href="http://www.duwenzhang.com/huati/xiguan/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">不习惯</a>。但是我花的钱是我自己挣的，他能说什么吗？不能，既然不能就只好闷在心里，闷得<a href="http://www.duwenzhang.com/huati/shijian/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">时间久了</a>，夫妻间的<a href="http://www.duwenzhang.com/huati/ganqing/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">感情</a>就生疏了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　人们更加认为他不配我，说我亏——我还年轻，而且眼看着就要更<a href="http://www.duwenzhang.com/huati/mingli/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">名利</a>双收，我的一本书在畅销排行榜上待了3个月，而且居然还有男性<a href="http://www.duwenzhang.com/huati/zhuiqiu/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">追求者</a>，哭着喊着要和我交往。他<a href="http://www.duwenzhang.com/huati/chenmo/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">更加沉默</a>，把更多的时间花在工作上，那是一份<a href="http://www.duwenzhang.com/huati/pingfan/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">平凡</a>而艰辛的工作，我在电脑上劈里啪啦打一阵子，挣的钱就赶上他忙几个星期的了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　再再然后，忽然所有的人都说我配不上他了——男人是厚积薄发的，他开始走狗屎运，甚至有一天他对我说。他准备去香港，他在他们公司的网站上看到一则招募海外员工的广告，他比照自己的条件，而且打了电话，说只要他这样的，报名就能批——在海外工作，一年的钱比国内两年的还要多。唯一的要求是不能带家属，而且一签最少是5年到8年。中间可以探家。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　我沉默了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　然后是我们都忙，他忙他的，我忙我的，忙到有一天我一阵眩晕——我得了一种罕见的<a href="http://www.duwenzhang.com/huati/shengming/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">危及生命</a>的肿瘤。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　在我治疗期间的一天，他等在拥挤不堪的医院走廊里，假装在看一张报纸，但是我看到<a href="http://www.duwenzhang.com/huati/yanlei/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">他的眼泪</a>早已经把报纸打湿。他有半年的时间没有工作，我们靠积蓄和出租房屋为生，双双住在<a href="http://www.duwenzhang.com/huati/muqin/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">我母亲</a>家。<a href="http://www.duwenzhang.com/huati/mingyun/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">命运</a>仿佛跟我开了一个无比残酷的玩笑——我刹那间<a href="http://www.duwenzhang.com/huati/shiqu/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">失去一切</a>。没有男人会爱我这样的女人，不再年轻，失去健康，丧失工作能力，但是我想活下去，我对他说：“我想活下去。”他看着我，说：“你一定要活下去，要活到很老很老，否则你对不起我，对不起我什么都不干陪着你。”</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　以前我以为没有体面的<a href="http://www.duwenzhang.com/wenzhang/shenghuosuibi/" style="color: rgb(51, 51, 51); text-decoration: none;">生活</a>，没有<a href="http://www.duwenzhang.com/huati/wanmei/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">完美</a>的职业，甚至没有众多的爱，我就活不下去。现在我才知道，事情不是这样的，我可以不买衣服，不化妆，不喝咖啡，但是我要活下去。我就这样苟延残喘着。每当他和我一起出现在医院的走廊，我都能感受到周围的目光——那目光中除了有对我的怜悯，还有对他的同情，我知道人们认为他娶了我，亏了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　我问他，是不是觉得自己亏了，是不是想一走了之？他点头。我大怒，眼睛中泪光点点，我对他说，难道你不娶我，娶别的女人，她就一定不生病吗？就算她不生病，你能保证自己一辈子身体健康不需要别人照顾？生命是需要相互依存的，不能说今天我年轻漂亮，你年少多金，我们在一起就是般配的，明天我有个天灾人祸，或者你有个三长两短，我们就是谁亏了谁，谁欠了谁。如果是这样，感情还有什么<a href="http://www.duwenzhang.com/huati/jiazhi/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">价值</a>？人的一生长着呢，起起落落，哪有那么多便宜的事全让你赶上？</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　他愣住转而笑了，说：“我也是这么想。本来我还以为我多高尚，在你危难之际肯留下来陪你，让你这么一说，好像我不这么做，反倒有些天理难容了。”</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　其实，我知道和我现在相比，他当然更爱我的年轻时代，那个时候我才华横溢，健康充满活力。但是，什么叫爱？如果爱就是截取一个人生命中最灿烂的时光，之后再去寻找新的灿烂，那叫爱吗？</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　现在，我出了院继续正常的生活。但我常常想，如果没有这场灾难，也许我和他早已劳燕分飞，因为我们已经没有在一起的理由了——他去香港可以拿到双倍的薪水，而我也可以像时尚杂志中的<a href="http://www.duwenzhang.com/huati/danshen/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">单身贵妇</a>一样再寻寻觅觅，找一个配得上我身份和收入的男人。但是命运不是这样安排的，它让我懂得生活远不是一场投资游戏，你甚至永远无法知道什么样的男人是配得上你的，因为你不知道命运对你的安排——它可以瞬间使你失去一切，使你没有任何谈判地位，使你配不上任何人，只要那个人四肢健全五官端正。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　我是直到那一刻，付出沉重的不能再沉重的代价，才知道真爱是不可以算计的。如果一个人爱你，他（她）必须爱你的生命，否则，那不叫爱，那叫“醒时同交欢，醉后各分散”，那种爱，虽然时尚，虽然轻快，但是毫无价值，因为你只要如日中天一帆风顺，那种爱就比比皆是俯首可得，就像如果你银行里有几个亿的现金，全世界所有的珠宝商都会为你提供最优质的服务。但是你千万不要破产——如果你破产，哪怕是生意上遇到最小的麻烦，你都会看到最职业的拒绝，依然<a href="http://www.duwenzhang.com/huati/weixiao/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">对你微笑</a>，但是绝对不会再给提供任何服务——他最多是对你说：“我们<a href="http://www.duwenzhang.com/huati/xiangxin/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">相信</a>你有一天一定会再成为我们的客户。”</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　爱与生命一样，需要我们的<a href="http://www.duwenzhang.com/huati/zhenxi/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">珍惜</a>和<a href="http://www.duwenzhang.com/huati/naixin/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">耐心</a>。有的时候，你必须坚持，忍受一些不得不忍受的<a href="http://www.duwenzhang.com/huati/tongku/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">痛苦</a>，然后你才有可能感受到生命的<a href="http://www.duwenzhang.com/huati/xiyue/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">喜悦</a>和<a href="http://www.duwenzhang.com/huati/meihao/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">爱的美好</a>，我真的<a href="http://www.duwenzhang.com/huati/xiwang/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">不希望</a>你像我一样，在付出那么大那么多代价以后，才懂得这一点。</p><p><br/></p><p><br/></p><p>										</p>', 24, 1486438551),
(3, 'Michael', '致青春', '青春', '我不敢说说青春是什么，我只想说青春像什么', '/static/upload/20170207/1c75e962da7787faa435911c5ee7786a.jpg', '<p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp;青春就像一根划燃的火柴，拼命的燃烧，最后只剩下一堆灰烬，风一吹就散了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一支钢笔，不停的书写，直到耗尽最后一滴墨汁，留下的也只是一年一年的<a href="http://www.duwenzhang.com/huati/huiyi/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">回忆</a>。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一个<a href="http://www.duwenzhang.com/" style="color: rgb(51, 51, 51); text-decoration: none;">故事</a>，读的太认真会流<a href="http://www.duwenzhang.com/huati/yanlei/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">眼泪</a>，读的太粗浅又怕<a href="http://www.duwenzhang.com/huati/cuoguo/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">错过</a>了一些<a href="http://www.duwenzhang.com/huati/meihao/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">美好</a>。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一面镜子，藏不住<a href="http://www.duwenzhang.com/huati/xingfu/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">幸福</a>，也藏不住<a href="http://www.duwenzhang.com/huati/beishang/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">悲伤</a>，什么都写在脸上。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一件新衣服，我们总是舍不得穿，当有一天我们想穿的时候，却发现自己已经老了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一阵风，你可以<a href="http://www.duwenzhang.com/huati/ganjue/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">感觉</a>到，却怎么也抓不到。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一道阳光，它可以照到你最悲伤的角落，给你<a href="http://www.duwenzhang.com/huati/wennuan/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">温暖</a>。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一条河，没有淌过的人，永远不知道深浅。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一首歌，有人<a href="http://www.duwenzhang.com/huati/xihuan/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">喜欢</a>扯着嗓子喊，有人喜欢轻轻哼唱，但<a href="http://www.duwenzhang.com/huati/kuaile/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">快乐</a>就好。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一场雨，还来不及打伞就已经停了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一次考试，每个人都是裸考，没有人为青春提前准备什么。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像放风筝，总认为挣断了线才会<a href="http://www.duwenzhang.com/huati/ziyou/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">自由</a>，当有一天线断了被风吹来吹去的时候，才发现有线的时候才是自由。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一部电影，不能缺少的元素是<a href="http://www.duwenzhang.com/wenzhang/aiqingwenzhang/" style="color: rgb(51, 51, 51); text-decoration: none;">爱情</a>。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一滴眼泪，只有当它留下来的时候才知道是怎样的滋味。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一本书，可以写满幸福，也可以写满悲伤，你的青春你做主。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像开玩笑，昨天还那么年轻，今天却已经老了，谁信。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一场游戏，开始的时候没人当真，结束的时候人们骗自己说：“这不是真的我还很年轻。”</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像秋天的叶子，没有人知道它是什么时候凋落的。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一个梦，醒来的时候，只留下涎水的痕迹。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像多雨的天空，雨露在这边蔓延，阳光在那边<a href="http://www.duwenzhang.com/huati/dengdai/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">等待</a>。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一只毛毛虫，只有经历了一些伤痛才能化茧成蝶。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一位倔强的老头，认准了就不回头，哪怕头破血流。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一场舞会，没有找到舞伴的人，注定是<a href="http://www.duwenzhang.com/huati/gudu/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">孤独</a>的。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一场赛跑，只不过最先冲过<a href="http://www.duwenzhang.com/huati/zhongdian/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">终点</a>的人最先输了青春。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一只小狗，总是容易受伤，但是叫几下就没事了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　青春就像一位<a href="http://www.duwenzhang.com/huati/laoshi/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">老师</a>，教会了我们逞强，也教会了我们假装，让我们明白爱过我们的人和<a href="http://www.duwenzhang.com/huati/shanghai/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">伤害</a>过我们的人，都是我们青春的意义。</p><p><br/></p>', 10, 1486449122),
(4, 'Michael', '什么最重要', '生活', '那年，她22岁，是文工团的演员，有两只漂亮的大眼睛和两条修长的腿。她的男友，是一个边防战士，在中苏边境上。追求她的人很多，其中有一个高干子弟，人长得英俊挺拔，亦很有才情，而且，想把她留北京。她动心了，面对外界的诱惑，不动心是假的', '/static/upload/20170207/45fa72243021391647bc40c3da126f57.jpg', '<p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp; &nbsp;那年，她22岁，是文工团的演员，有两只漂亮的大眼睛和两条修长的腿。她的男友，是一个边防战士，在中苏边境上。<a href="http://www.duwenzhang.com/huati/zhuiqiu/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">追求</a>她的人很多，其中有一个高干子弟，人长得英俊挺拔，亦很有才情，而且，想把她留北京。她动心了，面对外界的诱惑，不动心是假的。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　<a href="http://www.duwenzhang.com/wenzhang/aiqingwenzhang/20160710/355492.html" style="color: rgb(51, 51, 51); text-decoration: none;"></a>于是，她想到了<a href="http://www.duwenzhang.com/huati/fenshou/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">分手</a>。正好，那年年底，有去他那个连的慰问演出，她报了名，她要亲口告诉他，别等她了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　是风雪漫漫的夜晚出发的，天寒地冻，到达内蒙古时她已经冻得不行了。但恰在此时，车陷在了泥泞中。天际空旷，四处无人，只有这些演员。男同志极少，为了让车出来，他们四处找石头，然后往泥水里垫，一块石头往往要走很长<a href="http://www.duwenzhang.com/huati/shijian/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">时间</a>才能找到，那时的她看到石头简直比看到金子还要惊喜！</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　当车终于出来时，他们欢呼着！她记得他在信中说过，车常常陷在泥水里面，他们常常去找石头。当时，她<a href="http://www.duwenzhang.com/huati/ganjue/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">感觉</a>那只是一行文字，可现在，她身临其境，突然心酸起来。他来信还告诉她，到这里，少说话，因为风太大，舌头会脱皮，她不信，一直给同志们唱歌鼓劲，结果，舌头果然脱了皮，疼痛难忍。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　到达连队时她首先看到的是十几口大缸。他也曾在信中描述过，这十几口大缸特别壮观，一半是咸菜，一半是水。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　那里离最近的水源也有60千米，所以，他们几个月不洗澡。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　另外的大缸里装着咸菜，他说过，那咸菜，是他们过冬的宝贝！整个冬天，他们就吃咸菜，放点儿香油，味道好极了！</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　在他的信中，从来没有抱怨，有的只是对这里的赞美。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　可到这里她才发现，这里几乎连棵树也没有，飞沙走石，一片荒漠，可在他的信中，却写得这样美。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　他说过，“是因为，我心里有一片风景，是你给我的，因为有你，我觉得这里的一切都是美的。”</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　长河落日，大漠孤烟，如今她都看到了，再看到黑黑瘦瘦的他，一笑，露出洁白的牙齿，分手的话，她没有说出来。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　夜晚风大，天出奇的寒冷，女演员都给了两床被子，她一直以为连队被子多，第二天才知道，为了让她们暖和一些，整个连队拿出了一半被子给她们！而他，根本没有被子，就为了让她更暖和一些！</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　早晨，是她们洗完了脸战士们才洗。早饭，有女演员抱怨太单调——咸菜、粥、馒头，还有一个凉拌菜和一碟花生米。可她明白，这已经是难得了，因为他说过，“我们一天只吃两次饭，因为供给要到200千米以外的地方拉，能吃上咸菜和粥已经不错，没有咸菜的时候，就用馒头蘸着盐水吃。”她去他的屋里，看到了那盆玉树。是当年他来这里当连长时她送给他的，送给他时，只有3片叶，现在，已经二十几片叶子了。他说：“我每天浇水，一看到这盆玉树，就想到你。”</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　他指着一张桌子，那是给她写信的桌子，是他用木头拼成的，4条简易的腿，一张破的三合板，他说：“来回晃，显得字也差，可我是用心写的。”</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　看到她，他说：“当时看到你来我都傻了，好像看到仙女下凡。”说这话的时候，他的脸就红了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　那天晚上，分手的话，她又没有说。此情此景，让她如何说得出口？</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　第二天，文工团去很远的一个地方演出，说是当天晚上还回来住。所有人都知道，他们是一对恋人，所以，团长说，还回来住，多晚也赶回来。可那天晚上他们一直没有消息。因为没有信号，也根本联系不上，风雪越来越大，所有人都说，他们可能不回来了，住在那里了。可是，他说：“他们说过要回来的，我要去找他们。”他知道在沙漠里迷了路有多危险，如果再起了风沙，如果再雨雪交加，生还的可能性极小。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　于是他上路了。而此时的他们，真的迷了路。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　所有人都瑟瑟抖着，在风沙雨雪中，他们的车好像风中断翅的小鸟，车里已经没有多少油了，这一刻，她忽然感觉到了死亡的临近！</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　这一刻，她忽然这样强烈地<a href="http://www.duwenzhang.com/huati/xiangnian/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">想念</a>他！</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　是啊，世界上什么最重要，<a href="http://www.duwenzhang.com/huati/shengming/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">生命</a>！<a href="http://www.duwenzhang.com/wenzhang/aiqingwenzhang/" style="color: rgb(51, 51, 51); text-decoration: none;">爱情</a>！那些名，那些利，那些无所谓的东西能战胜这两样吗？</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　那一刻，她泪流满面，她知道，自己无法割舍他，在生死面前，她终于明白了自己的爱情！</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　冥冥中，她感觉到他会来找他们，是的，他会来的，因为，他们说过晚上见，这个晚上，她准备和他摊牌的。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　女演员们都搂作了一团，以为挺过这一夜就好了，可她知道，过不了这一夜，她们都会被冻死！因为他在信中说过，沙漠中迷了路，千万不能过夜，否则死路一条！</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　于是，她果断地把大衣脱掉，然后找团长要火柴，团长说：“你疯了吗？”</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　她说：“快，来不及了！”</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　大衣很快就被点燃了，熊熊大火燃烧着，而远方的他带着战士已经走了几个小时，油也快耗光了，当他们看到火苗时，他的<a href="http://www.duwenzhang.com/huati/yanlei/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">眼泪</a>就出来了，因为他曾在信中告诉过她，有一次他迷路了，就脱掉了衣服，把衣服点燃，结果，获救了！</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　这些他曾经告诉过她的经验，如今，全用上了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　见面的一刹那，他们再也没顾及是不是所有人都在看他们，疯狂地跑向对方，紧紧地拥抱在一起。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　如今，那棵玉树已经枝繁叶茂，而他们的<a href="http://www.duwenzhang.com/huati/nver/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">女儿</a>，也已经上了小学。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">　　他常常问她：“那次，你是专门去看我的吗？”她就笑着，没有答。她感谢那次生命的苦难，终于让她明白，在离死亡最近时，什么才是最重要的。</p><p><br/></p>', 12, 1486451806),
(5, 'Michael', '滴眼液里的爱情滋味', '爱情', '																		我们一定记得简-爱那句话，“你以为我穷，不好看，就没有感情吗？我们的精神是同等的，就如同你跟我经过坟墓将同样地站在上帝面前。”也许																											', '/static/upload/20170207/a4f8aa9022c0ad6fc68f13b62f4afdba.jpg', '<p>										</p><p><br/></p><p><br/></p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp; &nbsp;我们一定记得简-爱那句话，“你以为我穷，不好看，就没有<a href="http://www.duwenzhang.com/huati/ganqing/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">感情</a>吗？我们的精神是同等的，就如同你跟我经过坟墓将同样地站在上帝面前。”也许，人有贫穷和富有之分，但是<a href="http://www.duwenzhang.com/wenzhang/aiqingwenzhang/" style="color: rgb(51, 51, 51); text-decoration: none;">爱情</a>没有贵贱，无论贫穷的打工仔，还是落破的乞丐，都可以把爱浓缩成那碗浓浓的汤——题记</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 那年，她是公司的白领，常常在电脑前工作，有坐就是十几个小时，所以眼睛干涩疼痛是很正常的事情。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 不知什么时候起，他的手边总有一瓶滴眼液，起初以为是公司发的，后来才发现，只有她一个人有。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 不久她就发现了滴眼液的<a href="http://www.duwenzhang.com/huati/mimi/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">秘密</a>，是公司里的一个勤杂工放的，那个勤杂工只是一个高中毕业的男子。而她是读完了博士的，怎么可能和一个勤杂工<a href="http://www.duwenzhang.com/huati/lianai/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">恋爱</a>？虽然他看起来的确是不错的男人，俊朗的外型，面庞白皙，身材修长，而且做事特别勤奋，她曾看到他去新东方补习<a href="http://www.duwenzhang.com/wenzhang/yingyuwenzhang/" style="color: rgb(51, 51, 51); text-decoration: none;">英语</a>。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 终究，她和他是隔着银河的。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 那一小瓶滴眼液却让她<a href="http://www.duwenzhang.com/huati/wennuan/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">感到温暖</a>，遇到他，她说，谢谢。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 他得羞脸都红了，他说，常常看你揉眼睛，大概是太疲劳了，所以想让你的眼睛不再那么疼。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 听到这句话，她的心疼了一下，没有人对她那么好过，这么仔细地观察过，但是她礼貌地说了一声谢谢就走了，她要把他关在爱情的门外，不给他机会。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 后来她开始恋爱，但还是要用滴眼液，再后来，她做了副总的太太，不用在去上班，滴眼液就不再用了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 她结婚后他也走了，有人说去了深圳，还有人说去了海南，她没有仔细问，因为她觉得那不过是瓶滴眼液而已。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 在过两年，副总提出了<a href="http://www.duwenzhang.com/huati/lihun/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">离婚</a>，说与她的性格不合，她连犹豫都没有就签了字，当初结婚就抱着功利目的，如今离了也许更干脆。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 离婚的她又开始做公司百领。职务更高，做的更苦，眼睛更疼。在疼的时候，她总是下意识地把手伸向右边，那里空空的，没有滴眼液了。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 她的眼睛疼到<a href="http://www.duwenzhang.com/huati/yanlei/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">流眼泪</a>，只好自己开车去买滴眼液，买了好几瓶，一边滴一边流眼泪，她知道不是滴眼液的缘故，因为那里面的苦涩与泪水竟然是同一个味道。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 后来她去南方出差，在一个酒店里与一个男子擦身而过，在转过身的一刹那她叫住了他。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 相隔几年，她几乎认不出他了，当年那个羞涩内向的男子变的这么儒雅大度，旁边提包的一个男子恭敬的叫着老总。他递过名片，那上面的公司吓了她一跳，那是太有名气的一个公司，常常去中央电视台做广告，不过短短<a href="http://www.duwenzhang.com/huati/shijian/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">几年时间</a>啊。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 他们一起去了楼顶花园喝咖啡，她问起当年的滴眼液，他笑，就是你的拒绝让我<a href="http://www.duwenzhang.com/huati/nuli/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">更加努力</a>，因为一个只能给心爱<a href="http://www.duwenzhang.com/huati/nvhai/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">女孩子</a>滴眼液的男子怎么可能赢的爱情？我想，有一天，我会给你所要的一切，比如，车.房子.珠宝.....</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 她静静听着，眼泪差点落下来，她轻轻的说：“难道你不知道，我所有接受过的东西，只有那一瓶小小的滴眼液最有爱情的味道？</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 是啊，那瓶滴眼液里，曾经有最<a href="http://www.duwenzhang.com/huati/danchun/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">单纯的</a>爱情的滋味，只是她<a href="http://www.duwenzhang.com/huati/cuoguo/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">错过了</a>，因为她在爱情里，加上了许多不必要的附加条件。</p><p style="font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; widows: 1;">&nbsp;&nbsp; 而有的时候，爱情其实就那么简单，在你我伸手之间，在小小的不值钱的小东西里，在最初的<a href="http://www.duwenzhang.com/huati/xinling/index1.html" style="color: rgb(51, 51, 51); text-decoration: none;">心灵</a>交汇的刹那。</p><p><br/></p><p><br/></p><p><br/></p><p>										</p>', 32, 1486473712);

-- --------------------------------------------------------

--
-- 表的结构 `diary`
--

CREATE TABLE `diary` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `diary` varchar(256) NOT NULL,
  `time` int(30) NOT NULL,
  `good` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `diary`
--

INSERT INTO `diary` (`id`, `name`, `diary`, `time`, `good`) VALUES
(254, 'Michael', '行政村自行车', 1486351128, 0),
(256, 'Michael', '大概范甘迪发鬼地方', 1486351154, 62),
(303, 'Michael', '胜多负少', 1486368101, 0),
(305, 'Michael', '撒打算打算打打', 1486368185, 3),
(306, 'Michael', '你中兄次之下从自行车自行车你', 1486368663, 1),
(307, 'Michael', '<p>说好的幸福呢！</p>', 1486471796, 1),
(309, 'Michael', '今天是元宵节！', 1486796886, 8),
(310, 'Michael', '<p>素素终于跳了诛仙台！</p>', 1486993602, 6),
(311, 'Michael', '<p>素素跳台，白浅上神复位！<img src="http://img.baidu.com/hi/jx2/j_0005.gif"/></p>', 1486993655, 21),
(312, 'Michael', '今天是二月15', 1487126064, 10),
(331, 'Michael', '再次发表', 1487130092, 2),
(335, 'Michael', '<p>跟老板交代了，心里舒坦了<img src="http://img.baidu.com/hi/jx2/j_0019.gif"/></p>', 1487571762, 2),
(383, 'Michael', 'ajax发布命令完成', 1487676642, 9),
(385, 'Michael', '今天肚子不舒服', 1487763458, 2),
(405, 'Michael', '今天要去看电影《银河护卫队2》', 1493945920, 9),
(406, 'Michael', '今天《加勒比海盗5》正式上映', 1495779029, 2),
(407, 'Michael', '今天是2017年6月7日，星期三', 1496813977, 0);

-- --------------------------------------------------------

--
-- 表的结构 `emp`
--

CREATE TABLE `emp` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `grade` tinyint(4) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `salary` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `emp`
--

INSERT INTO `emp` (`id`, `name`, `grade`, `email`, `salary`) VALUES
(18, '孙悟空', 18, 'shunping@sohu.com', 200),
(19, '胡歌', 35, 'shunping@sohu.com', 20520),
(25, '霍建华', 37, 'shunping@sohu.com', 888),
(30, '王尼玛', 90, 'shunping@sohu.com', 200),
(35, '王八蛋', 8, 'shunping@sohu.com', 55555),
(36, 'j纪晓岚', 111, 'shunping@sohu.com', 200),
(38, 'shunping2', 1, 'shunping@sohu.com', 200),
(39, 'shunping3', 1, 'shunping@sohu.com', 200),
(40, 'shunping4', 1, 'shunping@sohu.com', 200),
(42, 'shunping6', 1, 'shunping@sohu.com', 200),
(43, 'shunping7', 1, 'shunping@sohu.com', 200),
(44, 'shunping', 1, 'shunping@sohu.com', 200),
(45, 'shunping2', 1, 'shunping@sohu.com', 200),
(46, 'shunping3', 1, 'shunping@sohu.com', 200),
(47, 'shunping4', 1, 'shunping@sohu.com', 200),
(48, 'shunping5', 1, 'shunping@sohu.com', 200),
(49, 'shunping6', 1, 'shunping@sohu.com', 200),
(50, 'shunping7', 1, 'shunping@sohu.com', 200),
(51, 'shunping', 1, 'shunping@sohu.com', 200),
(52, 'shunping2', 1, 'shunping@sohu.com', 200),
(53, 'shunping3', 1, 'shunping@sohu.com', 200),
(54, 'shunping4', 1, 'shunping@sohu.com', 200),
(55, 'shunping5', 1, 'shunping@sohu.com', 200),
(56, 'shunping6', 1, 'shunping@sohu.com', 200),
(57, 'shunping7', 1, 'shunping@sohu.com', 200),
(61, 'shunping', 1, 'shunping@sohu.com', 200),
(62, 'shunping2', 1, 'shunping@sohu.com', 200),
(63, 'shunping3', 1, 'shunping@sohu.com', 200),
(64, 'shunping4', 1, 'shunping@sohu.com', 200),
(65, 'shunping5', 1, 'shunping@sohu.com', 200),
(66, 'shunping6', 1, 'shunping@sohu.com', 200),
(67, 'shunping7', 1, 'shunping@sohu.com', 200),
(68, 'shunping', 1, 'shunping@sohu.com', 200),
(69, 'shunping2', 1, 'shunping@sohu.com', 200),
(70, 'shunping3', 1, 'shunping@sohu.com', 200),
(71, 'shunping4', 1, 'shunping@sohu.com', 200),
(72, 'shunping5', 1, 'shunping@sohu.com', 200),
(73, 'shunping6', 1, 'shunping@sohu.com', 200),
(74, 'shunping7', 1, 'shunping@sohu.com', 200),
(75, 'shunping', 1, 'shunping@sohu.com', 200),
(76, 'shunping2', 1, 'shunping@sohu.com', 200),
(77, 'shunping3', 1, 'shunping@sohu.com', 200),
(78, 'shunping4', 1, 'shunping@sohu.com', 200),
(79, 'shunping5', 1, 'shunping@sohu.com', 200),
(80, 'shunping6', 1, 'shunping@sohu.com', 200),
(81, 'shunping7', 1, 'shunping@sohu.com', 200),
(82, 'shunping', 1, 'shunping@sohu.com', 200),
(83, 'shunping2', 1, 'shunping@sohu.com', 200),
(84, 'shunping3', 1, 'shunping@sohu.com', 200),
(85, 'shunping4', 1, 'shunping@sohu.com', 200),
(86, 'shunping5', 1, 'shunping@sohu.com', 200),
(87, 'shunping6', 1, 'shunping@sohu.com', 200),
(88, 'shunping7', 1, 'shunping@sohu.com', 200),
(89, 'shunping', 1, 'shunping@sohu.com', 200),
(90, 'shunping2', 1, 'shunping@sohu.com', 200),
(91, 'shunping3', 1, 'shunping@sohu.com', 200),
(92, 'shunping4', 1, 'shunping@sohu.com', 200),
(93, 'shunping5', 1, 'shunping@sohu.com', 200),
(94, 'shunping6', 1, 'shunping@sohu.com', 200),
(95, 'shunping7', 1, 'shunping@sohu.com', 200),
(96, 'shunping', 1, 'shunping@sohu.com', 200),
(97, 'shunping2', 1, 'shunping@sohu.com', 200),
(98, 'shunping3', 1, 'shunping@sohu.com', 200),
(99, 'shunping4', 1, 'shunping@sohu.com', 200),
(100, 'shunping5', 1, 'shunping@sohu.com', 200),
(101, 'shunping6', 1, 'shunping@sohu.com', 200),
(102, 'shunping7', 1, 'shunping@sohu.com', 200),
(103, 'shunping', 1, 'shunping@sohu.com', 200),
(104, 'shunping2', 1, 'shunping@sohu.com', 200),
(105, 'shunping3', 1, 'shunping@sohu.com', 200),
(106, 'shunping4', 1, 'shunping@sohu.com', 200),
(107, 'shunping5', 1, 'shunping@sohu.com', 200),
(108, 'shunping6', 1, 'shunping@sohu.com', 200),
(109, 'shunping7', 1, 'shunping@sohu.com', 200),
(110, 'shunping', 1, 'shunping@sohu.com', 200),
(111, 'shunping2', 1, 'shunping@sohu.com', 200),
(112, 'shunping3', 1, 'shunping@sohu.com', 200),
(113, 'shunping4', 1, 'shunping@sohu.com', 200),
(114, 'shunping5', 1, 'shunping@sohu.com', 200),
(115, 'shunping6', 1, 'shunping@sohu.com', 200),
(125, 'hsp', 3, 'www.hsp@126.com', 25000),
(126, 'lsgh', 7, 'fdghdfgdf', 33354),
(127, 'lsgh', 7, 'fdghdfgdf', 33354),
(128, 'lsgh', 7, 'fdghdfgdf', 33354),
(129, 'lsgh', 7, 'fdghdfgdf', 33354),
(130, 'lsgh', 7, 'fdghdfgdf', 33354),
(131, 'lsgh', 7, 'fdghdfgdf', 33354),
(132, 'lsgh', 7, 'fdghdfgdf', 33354),
(133, 'lsgh', 7, 'fdghdfgdf', 33354),
(134, 'lsgh', 7, 'fdghdfgdf', 33354),
(135, 'lsgh', 7, 'fdghdfgdf', 33354),
(136, 'jj', 90, 'www.jj@qq.com', 10),
(137, 'libo', 1, 'li@qq.com', 122),
(138, 'gfy', 2, 'www.gfy@qq.com', 1200),
(139, 'gfy', 2, 'www.gfy@qq.com', 1200),
(140, 'gfy', 2, 'www.gfy@qq.com', 1200),
(141, 'gfy', 2, 'www.gfy@qq.com', 1200),
(142, 'liman', 2, '3333', 555),
(143, '海南哥', 4, 'haigege@qq.com', 3333),
(144, '李钊', 1, 'lizhao@qq.com', 10000),
(145, '孙金花', 33, 'sjhua@qq.com', 50000),
(146, '陆陆续', 2, '3423', 132);

-- --------------------------------------------------------

--
-- 表的结构 `personal`
--

CREATE TABLE `personal` (
  `id` int(9) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '用户昵称',
  `realname` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(30) DEFAULT NULL COMMENT '性别',
  `age` int(9) DEFAULT NULL COMMENT '年龄',
  `email` varchar(30) DEFAULT NULL COMMENT '邮件',
  `head` varchar(100) DEFAULT NULL COMMENT '头像',
  `bg` varchar(100) DEFAULT NULL COMMENT '主页背景',
  `motto` varchar(100) DEFAULT NULL COMMENT '座右铭'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `personal`
--

INSERT INTO `personal` (`id`, `name`, `realname`, `sex`, `age`, `email`, `head`, `bg`, `motto`) VALUES
(1, 'Michael', '林圣辉', '男', 24, 'lsh8512@mail.ustc.edu.cn', '/static/album/upload/夏目友人帐/20170214/4334a8833aa645ed3e362fe847201159.jpg', '/static/album/upload/风光/20170214/0d396b1583649f041a12a588978b47c9.jpg', '事在人为，休言万般皆是命；境由心造，退后一步自然宽！'),
(2, '胡歌', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `picture`
--

CREATE TABLE `picture` (
  `id` int(9) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT '用户昵称',
  `album` varchar(30) NOT NULL COMMENT '相册名称',
  `pic` varchar(100) NOT NULL COMMENT '图片',
  `thumbnail` varchar(100) NOT NULL COMMENT '缩略图',
  `click` int(9) NOT NULL DEFAULT '0' COMMENT '点击量',
  `time` int(9) NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `picture`
--

INSERT INTO `picture` (`id`, `name`, `album`, `pic`, `thumbnail`, `click`, `time`) VALUES
(128, 'Michael', '夏目友人帐', '/static/album/upload/夏目友人帐/20170214/19319160680405a5b7d21d513a546862.jpg', '/static/album/upload/夏目友人帐/20170214/thumbnail_19319160680405a5b7d21d513a546862.jpg', 3, 1487053056),
(129, 'Michael', '夏目友人帐', '/static/album/upload/夏目友人帐/20170214/4334a8833aa645ed3e362fe847201159.jpg', '/static/album/upload/夏目友人帐/20170214/thumbnail_4334a8833aa645ed3e362fe847201159.jpg', 0, 1487053056),
(133, 'Michael', '海贼王', '/static/album/upload/海贼王/20170214/44e9f41d719980cfe04f9e85b2b3d95f.jpg', '/static/album/upload/海贼王/20170214/thumbnail_44e9f41d719980cfe04f9e85b2b3d95f.jpg', 3, 1487053214),
(134, 'Michael', '海贼王', '/static/album/upload/海贼王/20170214/768bd062771303372ca47a993f23310f.jpg', '/static/album/upload/海贼王/20170214/thumbnail_768bd062771303372ca47a993f23310f.jpg', 0, 1487053214),
(135, 'Michael', '海贼王', '/static/album/upload/海贼王/20170214/4a4265fd355a3c4ff926e97620cfd5bb.jpg', '/static/album/upload/海贼王/20170214/thumbnail_4a4265fd355a3c4ff926e97620cfd5bb.jpg', 0, 1487053214),
(136, 'Michael', '火影忍者', '/static/album/upload/火影忍者/20170214/be1b702bdcfcf8cc220d0ed3ff0b75a7.jpg', '/static/album/upload/火影忍者/20170214/thumbnail_be1b702bdcfcf8cc220d0ed3ff0b75a7.jpg', 0, 1487053253),
(137, 'Michael', '火影忍者', '/static/album/upload/火影忍者/20170214/27044f3ca385a0d4d6cc78cf92709456.jpg', '/static/album/upload/火影忍者/20170214/thumbnail_27044f3ca385a0d4d6cc78cf92709456.jpg', 0, 1487053253),
(138, 'Michael', '火影忍者', '/static/album/upload/火影忍者/20170214/7a2dde42bc7071a8524a0207a98f5cad.jpg', '/static/album/upload/火影忍者/20170214/thumbnail_7a2dde42bc7071a8524a0207a98f5cad.jpg', 0, 1487053253),
(139, 'Michael', '阴阳师', '/static/album/upload/阴阳师/20170214/b7f14778e7150869e6551456d6515a80.jpg', '/static/album/upload/阴阳师/20170214/thumbnail_b7f14778e7150869e6551456d6515a80.jpg', 0, 1487053283),
(140, 'Michael', '阴阳师', '/static/album/upload/阴阳师/20170214/7dac689b00b8754178349c0b459dfbdf.jpg', '/static/album/upload/阴阳师/20170214/thumbnail_7dac689b00b8754178349c0b459dfbdf.jpg', 0, 1487053283),
(141, 'Michael', '阴阳师', '/static/album/upload/阴阳师/20170214/3e0f02156f183196ae93ad537c1055c0.jpg', '/static/album/upload/阴阳师/20170214/thumbnail_3e0f02156f183196ae93ad537c1055c0.jpg', 0, 1487053283),
(142, 'Michael', '风光', '/static/album/upload/风光/20170214/f5a7966fb73c29084fb43d2a8ebcb4dd.jpg', '/static/album/upload/风光/20170214/thumbnail_f5a7966fb73c29084fb43d2a8ebcb4dd.jpg', 3, 1487053355),
(143, 'Michael', '风光', '/static/album/upload/风光/20170214/0d396b1583649f041a12a588978b47c9.jpg', '/static/album/upload/风光/20170214/thumbnail_0d396b1583649f041a12a588978b47c9.jpg', 0, 1487053355),
(144, 'Michael', '风光', '/static/album/upload/风光/20170214/3c75bab7e2be69db878a12c125b5b739.jpg', '/static/album/upload/风光/20170214/thumbnail_3c75bab7e2be69db878a12c125b5b739.jpg', 0, 1487053355),
(145, 'Michael', '风光', '/static/album/upload/风光/20170214/745c61087d0a61533d631b89f0bbb292.jpg', '/static/album/upload/风光/20170214/thumbnail_745c61087d0a61533d631b89f0bbb292.jpg', 0, 1487053522),
(146, 'Michael', '风光', '/static/album/upload/风光/20170214/02efc42b3d0e98f49be88a0acdc6bfd6.jpg', '/static/album/upload/风光/20170214/thumbnail_02efc42b3d0e98f49be88a0acdc6bfd6.jpg', 0, 1487053522),
(149, 'Michael', '海贼王', '/static/album/upload/海贼王/20170215/8052cfaf945ed84c0bb4bc46e0021512.jpg', '/static/album/upload/海贼王/20170215/thumbnail_8052cfaf945ed84c0bb4bc46e0021512.jpg', 0, 1487146793),
(161, 'Michael', '夏目友人帐', '/static/album/upload/夏目友人帐/20170215/79e02e07e5b74811abde94a371e5057d.jpg', '/static/album/upload/夏目友人帐/20170215/thumbnail_79e02e07e5b74811abde94a371e5057d.jpg', 0, 1487148886),
(170, 'Michael', '火影忍者', '/static/album/upload/火影忍者/20170215/88dafae919950f5357e2e5e5bc226436.jpg', '/static/album/upload/火影忍者/20170215/thumbnail_88dafae919950f5357e2e5e5bc226436.jpg', 0, 1487166635),
(186, 'Michael', '东京食尸鬼', '/static/album/upload/东京食尸鬼/20170216/c0aff5536f9170507b709d3e1c73b94c.jpg', '/static/album/upload/东京食尸鬼/20170216/thumbnail_c0aff5536f9170507b709d3e1c73b94c.jpg', 2, 1487213275),
(187, 'Michael', '东京食尸鬼', '/static/album/upload/东京食尸鬼/20170216/efb09c03a9b794d8557cacfe57459797.jpg', '/static/album/upload/东京食尸鬼/20170216/thumbnail_efb09c03a9b794d8557cacfe57459797.jpg', 0, 1487213328),
(188, 'Michael', '东京食尸鬼', '/static/album/upload/东京食尸鬼/20170216/18620350cf0d78f524f036fbfde8896a.jpg', '/static/album/upload/东京食尸鬼/20170216/thumbnail_18620350cf0d78f524f036fbfde8896a.jpg', 0, 1487213328),
(189, 'Michael', '东京食尸鬼', '/static/album/upload/东京食尸鬼/20170216/906bb4f383b970a258611b907430ae00.jpg', '/static/album/upload/东京食尸鬼/20170216/thumbnail_906bb4f383b970a258611b907430ae00.jpg', 0, 1487213328),
(259, 'Michael', 'sadsad', '/static/album/upload/sadsad/20170216/c2e758ee12655738238152ca6eec91e4.jpg', '/static/album/upload/sadsad/20170216/thumbnail_c2e758ee12655738238152ca6eec91e4.jpg', 0, 1487244013),
(260, 'Michael', 'sadsad', '/static/album/upload/sadsad/20170216/a03ced12bbbf1d751744019ece34ba97.jpg', '/static/album/upload/sadsad/20170216/thumbnail_a03ced12bbbf1d751744019ece34ba97.jpg', 0, 1487244013),
(271, 'Michael', 'sadsad', '/static/album/upload/sadsad/20170216/020e74f76b3ef08285b95e90f251048e.jpg', '/static/album/upload/sadsad/20170216/thumbnail_020e74f76b3ef08285b95e90f251048e.jpg', 0, 1487247708),
(272, 'Michael', 'sadsad', '/static/album/upload/sadsad/20170216/3e41596bfa2202acf08c246e556bf0d9.jpg', '/static/album/upload/sadsad/20170216/thumbnail_3e41596bfa2202acf08c246e556bf0d9.jpg', 0, 1487247708),
(274, 'Michael', 'sadsad', '/static/album/upload/sadsad/20170217/269f656bccbe2724042f0814cc1c1b54.jpg', '/static/album/upload/sadsad/20170217/thumbnail_269f656bccbe2724042f0814cc1c1b54.jpg', 0, 1487297605),
(275, 'Michael', '夏目友人帐', '/static/album/upload/夏目友人帐/20170627/4df67330027a55d1d45ae132ffb20715.jpg', '/static/album/upload/夏目友人帐/20170627/thumbnail_4df67330027a55d1d45ae132ffb20715.jpg', 0, 1498573500),
(276, 'Michael', '夏目友人帐', '/static/album/upload/夏目友人帐/20170627/a837b980780c21647615ad6d595a9ec0.jpg', '/static/album/upload/夏目友人帐/20170627/thumbnail_a837b980780c21647615ad6d595a9ec0.jpg', 0, 1498573500),
(277, 'Michael', '小黄人', '/static/album/upload/小黄人/20170627/96bea4b0946ecd688ead7b503a283ff2.jpg', '/static/album/upload/小黄人/20170627/thumbnail_96bea4b0946ecd688ead7b503a283ff2.jpg', 0, 1498573560),
(278, 'Michael', '小黄人', '/static/album/upload/小黄人/20170627/32c0c3f00635367a5be56c83cda19001.jpg', '/static/album/upload/小黄人/20170627/thumbnail_32c0c3f00635367a5be56c83cda19001.jpg', 0, 1498573560),
(279, 'Michael', '小黄人', '/static/album/upload/小黄人/20170627/48d5115fce0d352f841e7bed32306114.jpg', '/static/album/upload/小黄人/20170627/thumbnail_48d5115fce0d352f841e7bed32306114.jpg', 0, 1498573560),
(280, 'Michael', '小黄人', '/static/album/upload/小黄人/20170627/5cab12c2bcd77ffad898988ad25a9750.jpg', '/static/album/upload/小黄人/20170627/thumbnail_5cab12c2bcd77ffad898988ad25a9750.jpg', 0, 1498573560),
(281, 'Michael', '小黄人', '/static/album/upload/小黄人/20170627/70893710969bc2f8ff9092df1d4862d4.jpg', '/static/album/upload/小黄人/20170627/thumbnail_70893710969bc2f8ff9092df1d4862d4.jpg', 0, 1498573560);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `loginDate` varchar(32) NOT NULL,
  `loginCount` varchar(32) NOT NULL,
  `grade` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `loginDate`, `loginCount`, `grade`) VALUES
(3, 'jijie', 'a7416b99dd8b5f7393b214c89f8a148f', '纪杰', '1483973424', '1', '1150'),
(5, 'lsh', 'a7416b99dd8b5f7393b214c89f8a148f', 'Michael', '1484118683', '1', '1250'),
(8, 'yxy', '96e79218965eb72c92a549dd5a330112', 'yuanxiangyong', '1486785093', '1', '0'),
(9, 'libo', '96e79218965eb72c92a549dd5a330112', 'libo', '1486864592', '1', '0'),
(10, 'huge', 'a7416b99dd8b5f7393b214c89f8a148f', '胡歌', '1488718278', '1', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diary`
--
ALTER TABLE `diary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `album`
--
ALTER TABLE `album`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- 使用表AUTO_INCREMENT `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `diary`
--
ALTER TABLE `diary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=408;
--
-- 使用表AUTO_INCREMENT `emp`
--
ALTER TABLE `emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;
--
-- 使用表AUTO_INCREMENT `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
