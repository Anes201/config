for file in .*; do
  [ -f "$file" ] && [ "${file#*.}" != "$file" ] && ln -sf "$(pwd)/$file" ~/
done
