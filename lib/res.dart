import 'package:idea/models/filter.dart';
import 'package:idea/models/news.dart';
import 'package:idea/models/order.dart';
import 'package:idea/models/product.dart';

Order order = null;
List<Map<Products, int>> map = null, basket = null;
Filter filter = new Filter(
    priceFrom: 0, priceUntil: 1000, valueFrom: 0, valueUntil: 100, type: 0);

List<News> news = [
  News(
      id: '1',
      name: 'Wow, it is GOOD',
      description: 'We are open',
      url:
          'https://pikdone.s3.amazonaws.com/2018/04/Ai-We-are-open-sign-vector-free-download-350x350.jpg'),
  News(
      id: '2',
      name: 'Life with Bon Aqua',
      description: 'Buy one botle water Bon Aqua and will give one more',
      url:
          'https://aqua-world.org/image/cache/catalog/08stati/051-300x300.jpg'),
  News(
      id: '3',
      name: 'Fresh LIFE',
      description: 'Drink  Tassay and will win a new car',
      url:
          'https://tmu.org.ua/wp-content/uploads/2020/01/1579469346_Kak-pravil-no-pit-vodu-dlya-pohudeniya_3.jpg'),
];

List<Products> products = [
  Products(
      id: '001',
      name: 'Bon Aqua',
      title: 'Fresh SIA',
      value: 0.2,
      type: 'with gas',
      descriptiom: 'natural water from arctic ice',
      price: 2,
      url:
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/98f84986942841.5da97c124be99.jpg'),
  Products(
      id: '002',
      name: 'Bon Aqua',
      title: 'SKY water',
      value: 0.2,
      type: 'with gas',
      descriptiom: 'pure water from natural sources',
      price: 1.5,
      url:
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/5095e956727997.59b9db66ddc51.png'),
  Products(
      id: '003',
      name: 'Tassay',
      title: 'CristalL water',
      value: 0.2,
      type: 'with gas',
      descriptiom: ' water with natural minerals',
      price: 3,
      url: 'https://i1.sndcdn.com/artworks-000215379994-lla5g6-t500x500.jpg'),
  Products(
      id: '004',
      name: 'Tassay',
      title: 'CristalL water',
      value: 1,
      type: 'with gas',
      descriptiom: ' water with natural minerals',
      price: 3,
      url:
          'https://mir-s3-cdn-cf.behance.net/projects/404/a0b93270825801.Y3JvcCwxNjI2LDEyNzIsMTc3LDky.jpg'),
  Products(
      id: '005',
      name: 'Nestle',
      title: 'Sweet water',
      value: 0.5,
      type: 'without gas',
      descriptiom: 'Sweet water with natural minerals',
      price: 3,
      url:
          'https://www.antevenio.com/it/wp-content/uploads/2020/04/Nestle-500x313.png'),
  Products(
      id: '006',
      name: 'Улеймская',
      title: 'Russian water',
      value: 0.5,
      type: 'without gas',
      descriptiom: ' water with natural minerals',
      price: 3,
      url: 'https://sc01.alicdn.com/kf/U6aa4c58d25854609a136b4fc6325943dG.jpg'),
  Products(
      id: '007',
      name: 'Bailak',
      title: 'Baikal water',
      value: 0.5,
      type: 'without gas',
      descriptiom: ' water with natural minerals of BAIKAL',
      price: 5,
      url:
          'https://universe-tss.su/uploads/posts/2019-03/thumbs/1553254378_8097006t1h3ac0.jpg'),
  Products(
      id: '008',
      name: 'Сары Агаш',
      title: 'Шымкент water',
      value: 1.5,
      type: 'without gas',
      descriptiom: ' water with natural minerals of Shumkent',
      price: 10,
      url:
          'https://yt3.ggpht.com/ytc/AAUvwnik6RSFWFhsox_cD_S0mTyqHn_JM37fnsdYmGVM=s900-c-k-c0x00ffffff-no-rj'),
];
