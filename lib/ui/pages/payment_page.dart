part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  PaymentPage({this.transaction});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  
  String selectedProvince;
  String selectedCity;

  TextEditingController postalCodeController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'MBPFast Market',
      onBackButtonPressed: () {},
      backColor: 'FAFAFC'.toColor(),
      child: Column(
        children: [
          //// Bagian atas
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Ordered',
                  style: blackFontStyle3,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://market.mbpfast.com/storage/' +
                                          widget.transaction.food.galleries[0]
                                              .photos),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 198,
                              // 2 * defaultMargin (jarak border) +
                              // 60 (lebar picture) +
                              // 12 (jarak picture ke title)+
                              // 78 (lebar jumlah items),
                              child: Text(
                                widget.transaction.food.name,
                                style: blackFontStyle2,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id-ID',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(widget.transaction.food.price),
                              style: greyFontStyle.copyWith(fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      '${widget.transaction.quantity} item(s)',
                      style: greyFontStyle.copyWith(fontSize: 13),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Details Transaction',
                    style: blackFontStyle3,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          widget.transaction.food.name,
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(widget.transaction.total),
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Total',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(widget.transaction.total),
                          style: blackFontStyle3.copyWith(
                              fontWeight: FontWeight.w500,
                              color: '1ABC9C'.toColor()),
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Address 1",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: address1Controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Masukkan Alamat anda'),
            ),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Address 2",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: address2Controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Masukkan Alamat anda'),
            ),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Province",
              style: blackFontStyle2,
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: BlocBuilder<ProvinceCubit, ProvinceState>(
                builder: (_, state) => (state is ProvinceLoaded)
                    ? DropdownButton(
                      value: selectedProvince,
                      isExpanded: true,
                      underline: SizedBox(),
                      items: state.provinces
                          .map((e) => DropdownMenuItem(
                              value: e.name,
                              child: Text(
                                e.name,
                                style: blackFontStyle3,
                              )))
                          .toList(),
                      onChanged: (item) {
                        setState(() {
                          selectedProvince = item;
                        });
                      })
                    : Center(child: loadingIndicator),
              ),
            ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "City",
              style: blackFontStyle2,
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: BlocBuilder<RegionCubit, RegionState>(
                builder: (_, state) => (state is RegionLoaded)
                    ? DropdownButton(
                      value: selectedCity,
                      isExpanded: true,
                      underline: SizedBox(),
                      items: state.regions
                          .map((e) => DropdownMenuItem(
                              value: e.name,
                              child: Text(
                                e.name,
                                style: blackFontStyle3,
                              )))
                          .toList(),
                      onChanged: (item) {
                        setState(() {
                          selectedCity = item;
                        });
                      })
                    : Center(child: loadingIndicator),
              ),
            ),


          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Postal Code",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: postalCodeController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Masukkan Kode Pos'),
            ),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Mobile Phone",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: mobileController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Masukkan Nomor Telpon anda'),
            ),
          ),

          SizedBox(
                  height: 24,
          ),
          
          //// Bagian bawah
          // Container(
          //   margin: EdgeInsets.only(bottom: defaultMargin),
          //   padding:
          //       EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
          //   color: Colors.white,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Deliver to',
          //         style: blackFontStyle3,
          //       ),
          //       SizedBox(
          //         height: 8,
          //       ),
          //       Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           SizedBox(
          //               width: 80,
          //               child: Text(
          //                 'Name',
          //                 style: greyFontStyle,
          //               )),
          //           SizedBox(
          //               width: MediaQuery.of(context).size.width -
          //                   2 * defaultMargin -
          //                   80,
          //               child: Text(
          //                 widget.transaction.user.name,
          //                 style: blackFontStyle3,
          //                 textAlign: TextAlign.right,
          //               ))
          //         ],
          //       ),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Phone Number',
          //             style: greyFontStyle,
          //           ),
          //           Text(
          //             widget.transaction.user.phoneNumber,
          //             style: blackFontStyle3,
          //             textAlign: TextAlign.right,
          //           )
          //         ],
          //       ),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           SizedBox(
          //               width: 80,
          //               child: Text(
          //                 'Address',
          //                 style: greyFontStyle,
          //               )),
          //           SizedBox(
          //               width: MediaQuery.of(context).size.width -
          //                   2 * defaultMargin -
          //                   80,
          //               child: Text(
          //                 widget.transaction.user.address,
          //                 style: blackFontStyle3,
          //                 textAlign: TextAlign.right,
          //               ))
          //         ],
          //       ),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'House Number',
          //             style: greyFontStyle,
          //           ),
          //           Text(
          //             widget.transaction.user.houseNumber,
          //             style: blackFontStyle3,
          //             textAlign: TextAlign.right,
          //           )
          //         ],
          //       ),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'City',
          //             style: greyFontStyle,
          //           ),
          //           Text(
          //             widget.transaction.user.city,
          //             style: blackFontStyle3,
          //             textAlign: TextAlign.right,
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          //// Checkout Button
          (isLoading)
              ? Center(
                  child: loadingIndicator,
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  height: 45,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      String paymentURL = await context
                          .bloc<TransactionCubit>()
                          .submitTransaction(widget.transaction.copyWith(
                              dateTime: DateTime.now(),
                              total: (widget.transaction.total * 1.1).toInt() +
                                  50000));

                      if (paymentURL != null) {
                        Get.to(PaymentMethodPage(paymentURL));
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(MdiIcons.closeCircleOutline,
                                color: Colors.white),
                            titleText: Text(
                              'Transaction Failed',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                              'Please try again later.',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ));
                      }
                    },
                    elevation: 0,
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Checkout Now",
                      style:
                          blackFontStyle3.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                        height: 24,
                ),
        ],
        
      ),
    );
  }
}
