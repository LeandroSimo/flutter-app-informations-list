import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:target/locator.dart';
import 'package:target/src/core/global/app_colors.dart';
import 'package:target/src/core/utils/validator.dart';
import 'package:target/src/core/widgets/custom_buttom.dart';
import 'package:target/src/core/widgets/custom_text_field.dart';
import 'package:target/src/service/navigation_service.dart';
import 'package:target/src/stories/information_store.dart';
import 'package:target/src/ui/widgets/custom_rich_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with Validator {
  GlobalKey<FormState> formKeyHome = GlobalKey<FormState>();
  late FocusNode _focusAddInformation;

  @override
  void initState() {
    super.initState();
    _focusAddInformation = FocusNode();
  }

  @override
  void dispose() {
    _focusAddInformation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final informationStore = Provider.of<InformationStore>(context);
    final listInformation = informationStore.informationList;
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        informationStore.setReadOnly(true);
        _focusAddInformation.requestFocus();
        return false;
      },
      child: GestureDetector(
        onTap: () {
          informationStore.setReadOnly(true);
          _focusAddInformation.requestFocus();
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.tealAccent.shade700,
            resizeToAvoidBottomInset: false,
            body: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Information",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.exit_to_app),
                          color: Colors.white,
                          onPressed: () =>
                              locator<NavigationService>().goBack('/'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 16,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Observer(
                              builder: (_) {
                                return Form(
                                  key: formKeyHome,
                                  child: CustomTextFormField(
                                    text: 'Add Information:',
                                    obscureText: false,
                                    isLabel: true,
                                    hintText: 'Enter information',
                                    autofocus: true,
                                    focusNode: _focusAddInformation,
                                    readOnly: informationStore.readOnly,
                                    validator: fieldIsNotEmpty,
                                    onTap: () {
                                      informationStore.setReadOnly(false);
                                      _focusAddInformation.requestFocus();
                                    },
                                    onEditingComplete: () {
                                      if (formKeyHome.currentState!
                                          .validate()) {
                                        informationStore.setReadOnly(true);
                                        informationStore.addInformation();
                                      }
                                    },
                                    onTapOutside: (value) =>
                                        informationStore.setReadOnly(true),
                                    controller:
                                        informationStore.informationController,
                                    onChanged: informationStore.setInformation,
                                    suffixIcon:
                                        informationStore.isInformationValid
                                            ? IconButton(
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: secondaryColor,
                                                ),
                                                onPressed: () {
                                                  if (formKeyHome.currentState!
                                                      .validate()) {
                                                    informationStore
                                                        .addInformation();

                                                    informationStore
                                                        .setReadOnly(true);
                                                    _focusAddInformation
                                                        .requestFocus();
                                                  }
                                                },
                                              )
                                            : null,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: Observer(
                                builder: (context) {
                                  return ListView.builder(
                                    itemCount: listInformation.length,
                                    itemBuilder: (context, index) {
                                      final information = informationStore
                                          .informationList[index];
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: size.width * .45,
                                                child: Text(
                                                  information.information!,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              IconButton(
                                                onPressed: () {
                                                  informationStore
                                                      .setInformationValue(
                                                    currentFilterItemIndex:
                                                        index,
                                                  );
                                                  informationStore
                                                      .setReadOnly(false);
                                                  showEditDialog(
                                                    context,
                                                    size,
                                                    informationStore
                                                        .informationControllerEdit,
                                                    informationStore.readOnly,
                                                    onSaved: () {
                                                      informationStore
                                                          .editInformation(
                                                        index: index,
                                                      );
                                                      informationStore
                                                          .setReadOnly(true);
                                                      _focusAddInformation
                                                          .requestFocus();
                                                      Navigator.pop(context);
                                                    },
                                                    onClosed: () {
                                                      informationStore
                                                          .setReadOnly(true);
                                                      _focusAddInformation
                                                          .requestFocus();
                                                      Navigator.pop(context);
                                                    },
                                                    validator: fieldIsNotEmpty,
                                                  );
                                                },
                                                icon: const Icon(Icons.edit),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  informationStore
                                                      .setInformationValue(
                                                    currentFilterItemIndex:
                                                        index,
                                                  );
                                                  showDeleteDialog(
                                                    context,
                                                    size,
                                                    informationStore
                                                        .informationControllerEdit,
                                                    onDelete: () {
                                                      informationStore
                                                          .setReadOnly(true);
                                                      informationStore
                                                          .removeInformation(
                                                              index: index);
                                                      Navigator.pop(context);
                                                    },
                                                    onClosed: () {
                                                      informationStore
                                                          .setReadOnly(true);
                                                      _focusAddInformation
                                                          .requestFocus();
                                                      Navigator.pop(context);
                                                    },
                                                  );
                                                },
                                                icon: const Icon(Icons.delete),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: CustomRichText(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showEditDialog(
  BuildContext context,
  Size size,
  TextEditingController informationControllerEdit,
  bool readOnly, {
  required Function() onSaved,
  required Function() onClosed,
  required String? Function(String?)? validator,
}) {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        backgroundColor: Colors.tealAccent.shade700,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Edit Information',
              style: TextStyle(
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: CustomTextFormField(
          maxLength: 100,
          minLines: 6,
          maxLines: null,
          controller: informationControllerEdit,
          autofocus: true,
          readOnly: readOnly,
          validator: validator,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtom(
                isBorder: true,
                onPressed: onSaved,
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
              CustomButtom(
                isBorder: true,
                onPressed: onClosed,
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}

void showDeleteDialog(
  BuildContext context,
  Size size,
  TextEditingController informationControllerEdit, {
  required Function() onDelete,
  required Function() onClosed,
}) {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        backgroundColor: Colors.tealAccent.shade700,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Delete Information?',
              style: TextStyle(
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: CustomTextFormField(
          maxLength: 100,
          minLines: 6,
          maxLines: null,
          controller: informationControllerEdit,
          readOnly: true,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtom(
                isBorder: true,
                onPressed: onDelete,
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
              CustomButtom(
                isBorder: true,
                onPressed: onClosed,
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}
