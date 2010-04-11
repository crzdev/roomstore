class AddUsers < ActiveRecord::Migration
  def self.up

    su = User.new()
    su.login = "user"
    su.name = "simple"
    su.surname = "user"
    su.type = "SimpleUser"
    su.password = "user"
    su.password_confirmation = "user"
    su.save

    ru = User.new()
    ru.login = "root"
    ru.name = "root"
    ru.surname = "user"
    ru.type = "Root"
    ru.password = "root"
    ru.password_confirmation = "root"
    ru.save

  end

  def self.down
  end
end
