import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:self_food/controllers/menu_manager.dart';
import 'package:self_food/models/item_menu.dart';

class EditItem extends StatefulWidget {
  const EditItem({ Key? key,this.itemMenu }) : super(key: key);
  final ItemMenu? itemMenu;
  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  TextEditingController nameItem = TextEditingController();
  TextEditingController imageItem = TextEditingController();
  bool select = false;

  @override
  Widget build(BuildContext context) {
    nameItem.text=widget.itemMenu!.nome!;
    imageItem.text=widget.itemMenu!.imagem!;
    select = widget.itemMenu!.disponivel!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar item do cardápio'),
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
                        context.read<MenuManager>().editItem(
                            ItemMenu(
                              imagem: imageItem.text,
                              nome: nameItem.text,
                              disponivel: select,
                              id: widget.itemMenu!.id,
                            ), onSuccess: () {
                          Fluttertoast.showToast(
                              msg: "Editado com sucesso",
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
