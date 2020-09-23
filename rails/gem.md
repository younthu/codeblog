# 列出所有的dependency
gem dep(endency)

# 列出所有rails 依赖的gems
gem dep rails

# 列出反向依赖，看谁依赖了devise
gem dep -R devise