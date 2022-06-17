part of 'widgets.dart';

class BannerCard extends StatelessWidget {
  final BannerModel banner;

  BannerCard(this.banner);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 210,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)
          ]),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(
                    image: NetworkImage('https://market.mbpfast.com/storage/assets/banner/YpyCWkStSh245i1mKZVofxDoEaN357DAvyQQS2nl.jpg'), fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
