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

### Tugas 8
## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
Perbedaan utama antara keduanya adalah bagaimana mereka memanipulasi tumpukan (stack) navigasi.

1. Navigator.push():
- Metode ini digunakan untuk menambahkan halaman baru ke dalam tumpukan navigasi.
- Saat menggunakan Navigator.push(), halaman yang baru ditambahkan akan ditumpuk di atas halaman yang sedang ditampilkan.
- Ini berarti pengguna dapat kembali ke halaman sebelumnya dengan menekan tombol kembali pada perangkat mereka.
- Contoh penggunaan ```Navigator.push()```:
```dart
// Navigasi dari halaman saat ini ke halaman DetailScreen
Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
```

2. Navigator.pushReplacement():
- Metode ini juga digunakan untuk menambahkan halaman baru ke dalam tumpukan navigasi, tetapi dengan perbedaan utama bahwa halaman saat ini digantikan oleh halaman baru.
- Ini berarti pengguna tidak dapat kembali ke halaman sebelumnya dengan menekan tombol kembali karena halaman sebelumnya digantikan.
- Ini berguna ketika ingin mengganti halaman saat ini dengan halaman yang berbeda, misalnya saat pengguna berhasil masuk atau Anda ingin menghindari pengguna kembali ke halaman login.
- Contoh penggunaan ```Navigator.pushReplacement()```:
```dart
// Navigasi dari halaman saat ini ke halaman HomeScreen dan menggantikan halaman saat ini
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
```
## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
1. Container:

Container adalah widget tata letak yang serbaguna dan dapat digunakan untuk menggabungkan beberapa widget ke dalam satu kotak.
Ini sering digunakan untuk mengatur widget dalam susunan yang sederhana dan mengendalikan properti seperti margin, padding, dan warna latar belakang.
2. Row dan Column:

Row dan Column adalah widget tata letak yang digunakan untuk mengatur widget dalam baris horizontal (Row) atau vertikal (Column).
Mereka berguna saat Anda perlu menyusun widget dalam urutan tertentu.
3. ListView:

ListView adalah widget tata letak yang digunakan untuk membuat daftar bergulir dari widget.
Ini cocok untuk tampilan daftar item yang panjang atau tak terbatas, seperti daftar kontak atau berita.
4. Stack:

Stack adalah widget tata letak yang memungkinkan Anda menempatkan widget di atas satu sama lain.
Ini berguna untuk menggabungkan beberapa widget dan mengatur tumpukan tampilan, seperti tombol overlay, gambar latar belakang, atau teks atas gambar.
5. Card:

Card adalah widget tata letak yang digunakan untuk membuat elemen kartu dengan bayangan, latar belakang, dan konten.
Ini digunakan untuk menggambarkan informasi seperti kartu kontak, berita, atau entri dalam aplikasi.
6. Expanded dan Flexible:

Expanded dan Flexible adalah widget tata letak yang digunakan dalam Row dan Column untuk mengendalikan sejauh mana widget harus diperluas atau fleksibel.
Ini berguna untuk mengatur perbandingan ruang yang diberikan kepada widget dalam tata letak yang memiliki widget anak dengan ukuran yang berbeda.
7. GridView:

GridView adalah widget tata letak yang digunakan untuk mengatur widget dalam bentuk kotak atau grid.
Ini berguna saat Anda perlu menampilkan konten dalam format berkolom dan berbaris, seperti galeri gambar atau aplikasi papan permainan.
8. Wrap:

Wrap adalah widget tata letak yang digunakan untuk mengatur widget dalam baris horizontal atau vertikal, tetapi jika ruang tidak cukup, widget akan memindahkan ke baris atau kolom berikutnya.
Ini berguna untuk mengatasi situasi di mana ada banyak widget anak yang perlu diatur dalam ruang yang terbatas.
9. Flow:

Flow adalah widget tata letak yang mengatur widget anak dalam bentuk aliran yang dapat menyesuaikan diri dengan tampilan tanpa membatasi ruang atau ukuran widget.
Ini berguna saat Anda ingin menampilkan widget dalam tampilan yang sangat dinamis.
10. SingleChildScrollView:

SingleChildScrollView adalah widget tata letak yang digunakan untuk membuat konten bergulir dalam satu arah (biasanya vertikal).
Ini digunakan saat Anda memiliki sedikit konten yang perlu digulir dan ingin menghindari tampilan kesulitan geser vertikal.

## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
1. TextFormField (Nama Produk):

Saya menggunakan TextFormField untuk mengumpulkan nama produk karena nama produk adalah teks atau string. Dengan TextFormField, pengguna dapat memasukkan teks sesuai dengan nama produk yang akan ditambahkan. Elemen ini juga menyediakan tampilan yang nyaman dengan label "Nama Produk" dan memberikan pemberitahuan validasi jika pengguna tidak memasukkan nama produk.
2. TextFormField (Harga):

Saya menggunakan TextFormField untuk mengumpulkan harga produk karena harga adalah data numerik (angka). Dengan TextFormField, pengguna dapat memasukkan angka harga produk. Saya juga menambahkan validasi untuk memastikan bahwa pengguna memasukkan angka sebagai harga, bukan teks atau karakter lain.
3. TextFormField (Deskripsi):

Saya menggunakan TextFormField untuk mengumpulkan deskripsi produk karena deskripsi adalah teks atau string yang menjelaskan produk tersebut. Dengan TextFormField, pengguna dapat dengan mudah memasukkan teks deskripsi produk.
## Bagaimana penerapan clean architecture pada aplikasi Flutter?
Penerapan Clean Architecture pada aplikasi Flutter melibatkan pemisahan kode menjadi empat lapisan utama, yaitu Entitas, Use Cases (logika sistem), Controller, dan UI (antarmuka pengguna). Berikut adalah penjelasan lebih detail tentang setiap lapisan:

1. Entitas (Entities):
Lapisan Entitas berisi representasi dari objek-objek inti atau konsep bisnis dalam aplikasi. Ini adalah tempat di mana aturan bisnis inti didefinisikan.
Entitas biasanya tidak tergantung pada teknologi atau infrastruktur tertentu dan dapat digunakan kembali dalam berbagai konteks.
Di Flutter, entitas ini mungkin berupa kelas atau model yang mewakili objek atau data dalam aplikasi.

2. Use Cases atau Logika Sistem (Use Cases):
Lapisan Use Cases berisi logika bisnis aplikasi, seperti alur tindakan yang memanipulasi entitas.
Use cases mendefinisikan operasi-operasi yang dapat dilakukan pada entitas dan mengatur aliran bisnis.
Lapisan ini terisolasi dari detail teknis dan infrastruktur dan dapat diuji dengan baik.

3. Controller:
Lapisan Controller adalah bagian dari logika aplikasi yang menghubungkan lapisan use cases dengan lapisan UI.
Ini dapat berperan sebagai perantara yang mengelola perubahan data dan mengirimkan pembaruan ke UI.
Di Flutter, lapisan ini dapat diwakili oleh komponen seperti BLoC (Business Logic Component) atau konsep serupa.

4. UI atau Web:
Lapisan UI adalah komponen yang bertanggung jawab untuk menampilkan antarmuka pengguna dan berinteraksi langsung dengan pengguna.
Lapisan ini terdiri dari widget, halaman, tata letak, dan elemen tampilan yang membangun antarmuka pengguna aplikasi.
Ini tidak boleh memiliki logika bisnis yang kompleks, melainkan hanya merespons tindakan pengguna dan memproses tampilan.
## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

# Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
- Memakai minimal tiga elemen input, yaitu ```name```, ```amount```, ```description```. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
- Memiliki sebuah tombol ```Save```.
- Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
  Setiap elemen input tidak boleh kosong.
  Setiap elemen input harus berisi data dengan tipe data atribut modelnya.

1. Buat sebuah widget yang akan menjadi halaman formulir tambah item baru. Anda dapat membuat widget ini dalam berkas Dart baru, misalnya "shoplist_form.dart".

2. Desain UI Form:
- Dalam widget tersebut, gunakan widget Form sebagai kontainer utama untuk elemen-elemen input.
- Tambahkan TextFormField untuk tiga elemen input: name, amount, dan description.

3. Tambahkan tombol ```Save``` dengan widget ElevatedButton untuk menyimpan item yang baru.

4. Validasi input sesuai dengan ketentuan yang diberikan. Anda dapat menggunakan validator pada setiap TextFormField untuk memastikan bahwa setiap elemen input tidak boleh kosong dan harus memiliki tipe data yang sesuai dengan atribut model.

# Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
Gunakan MaterialPageRoute yang mencakup ShopFormPage dengan code seperti berikut:
```dart
if (item.name == "Tambah Produk") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
```
# Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
1. Menggunakan widget AlertDialog untuk menampilkan pop-up seperti berikut:
```dart
AlertDialog(
  title: const Text('Produk berhasil tersimpan'),
  content: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nama: $_name'),
        Text('Harga: $_price'),
        Text('Deskripsi: $_description'),
      ],
    ),
  ),
  actions: [
    TextButton(
      child: const Text('OK'),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ],
);
```
2. Kemudian Menampilkan dialog ketika tombol ```Save``` ditekan. Tambahkan kode untuk menampilkan dialog dalam event handler tombol ```Save``` yang ada di halaman formulir.
```dart
ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.indigo),
  ),
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // ... (seperti yang dijelaskan sebelumnya)
          );
        },
      );
    }
    _formKey.currentState!.reset();
  },
  child: const Text(
    "Save",
    style: TextStyle(color: Colors.white),
  ),
),
```
# Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
- Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
- Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
- Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

1. Impor kelas-kelas yang dibutuhkan, seperti ```MyHomePage``` (halaman utama) dan ```ShopFormPage``` (halaman formulir tambah item).

2. Buat widget ```LeftDrawer``` yang mewakili drawer dalam aplikasi. Ini adalah tampilan yang akan ditampilkan dalam drawer.

3. Gunakan widget Drawer untuk menentukan isi drawer.
Di dalamnya, gunakan ```ListView``` untuk membuat daftar vertikal dari opsi.

4. Tambahkan bagian header pada drawer dengan menggunakan DrawerHeader.
Header ini memiliki latar belakang warna biru (indigo) dan berisi judul "Shopping List" serta deskripsi singkat aplikasi.

5. Tambahkan dua opsi dalam drawer menggunakan ListTile.
Opsi pertama adalah ```Halaman Utama``` dan ikonnya adalah ikon rumah (home).
Opsi kedua adalah ```Tambah Item``` dan ikonnya adalah ikon keranjang belanja (shopping cart).

6. Atur perilaku ketika opsi dipilih dengan menambahkan onTap handler.
Saat ```Halaman Utama``` dipilih, gunakan Navigator untuk mengarahkan pengguna ke halaman utama (MyHomePage).
Saat ```Tambah Item``` dipilih, gunakan Navigator untuk mengarahkan pengguna ke halaman formulir tambah item baru (ShopFormPage).

## Implementasi Bonus
- Buat class baru untuk menyimpan produknya di file ```shoplist_form.dart``` seperti berikut :
```dart
class Item {
  final String name;
  final int price;
  final String description;

  Item({
    required this.name,
    required this.price,
    required this.description,
  });
}

class ItemStorage {
  static final List<Item> _items = [];
  static void addItem(Item item) {
    _items.add(item);
  }

  static List<Item> get items => _items;
}
```
- Masukkan produk tiap input pada form di file ```shoplist_form.dart``` dan tampilkan tiap button ```OK``` di pilih, seperti berikut :
```dart
onPressed: () {
  if (_formKey.currentState!.validate()) {
    ItemStorage.addItem(Item(
      name: _name,
      price: _price,
      description: _description,
    ));
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Produk berhasil tersimpan'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama: $_name'),
                Text('Harga: $_price'),
                Text('Deskripsi: $_description'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
  _formKey.currentState!.reset();
},
```
- Buat file baru untuk halaman yang menampilkan daftar produk yang ditambahkan dengan nama ```list_item.dart``` dan buat code untuk menampilkan daftar produknya
- Routing pada button ```Lihat Produk``` ke ```ItemListPage``` di file ```shop_card.dart```
