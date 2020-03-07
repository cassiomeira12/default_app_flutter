abstract class Crud<T> {

  Future<T> create(T item);

  Future<T> read(T item);

  Future<T> update(T item);

  Future<T> delete(T item);

}