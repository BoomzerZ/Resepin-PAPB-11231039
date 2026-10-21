import '../models/meal.dart';

const dummyRecipes = <Meal>[
  Meal(
    id: '1',
    name: 'Nasi Goreng Kampung',
    thumbnail:
        'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800',
    category: 'Nasi',
    ingredients: [
      '2 piring nasi putih',
      '2 butir telur',
      '3 siung bawang merah',
      '1 sdm kecap manis',
      'Cabai dan garam',
    ],
    instructions: [
      'Haluskan bawang dan cabai.',
      'Tumis bumbu hingga harum.',
      'Masukkan telur lalu orak-arik.',
      'Masukkan nasi dan kecap, aduk hingga matang.',
    ],
  ),
  Meal(
    id: '2',
    name: 'Mie Goreng Jawa',
    thumbnail:
        'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=800',
    category: 'Mie',
    ingredients: [
      '200 g mie telur',
      '100 g ayam suwir',
      '2 siung bawang putih',
      '1 sdm kecap manis',
      'Sawi hijau',
    ],
    instructions: [
      'Rebus mie hingga setengah matang.',
      'Tumis bawang dan ayam.',
      'Masukkan mie, sawi, dan kecap.',
      'Aduk hingga bumbu merata.',
    ],
  ),
  Meal(
    id: '3',
    name: 'Ayam Bakar Kecap',
    thumbnail:
        'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=800',
    category: 'Ayam',
    ingredients: [
      '500 g ayam',
      '3 sdm kecap manis',
      '2 siung bawang putih',
      '1 cm jahe',
      'Garam',
    ],
    instructions: [
      'Ungkep ayam bersama bumbu hingga empuk.',
      'Olesi ayam dengan kecap.',
      'Bakar sambil dibalik hingga kecokelatan.',
    ],
  ),
  Meal(
    id: '4',
    name: 'Ikan Bumbu Kuning',
    thumbnail:
        'https://images.unsplash.com/photo-1544943910-4c1dc44aab44?w=800',
    category: 'Ikan',
    ingredients: [
      '2 ekor ikan kembung',
      '2 cm kunyit',
      '3 butir kemiri',
      '1 batang serai',
      'Jeruk nipis',
    ],
    instructions: [
      'Lumuri ikan dengan jeruk nipis.',
      'Haluskan kunyit dan kemiri.',
      'Tumis bumbu dengan serai.',
      'Masukkan ikan dan masak hingga matang.',
    ],
  ),
  Meal(
    id: '5',
    name: 'Capcay Sayur',
    thumbnail:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800',
    category: 'Sayur',
    ingredients: [
      'Wortel',
      'Brokoli',
      'Sawi',
      '3 siung bawang putih',
      '1 sdm saus tiram',
    ],
    instructions: [
      'Potong semua sayuran.',
      'Tumis bawang putih.',
      'Masukkan wortel lalu sayuran lain.',
      'Tambahkan saus tiram dan sedikit air.',
    ],
  ),
  Meal(
    id: '6',
    name: 'Soto Ayam',
    thumbnail:
        'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=800',
    category: 'Ayam',
    ingredients: [
      '300 g ayam',
      'Bihun',
      'Kol iris',
      '2 cm kunyit',
      'Daun bawang',
    ],
    instructions: [
      'Rebus ayam hingga matang.',
      'Tumis bumbu halus lalu masukkan ke kaldu.',
      'Suwir ayam.',
      'Sajikan dengan bihun dan pelengkap.',
    ],
  ),
  Meal(
    id: '7',
    name: 'Rendang Daging',
    thumbnail:
        'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800',
    category: 'Daging',
    ingredients: [
      '500 g daging sapi',
      '500 ml santan',
      'Cabai merah',
      'Serai',
      'Daun jeruk',
    ],
    instructions: [
      'Masak santan dan bumbu hingga mendidih.',
      'Masukkan daging.',
      'Masak api kecil sambil diaduk hingga kuah mengering.',
    ],
  ),
  Meal(
    id: '8',
    name: 'Gado-Gado',
    thumbnail:
        'https://images.unsplash.com/photo-1547592180-85f173990554?w=800',
    category: 'Sayur',
    ingredients: [
      'Tauge',
      'Kentang rebus',
      'Tahu goreng',
      'Telur rebus',
      'Bumbu kacang',
    ],
    instructions: [
      'Rebus sayuran hingga matang.',
      'Susun sayuran, tahu, dan telur.',
      'Siram dengan bumbu kacang.',
    ],
  ),
  Meal(
    id: '9',
    name: 'Sup Jagung',
    thumbnail:
        'https://images.unsplash.com/photo-1547592180-85f173990554?w=800',
    category: 'Sup',
    ingredients: [
      'Jagung manis',
      'Wortel',
      'Ayam cincang',
      'Kaldu',
      'Daun bawang',
    ],
    instructions: [
      'Didihkan kaldu.',
      'Masukkan jagung, wortel, dan ayam.',
      'Masak hingga semua bahan lunak.',
      'Tambahkan daun bawang.',
    ],
  ),
  Meal(
    id: '10',
    name: 'Sate Ayam Madura',
    thumbnail:
        'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=800',
    category: 'Ayam',
    ingredients: [
      '300 g dada ayam',
      'Tusuk sate',
      'Kecap manis',
      'Kacang tanah',
      'Bawang putih',
    ],
    instructions: [
      'Potong ayam dan tusuk sate.',
      'Bakar sambil dioles kecap.',
      'Haluskan kacang untuk sambal.',
      'Sajikan sate dengan sambal kacang.',
    ],
  ),
];
