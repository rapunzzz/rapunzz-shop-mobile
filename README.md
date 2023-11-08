# rapunzz_shop

### Tugas 7

## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Stateless widget adalah widget statis dimana seluruh konfigurasi yang dimuat didalamnya telah diinisiasi sejak awal. Sedangkan Stateful widget berlaku sebaliknya dimana sifatnya adalah dinamis, sehingga widget ini dapat diperbaharui kapanpun dibutuhkan berdasarkan user actions atau ketika terjadinya perubahan data.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
MaterialApp: Ini adalah widget yang membungkus seluruh aplikasi Flutter dan menginisialisasi berbagai pengaturan seperti tema, bahasa, dan lainnya.

Scaffold: Ini adalah widget yang menyediakan kerangka dasar untuk aplikasi Anda, termasuk AppBar, Floating Action Button, dan banyak hal lainnya.

AppBar: Ini adalah bagian atas tampilan yang biasanya berisi judul aplikasi atau halaman saat ini. Pada contoh ini, itu berisi judul "Shopping List".

Column: Ini adalah widget yang mengatur anak-anak (children) dalam tumpukan vertikal. Ini digunakan di dalam body dari Scaffold untuk mengatur tampilan secara vertikal.

Padding: Ini adalah widget yang digunakan untuk menambahkan padding ke dalam widget yang diatur di dalamnya. Ini digunakan untuk memberikan jarak di sekitar elemen-elemen tampilan dalam Column.

Text: Widget ini digunakan untuk menampilkan teks di layar. Di sini, digunakan untuk menampilkan judul toko "PBP Shop".

GridView.count: Ini adalah widget yang digunakan untuk menampilkan daftar item dalam bentuk grid dengan jumlah kolom yang ditentukan.

ShopCard: Ini adalah widget yang Anda buat sendiri. Ini digunakan untuk menampilkan kartu (card) untuk setiap item yang dijual. Anda mendefinisikan widget ini sendiri dan menjadikannya stateless.

Material: Ini adalah widget yang digunakan untuk memberikan latar belakang berwarna indigo pada kartu dan memberikan efek tampilan Material.

InkWell: Ini adalah widget yang membuat area responsif terhadap sentuhan. Digunakan di dalam ShopCard untuk menangkap ketika kartu ditekan.

SnackBar: Ini adalah widget yang digunakan untuk menampilkan pemberitahuan di bagian bawah layar ketika kartu ditekan.

Container: Ini adalah widget yang digunakan untuk mengelompokkan elemen-elemen seperti ikon dan teks dalam satu wadah.

Icon: Widget ini digunakan untuk menampilkan ikon yang sesuai dengan item yang dijual.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
# Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
- Buat project baru bernama rapunzz_shop pada terminal di direktori yang ingin disimpan project tersebut : ```flutter create rapunzz_shop``` kemudian pindah ke direktori tersebut dengan cara ```cd rapunzz_shop```
- Jalankan proyek tersebut dengan ```flutter run```
# Membuat tiga tombol sederhana dengan ikon dan teks untuk:
- Melihat daftar item (Lihat Item)
- Menambah item (Tambah Item)
- Logout (Logout)

1. Pertama, Anda perlu mendefinisikan tipe data ShopItem yang akan digunakan untuk mewakili setiap tombol. Setiap ShopItem akan memiliki dua properti, yaitu nama (teks) dan ikon yang sesuai dengan code sebagai berikut
```dart
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}
```

2. Selanjutnya, Anda perlu membuat daftar ShopItem yang akan mewakili tombol-tombol yang diinginkan. Dalam contoh ini, Anda akan menambahkan tiga tombol:
```dart
final List<ShopItem> items = [
  ShopItem("Lihat Item", Icons.search),
  ShopItem("Tambah Item", Icons.add),
  ShopItem("Logout", Icons.logout),
];
```
Di sini, Anda mendefinisikan tiga objek ShopItem untuk masing-masing tombol dengan nama dan ikon yang sesuai.

3. Implementasikan untuk tombol yang akan dibuat dengan code berikut
```dart
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rapunzz Shop',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Rapunzz Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
```
# Memunculkan Snackbar dengan tulisan:
- "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
- "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
- "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

Buat class baru bernama shopCard yang dimana pada tombol sebelumnya yang sudah dibuat akan routing ke class ini yang mana akan memunculkan snackbar dengan tulisan, dan untuk codenya sebagai berikut:
```dart
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Implementasi bonus
1. Menambahkan properti color ke dalam kelas ```ShopItem``` untuk menentukan warna latar belakang kartu yang sesuai untuk setiap item. Contoh:
```dart
class ShopItem {
  final String name;
  final IconData icon;
  final Color color; // Menambahkan properti warna

  ShopItem(this.name, this.icon, this.color);
}
```
2. Atur warna yang berbeda untuk setiap item dalam daftar items pada ```MyHomePage```.Contoh:
```dart
final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist, Colors.blue),
    ShopItem("Tambah Produk", Icons.add_shopping_cart, Colors.redAccent),
    ShopItem("Logout", Icons.logout, Colors.teal),
  ];
```
3. Di dalam ShopCard, akses properti ```item.color``` untuk menentukan warna latar belakang kartu. Contoh:
```dart
return Material(
  color: item.color, // Menggunakan warna dari item
  child: InkWell(
  ...
```
