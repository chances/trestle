import 'package:trestle/gateway.dart';
import 'session.dart';

final InMemoryDriver driver = new InMemoryDriver();

main() => session(driver, (Gateway gateway) async {
  await gateway.create('users', (Schema schema) {
    schema.id();
    schema.string('first_name').nullable(false);
    schema.string('last_name').nullable(false);
    schema.string('nick_name').nullable(true);
    schema.int('age');
    schema.int('address_id')
        .references('addresses')
        .onDelete('set null');
  });

  await gateway.alter('users', (Schema schema) {
    schema.delete('nick_name');
  });

  await gateway.create('addresses', (Schema schema) {
    schema.id();
    schema.string('street').nullable(false);
    schema.int('age');
  });
});
