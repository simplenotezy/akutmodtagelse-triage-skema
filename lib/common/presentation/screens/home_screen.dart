import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/application/router.gr.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/text_typography.dart';
import 'package:flutter_starter/common/util/haptic_feedback.dart';
import 'package:flutter_starter/features/contact_card/data/contact_card_list.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<ContactReasonCard> filteredContactCards = contactCards;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        filteredContactCards = contactCards
            .where(
              (contactCard) =>
                  contactCard.title.toLowerCase().contains(
                        _controller.text.toLowerCase(),
                      ) ||
                  contactCard.number.toString().contains(_controller.text) ||
                  contactCard.searchTerms.any(
                    (searchTerm) => searchTerm.contains(
                      _controller.text.toLowerCase(),
                    ),
                  ),
            )
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kontaktsårsagskort"),
      ),
      body: Center(
        child: Column(
          children: [
            // search field with clear input button
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Søg efter navn, nummer eller symptomer',
                fillColor: Theme.of(context).colorScheme.surface,
                //background color white
                filled: true,
                hintStyle: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          playHapticFeedback();

                          _controller.clear();
                        },
                      )
                    : null,
              ),
            ),
            filteredContactCards.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      children: [
                        const TextTypography.body(
                          'Ingen resultater fundet for søgning',
                        ),
                        const SizedBox(height: 8.0),
                        const TextTypography.body(
                          'Prøv at søge efter et andet ord, nummer eller symptom',
                          center: true,
                        ),
                        const SizedBox(height: 16.0),
                        // clear results
                        FilledButton(
                          onPressed: () {
                            playHapticFeedback();

                            _controller.clear();
                          },
                          child: const Text(
                            'Nulstil søgning',
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: filteredContactCards.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(top: index == 0 ? 8.0 : 0),

                        child: ListTile(
                          // every second is light grey
                          tileColor: index.isEven
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.15),
                          // arrow right icon
                          trailing: Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          title: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                child: Text(
                                  filteredContactCards[index].number.toString(),
                                  // bold
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  filteredContactCards[index].title,
                                ),
                              ),
                            ],
                          ),
                          // subtitle: Text(
                          //     filteredContactCards[index].number.toString()),
                          onTap: filteredContactCards[index]
                                  .symptomCategories
                                  .isNotEmpty
                              ? () {
                                  playHapticFeedback();

                                  AutoRouter.of(context).push(
                                    ContactCardRoute(
                                      contactCard: filteredContactCards[index],
                                    ),
                                  );
                                }
                              : null,
                        ),

                        // child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SizedBox(
                        //       width: double.infinity,
                        //       child: FilledButton(
                        //         style: ButtonStyle(
                        //           // left align text
                        //           alignment: Alignment.centerLeft,
                        //           shape: MaterialStateProperty.all(
                        //             RoundedRectangleBorder(
                        //               // 5px rounded borders
                        //               borderRadius:
                        //                   BorderRadius.circular(10.0),
                        //             ),
                        //           ),
                        //           textStyle: MaterialStateProperty.all(
                        //             const TextStyle(
                        //               // fontSize: 16.0,
                        //               overflow: TextOverflow.ellipsis,
                        //             ),
                        //           ),
                        //         ),
                        //         onPressed: filteredContactCards[index]
                        //                 .symptomCategories
                        //                 .isNotEmpty
                        //             ? () {
                        //                 playHapticFeedback();

                        //                 AutoRouter.of(context).push(
                        //                   ContactCardRoute(
                        //                     contactCard:
                        //                         filteredContactCards[index],
                        //                   ),
                        //                 );
                        //               }
                        //             : null,
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             SizedBox(
                        //               width: 30,
                        //               child: Text(
                        //                 filteredContactCards[index]
                        //                     .number
                        //                     .toString(),
                        //               ),
                        //             ),
                        //             Expanded(
                        //               child: Text(
                        //                 filteredContactCards[index].title,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
