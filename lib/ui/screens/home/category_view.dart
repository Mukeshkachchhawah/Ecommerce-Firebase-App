import 'package:e_commerece_clon/modal/category_modal.dart';
import 'package:e_commerece_clon/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [customBanner(context), hSpace(), category()],
        ),
      ),
    );
  }

  customBanner(BuildContext context) {
    return Card(
      color: const Color(0xffaa14f0),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 150,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
            ),
            wSpace(),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "30% discount on all home decoration products",
                    style: textStyleFonts20(context,
                       ),
                  ),
                  hSpace(),
                  SizedBox(
                      height: 40,
                      width: 180,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffe4abff))),
                          onPressed: () {},
                          child: Text(
                            "Get Now",
                            style: textStyleFonts14(
                              context,
                            ),
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  category() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: CategoryViewList().category.length,
      itemBuilder: (context, index) {
        var cat = CategoryViewList().category[index];
        return Card(
          color: Color(0xffffffff),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 60,
                  width: 60,
                  child: Card(
                      child: Image.asset(
                    "${cat['icon']}",
                    scale: 4,
                  ))),
              hSpace(mHeight: 10),
              Center(
                child: Text(
                  "${cat['category']}",
                  maxLines: 1,
                ),
              )
            ],
          ),
        );
      },
    );
    /* 
    
    ListView.builder(
      shrinkWrap: true,
      itemCount: CategoryList().category.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var cat = CategoryList().category[index];
        return GestureDetector(
          onTap: () {},
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF000001)),
              child: Center(
                  child: Text(
                "$cat",
                style: const TextStyle(color: Colors.white),
              ))),
        );
      },
    );
  */
  }
}
