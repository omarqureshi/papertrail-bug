class CreateUsers < ActiveRecord::Migration
  def up
    execute <<EOS
create table users(
  id serial not null,
  name text,
  schedule bit(7) default B'1111111',
  primary key(id)
);
EOS
  end
end
