import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:self_food/controllers/menu_manager.dart';
import 'package:self_food/models/item_menu.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController nameItem = TextEditingController();
  TextEditingController imageItem = TextEditingController();
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar item ao cardápio'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 208, 0, 24),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: TextFormField(
                controller: nameItem,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.grey[400],
                  labelText: 'Digite o nome do item:',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: TextFormField(
                controller: imageItem,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.grey[400],
                  labelText: 'Digite o link da foto:',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            SwitchListTile(
              title: Text('Disponível'),
              onChanged: (bool value) {
                setState(() {
                  select = value;
                });
              },
              value: select,
            ),
            Consumer<MenuManager>(
              builder: (_, menuManager, __) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                  child: Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<MenuManager>().itemRegister(
                            ItemMenu(
                              imagem: imageItem.text,
                              nome: nameItem.text,
                              disponivel: select,
                            ), onSuccess: () {
                          Fluttertoast.showToast(
                              msg: "Salvo com sucesso",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0);

                          Navigator.pop(context);
                        });
                      },
                      child: menuManager.loading
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : Text('Salvar'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[900],
                        elevation: 10,
                        shadowColor: Colors.red[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
